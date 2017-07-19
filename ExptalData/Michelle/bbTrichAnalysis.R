library(readxl)
bbYield <- read_excel("~/GitHub/Ecuador/ExptalData/Michelle/blackberryData.xlsx")
bbYield <- as.data.frame(bbYield)

bbTrich <- read_excel("~/GitHub/Ecuador/ExptalData/Michelle/TrichodermBlackberry.xlsx")
bbTrich <- as.data.frame(bbTrich)

# Plot the data
plot(as.numeric(factor(bbTrich$Localidad)), # have to convert the localities to numbers
     bbTrich$Yield,
     col=factor(bbTrich$Treatment)) # convert treatments to factors to use col

# points(1.5, 20000, pch=16, col=1, cex=1.2)
# points(1.5, 18000, pch=16, col=2, cex=1.4)
# points(1.5, 16000, pch=16, col=3, cex=1.8)

# Plot with better labels
plot(as.numeric(factor(bbTrich$Localidad)),
     bbTrich$Yield,
     col=factor(bbTrich$Treatment),
     xlab='Locality', ylab='Yield',
     xaxt='n', pch=16)
axis(1, 1:3, levels(factor(bbTrich$Localidad))) # customise x-axis
legend(2.5, 21000, levels(factor(bbTrich$Treatment)), pch=16, col=1:2, bty='n')      

(toChk <- identify(as.numeric(factor(bbTrich$Localidad)),
                   bbTrich$Yield))
bbTrich[toChk,]
bbYield[bbYield$Localities=='Huachi'&
          bbYield$treatment=='Trichoeb' &
          bbYield$replication=='C',]
str(bbYield)
bbYield[bbYield$Localities=='Huachi'&
          bbYield$treatment=='Trichoeb' &
          bbYield$replication=='2',]

length(bbYield[bbYield$Localities=='Huachi'&
          bbYield$treatment=='Trichoeb' &
          bbYield$replication=='1',"Yield"])

table(bbYield$replication, bbYield$treatment, bbYield$Localities)

## For illustration, conduct AoV on Tisaleo data only
tisData <- bbTrich[bbTrich$Localidad=='Tisaleo',]
tisAOV <- aov(Yield ~ Treatment+Replication, data=tisData)
# tisAOV <- aov(Yield ~ Treatment+Replication, data=bbTrich,
#               subset=bbTrich$Localidad=='Tisaleo')
par(mfrow=c(2,2))
plot(tisAOV)
anova(tisAOV)
model.tables(tisAOV, type='mean', se=TRUE)      


