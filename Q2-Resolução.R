setwd("C:/Users/jterr/Documents/USP trabalhos/FIgenomica/Trabalho-Bioinformatica-R")
install.packages("stringr")
library(stringr)
genes_expre <- read.delim("MB_gene_epression.txt")
matrix_gene_expre <- matrix(genes_expre)
dados_paciente <- read.delim("MB_pData_rib.txt")
dados_paciente$PATIENT_ID<-str_replace_all(dados_paciente$PATIENT_ID, '-', '.' )
pacientes_ER_pos=dados_paciente[dados_paciente$ER_IHC=="pos",]
pacientes_ER_neg=dados_paciente[dados_paciente$ER_IHC=="neg",]
c=0
for (i in 1:1867) {
  if (pacientes_ER_pos$PATIENT_ID[i]==names(genes_expre)[i])
  {
      genes_ER_pos<-genes_expre[]
  }
  else
  {
      genes_ER_neg<-
  }
}

t.test(genes_ER_pos, genes_ER_neg)

