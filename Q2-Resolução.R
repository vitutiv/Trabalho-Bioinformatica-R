setwd("C:/Users/jterr/Documents/USP trabalhos/FIgenomica/Trabalho-Bioinformatica-R")
library(stringr)
genes_expre <- read.delim("MB_gene_epression.txt")
matrix_gene_expre <- matrix(genes_expre)
dados_paciente <- read.delim("MB_pData_rib.txt")
pacientes_ER_pos=dados_paciente[dados_paciente$ER_IHC=="pos",]
pacientes_ER_neg=dados_paciente[dados_paciente$ER_IHC=="neg",]
genes_ER_neg<-matrix(448:50)
genes_ER_pos<-matrix(1447:50)

for (i in 1:1867) {
  str_replace_all(dados_paciente$ER_IHC[i], '-', '.')
  
}


t.test(genes_expre, dados_pacie)

if (pacientes_ER_pos$PATIENT_ID[i]==dados_paciente$PATIENT_ID[i]) {
  for(j in 1:45)
  {
    genes_ER_pos<-matrix_gene_expre[i,j]
  }
}
else
{
  for(j in 1:45)
  {
    genes_ER_neg<-matrix_gene_expre[i,j]
  }
}
