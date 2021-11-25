# 2. Leia o arquivo MB_gene_epression.txt atribuindo o data.frame resultante para uma matrix numérica. 
# Ele contém informações da expressão de vários genes (linhas) em várias amostras (colunas). 
# Leia o arquivo MB_pData_rib.txt atribindo o data.frame resultante para uma variável. 
# Note que a ordem das colunas da matriz de expressão é a mesma ordem do IDs dos pacientes na tabela das informações clínicas e patológicas. 
# Crie funções para:
#  a. Fazer a estatística da expressão de cada um dos genes para o o seguinte teste de hipótese (usar o teste t):
#    H0: a expressão do gene xi nas amostras do gupo A == a expressão do gene xi nas amostras do grupo B;
#    H1: a expressão do gene xi nas amostras do gupo A != a expressão do gene xi nas amostras do grupo B;
# b. Criar um boxplot para cada um dos genes diferencialmente expressos (considere o valor de p< 0.05).
install.packages("stringr rstudioapi")
library(rstudioapi)
library(stringr)

working_directory <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(working_directory)

# Ler o arquivo mb_gene_expression.txt
genes_expression <- read.delim("MB_gene_epression.txt")
# Converter o data.frame resultante para uma matrix numérica
genes_expression_matrix <- as.matrix(genes_expression)

# Ler o arquivo MB_pData_rib.txt
dados_paciente <- read.delim("MB_pData_rib.txt")

dados_paciente$PATIENT_ID <- str_replace_all(dados_paciente$PATIENT_ID, '-', '.' )

pacientes_ER_pos <- dados_paciente[dados_paciente$ER_IHC=="pos",]
pacientes_ER_neg <- dados_paciente[dados_paciente$ER_IHC=="neg",]

gerar_boxplot <- function (titulo, cjto_dados){
  #png(file=paste(titulo,".png"))
  print("GERANDO BOXPLOT...")
  boxplot(cjto_dados, main=titulo)
 #dev.off
}

teste_hipotese <- function(genes_expression, pacientes_ER_pos, pacientes_ER_neg) {
  genes_ER_pos <- matrix()
  genes_ER_neg <- matrix()
  for (i in 1:1867) {
    if (is.element(names(genes_expression)[i], pacientes_ER_pos$PATIENT_ID) )
    {
      genes_ER_pos <- cbind(genes_ER_pos, genes_expression[i])
    }
    else
    {
      genes_ER_neg <- cbind(genes_ER_neg, genes_expression[i])
    }
  }
  genes_ER_pos<-genes_ER_pos[ ,-c(1)]
  genes_ER_neg<-genes_ER_neg[ ,-c(1)]
  pos_transposta <- t(genes_ER_pos)
  neg_transposta <- t(genes_ER_neg)
  for(i in 1:45){
    result <- t.test(pos_transposta[, i], neg_transposta[, i])
    expr_gene <- union(pos_transposta[,i], neg_transposta[, i])
    if (result$p.value < 0.05) {
      gene <- paste(i, " - ", colnames(pos_transposta)[i])
      print(gene)
      print(result)
      gerar_boxplot(gene, expr_gene)
    }
  }
}

teste_hipotese(genes_expression, pacientes_ER_pos, pacientes_ER_neg)
