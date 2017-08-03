## Analysis of Gabriela's Trichoderma data

##@knitr getData
setwd("~/GitHub/Ecuador/ExptalData/Gabriela")
rm(list=ls()) # Clears the global environment
library(readxl)
trichData <- as.data.frame(read_excel("DataBaseNono.xlsx", 'Data'))
summary(trichData)

for (i in c('Trt','Rep','Rpt')) trichData[,i] <- factor(trichData[,i])
levels(trichData$Trt) <- c('TrichGH','TrichFd','TestigoGH','TestigoFd')

library(lattice) # these days most people use ggplot2
xyplot(Ufc~Mst | Trt, data=trichData, group=Dlc, pch=16, auto.key = TRUE) # suggests -2 Dlc best
xyplot(Cln~Mst | Trt, data=trichData[trichData$Dlc==-2,], group=Rep)
xyplot(sqrt(Cln)~Mst | Trt, data=trichData[trichData$Dlc==-2,], group=Rep)
