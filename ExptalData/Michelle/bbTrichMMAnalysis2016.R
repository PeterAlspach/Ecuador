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
# Assuming the reason for the difference in harvest numbers is nothing to do with the treatment
mm1 <- lmer(Yield~n+Treatment+(1|Localidad)+(1|Localidad:Replication),
            data=bbTrich)
# mm1 <- lmer(Yield~poly(n, 2)+Treatment+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
# mm1 <- lmer(Yield~Treatment+n+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
plot(mm1)
summary(mm1)
anova(mm1)
fixef(mm1)
confint(mm1, 'n')
confint(mm1, 'TreatmentTrichoeb')

# Predictions
newData <- bbTrich[,c('Localidad','Replication','Treatment','n')]
newData$n <- 18
newData$preds <- predict(mm1, newdata=newData)
tapply(newData$preds, newData[,c("Localidad","Treatment")], mean)

mm2 <- lmer(Yield~n+Treatment+Treatment:Localidad+(1|Localidad)+(1|Localidad:Replication),
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

## Related trichoderm populations to yield
# Total trichoderma counts versus predicted total yield (from mm2)
ttYld <- aggregate(newData$preds2, newData[,c("Localidad","Treatment","Replication")], mean)
ttMerge <- merge(ttYld, bbTrich)
par(mgp=c(2,0.8,0))
plot(apply(ttMerge[ttMerge$Treatment=='Trichoeb', grep('onth', names(ttMerge))], 1, sum),
     ttMerge[ttMerge$Treatment=='Trichoeb','x']/1000, xlab='Total trichomderma count',
     ylab='Predicted yield (kg/plant)', col=ttMerge[ttMerge$Treatment=='Trichoeb','Localidad'],
     pch=16)
pc <- par()$usr
legend(pc[1], pc[4]+(pc[4]-pc[3])/5, levels(ttMerge$Localidad), pch=16, col=1:3, bty='n',
       ncol=3, xpd=TRUE)

# First sum the yields by month
bbYldM <- aggregate(bbYield[,'Yield'], bbYield[,c("Localities","treatment","Date","replication")],
                    mean, na.rm=TRUE)
