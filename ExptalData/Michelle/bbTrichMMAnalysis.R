## Analysis of Michelle's Trichoderma data

##@knitr getData
setwd('~/GitHub/Ecuador/ExptalData/Michelle')
library(readxl)
bbYield <- as.data.frame(read_excel("blackberryData.xlsx"))
bbTrich <- as.data.frame(read_excel("TrichodermBlackberry.xlsx"))
# Convert character columns to factors
for (i in names(bbYield)[sapply(bbYield, class)=='character']) bbYield[,i] <- factor(bbYield[,i])
for (i in names(bbTrich)[sapply(bbTrich, class)=='character']) bbTrich[,i] <- factor(bbTrich[,i])

##@knitr plotData
plot(as.numeric(bbTrich$Localidad), bbTrich$Yield,
     col=bbTrich$Treatment, xlab='Locality', ylab='Yield',
     xaxt='n', pch=16)
axis(1, 1:3, levels(bbTrich$Localidad)) # customise x-axis
legend(2.5, 21000, levels(bbTrich$Treatment), pch=16, col=1:2, bty='n')      

# toChk <- identify(as.numeric(bbTrich$Localidad), bbTrich$Yield)
bbTrich <- bbTrich[order(bbTrich$Localidad, bbTrich$Treatment, bbTrich$Replication),]
bbTrich$n <- as.vector(table(bbYield$replication, bbYield$treatment, bbYield$Localities))

##@knitr fitMM
library(lme4)
mm1 <- lmer(Yield~n+Treatment+(1|Localidad)+(1|Localidad:Replication),
            data=bbTrich)
# mm1 <- lmer(Yield~poly(n, 2)+Treatment+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
# mm1 <- lmer(Yield~Treatment+n+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
plot(mm1)
summary(mm1)
anova(mm1)
confint(mm1, 'n')
confint(mm1, 'TreatmentTrichoeb')

# Predictions
newData <- bbTrich[,c('Localidad','Replication','Treatment','n')]
newData$n <- 18
newData$preds <- predict(mm1, newdata=newData)
tapply(newData$preds, newData[,c("Localidad","Treatment")], mean)

mm2 <- lmer(Yield~n+Treatment*Localidad+(1|Localidad)+(1|Localidad:Replication),
            data=bbTrich)
# mm1 <- lmer(Yield~poly(n, 2)+Treatment+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
# mm1 <- lmer(Yield~Treatment+n+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
plot(mm2)
summary(mm2)
anova(mm2)
confint(mm2, 'n')
confint(mm2, 'TreatmentTrichoeb')
confint(mm2, 'TreatmentTrichoeb:LocalidadPillaro')
confint(mm2, 'TreatmentTrichoeb:LocalidadTisaleo')

newData$preds2 <- predict(mm2, newdata=newData)
tapply(newData$preds2, newData[,c("Localidad","Treatment")], mean)
