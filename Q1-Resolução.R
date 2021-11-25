#1. Existem 5 arquivos em txt com o sufixo filtro_. Eles são experimentos da relação entre a intensidade e o comprimento de onda utilizando diferentes cores de filtros. Crie funções em R para:
#    a. Ler todos os arquivos e criar um objeto do tipo data.frame com informações de todos os experimentos com cada um dos filtros;
#    b. Gerar um único gráfico de linhas com os dados do experimentos de todos os filtros com o comprimento de onda no eixo x e a intensidade no eixo y;
install.packages("rstudioapi")
library(rstudioapi)
working_directory <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(working_directory)
lista <- list.files(pattern="filtro")
datalist <- lapply(lista, function(x)read.table(x, skip=5, header=T))
dataframe <- do.call("rbind", datalist) 
plot(x=dataframe$Wavelength.nm., y=dataframe$Intensity, xlab = "comprimento de onda(nm)", ylab = "intensidade") 
lines(x=dataframe$Wavelength.nm., y=dataframe$Intensity, xlab = "comprimento de onda(nm)", ylab = "intensidade", col="red") 
#corrigir, grafico de pontos (geom_line)