setwd("C:/Users/jterr/Documents/USP trabalhos/FIgenomica/Trabalho-Bioinformatica-R")
genes_expre <- read.delim("MB_gene_epression.txt")
matrix_gene_expre <- matrix(genes_expre)
dados_paciente <- read.delim("MB_pData_rib.txt")
pacientes_ER_pos=dados_paciente[dados_paciente$ER_IHC=="pos",]
pacientes_ER_neg=dados_paciente[dados_paciente$ER_IHC=="neg",]
for (i in 1:1867) {
  if (pacientes_ER_pos$PATIENT_ID==names(genes_expre)[i]) {
    c=c+1
    
  }
}
print(c)
#genes_ER_pos=genes_expre["MB-0002"==pacientes_ER_pos[1,]$PATIENT_ID]

t.test(genes_expre, dados_paciente)


