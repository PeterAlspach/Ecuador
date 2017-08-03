## Analysis of Michelle's Trichoderma data

##@knitr getData
setwd('~/GitHub/Ecuador/ExptalData/Michelle')
library(readxl)
bbYld17 <- as.data.frame(read_excel("bbData2017.xlsx", sheet='Datos'))
# bbTrich <- as.data.frame(read_excel("TrichodermBlackberry.xlsx"))

# Convert character columns to factors
for (i in c('NumPlanta','Loc','Treat','Rep')) bbYld17[,i] <- factor(bbYld17[,i])
levels(bbYld17$Treat) <- c('Trichoderma','Testigo')
levels(bbYld17$Loc) <- c('Huachi','Pillaro','Tisaleo')

# for (i in names(bbTrich)[sapply(bbTrich, class)=='character']) bbTrich[,i] <- factor(bbTrich[,i])

## Artificially add another harvest which will be the same as the first but with a bit of noise
nR <- nrow(bbYld17)
bbYld17a <- bbYld17[rep(1:nR, 2),]
bbYld17a$Fecha <- rep(1:2, each=nR)
bbYld17a[-(1:nR),'NFrutos'] <- bbYld17a[-(1:nR),'NFrutos']+sample(1:20, nR, replace=TRUE)
bbYld17a[-(1:nR),'PesoPlanta'] <- bbYld17a[-(1:nR),'PesoPlanta']+sample(1:50, nR, replace=TRUE)
bbYld17a$PesoFrut <- bbYld17a$PesoPlanta/bbYld17a$NFrutos

## Get total harvest and average fruit weight
bbAgg17 <- aggregate(bbYld17a[,c("PesoPlanta","NFrutos")], bbYld17a[,c("Ind","Treat",'Loc','Rep',"NumPlanta")],
                     sum, na.rm=TRUE)
bbAgg17$PesoFrut <- bbAgg17$PesoPlanta/bbAgg17$NFrutos
bbMiss17 <- aggregate(bbYld17a[,c("PesoPlanta","NFrutos")], bbYld17a[,c("Ind","Treat",'Loc','Rep',"NumPlanta")],
                      function(x) length(x[!is.na(x)]))
apply(bbMiss17[,-1], 2, table) # Check to see if the were any missing values
# If there is missing data use loess() to interpolated [paalspach@gmail.com]

##@knitr plotData
plot(jitter(as.numeric(bbAgg17$Loc), 0.5), bbAgg17$PesoPlanta,
     col=bbAgg17$Treat, xlab='Localidad', ylab='Peso/planta (g)',
     xaxt='n', pch=16)
# Note: using jitter() adds some random noise and reduces overlap
axis(1, 1:3, levels(bbAgg17$Loc)) # customise x-axis
pc <- par()$usr # coordinates of the plot corners
legend(1, pc[4]+(pc[4]-pc[3])/5,
       levels(bbAgg17$Treat), pch=16, col=1:2, bty='n', ncol=2, xpd=TRUE)      

plot(jitter(as.numeric(bbAgg17$Loc), 0.5), bbAgg17$PesoFrut,
     col=bbAgg17$Treat, xlab='Localidad', ylab='Peso/fruto (g)',
     xaxt='n', pch=16)
axis(1, 1:3, levels(bbAgg17$Loc)) # customise x-axis
pc <- par()$usr # coordinates of the plot corners
legend(1, pc[4]+(pc[4]-pc[3])/5,
       levels(bbAgg17$Treat), pch=16, col=1:2, bty='n', ncol=2, xpd=TRUE)      

# Identify any suspect points for checking
# toChk <- identify(as.numeric(bbAgg17$Loc), bbAgg17$PesoFrut)

##@knitr fitMM
library(lme4)
# First aggregate the 6 plants
bbAgg17p <- aggregate(bbAgg17[,c("PesoPlanta","NFrutos","PesoFrut")], bbYld17[,c("Treat",'Loc','Rep')],
                      mean, na.rm=TRUE)

mm1 <- lmer(PesoPlanta~Treat+(1|Loc)+(1|Loc:Rep), data=bbAgg17p)
# mm1 <- lmer(Yield~poly(n, 2)+Treatment+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
# mm1 <- lmer(Yield~Treatment+n+(1|Localidad)+(1|Localidad:Replication),
#             data=bbTrich)
plot(mm1)
summary(mm1)
anova(mm1)
confint(mm1, 'TreatTestigo')

mm2 <- lmer(PesoPlanta~Treat+Treat:Loc+(1|Loc)+(1|Loc:Rep), data=bbAgg17p)
plot(mm2)
summary(mm2)
anova(mm2)
confint(mm2, 'TreatTestigo') # location Huachi
confint(mm2, 'TreatTrichoderma:LocPillaro')
confint(mm2, 'TreatTrichoderma:LocTisaleo')

# See bbTrichMMAnalysis2016 for prediction method