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
  if (pacientes_ER_pos$PATIENT_ID==names(genes_expre)[i])
  {
    c=c+1
    print(c)
  }
}

t.test(genes_expre, dados_pacie)

#if (pacientes_ER_pos$PATIENT_ID[i]==dados_paciente$PATIENT_ID[i]) {
#  for(j in 1:45)
#  {
#   genes_ER_pos<-matrix_gene_expre[i,j]
#  }
#}
#else
#{
 # for(j in 1:45)
  #{
   # genes_ER_neg<-matrix_gene_expre[i,j]
  #}
#}
