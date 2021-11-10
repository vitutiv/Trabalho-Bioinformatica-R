setwd("C:/Users/jterr/Documents/USP trabalhos/FIgenomica/Trabalho-Bioinformatica-R")
genes_expre <- read.delim("MB_gene_epression.txt")
matrix_gene_expre <- matrix(genes_expre)
dados_paciente <- read.delim("MB_pData_rib.txt")
pacientes_ER_pos=dados_paciente[dados_paciente$ER_IHC=="pos",]
pacientes_ER_neg=dados_paciente[dados_paciente$ER_IHC=="neg",]

t.test(genes_expre, dados_paciente)


