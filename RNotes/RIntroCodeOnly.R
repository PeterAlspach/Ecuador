## R search
search()

## R ls
ls() # illustrate the TAB key here
ls(pos=7)
ls('package:stats')

## R wd
getwd()
list.files()
setwd('C:/Users/Peter Alspach/Documents/GitHub/Ecuador/DataManagement') # note: forward slash
list.files()
setwd('C:/Users/Peter Alspach/Documents/GitHub/Ecuador/RNotes') # note: forward slash
list.files()

## R lib
search()
library(DiGGer)
search() # DiGGer is now in the search path

## R help
help(ls)
?ls

## R obj
rm(list=ls()) # remove objects from the Global Environment (there probably aren't any)
ls() # check that nothing is there
c(1,3,4,7,2) # a vector with 5 integer elements is printed on the console window
ls() # but not saved
x <- c(1,3,4,7,2) # RStudio shortcut for the assignment operator is alt-
ls() # there is now an obect call x
ls.str() # this all gives the structure of the objects
print(x) # to run the print method for the object
x # shortcut for print(x)

## R readxl
library(readxl)
?read_excel
examp3 <- read_excel('../DataManagement/ExerciseExample3.xls', 'Data', skip=7)
ls.str() # this is a 'tibble' which I don't like so ...
examp3 <- as.data.frame(examp3) # convert to a pure data.frame
# examp3 <- as.data.frame(read_excel('../DataManagement/ExerciseExample3.xls',
#                                    'Data', skip=7))
str(examp3)

## R examp3.1
examp3
head(examp3) # just the first few rows
tail(examp3) # just the last few rows

## R subset
dim(examp3) # 40 rows by 8 columns
examp3[1,] # first row.  Note square brackets [] for subsetting
examp3[1:3,] # first three rows
# What about the first column?
# Columns 2-4?
# The element in the first row, third column?
# Rows 1 and 3 (i.e., excluding 2)?
examp3[,3]          # these are ...
examp3[,'Cultivar'] # ... all the same ...
examp3$Cultivar     # ... thing

## R summary
summary(examp3)
table(examp3) # gives a 8-way cross table which is not what we want
table(examp3[,3]) # that's better but a bit tedious for all columns
apply(examp3, 2, table) # apply(), and related functions, are useful

## R condSubs
examp3[examp3$Cultivar=='Cask',]
examp3[examp3$Wgt > 14,]
# Missing values are special
examp3[examp3$Wgt==NA,] # not what we want
examp3[is.na(examp3$Wgt),] # that's better
examp3[examp3$Wgt > 14 & !is.na(examp3$Wgt),]
examp3[examp3$Cultivar=='Cask' | examp3$Cultivar=='County',] # | for or
examp3[examp3$Cultivar %in% c('Cask','County'),]
examp3[substring(examp3$Cultivar, 1, 1)=='C',]
examp3[regexpr('[[:digit:]]', examp3$Cultivar)>0,]

## R types1
str(examp3)
# Currently, `Rep` is numeric whereas it really should be a factor variate.  That is, there is no reason to think of the value of Rep 1 as being half that of Rep 2.  They are just different categories.
examp3$Rep <- as.factor(examp3$Rep)
str(examp3)
examp3$Rep

## R factors
(tc <- rep(c('one','two','three'), 2))
# The code above introduces two new features: the rep() function and the implied
# print() call achieve by wrapping the entire line in brackets ().
str(tc) # a character vector with 6 elements
tc+1 # generates an error since addition makes no sense for character vectors
levels(tc) # NULL since character vectors don't have levels
as.numeric(tc) # all missing

(tf <- as.factor(tc)) # by default levels are in alphabetical order of labels
str(tf) # a factor with 3 levels
tf+1 # generates an error 
as.numeric(tf) # gives numbers, which are the level values (not level labels)

(tf1 <- factor(tc, levels=c('one','two','three'))) # override alphabetical default
as.numeric(tf1)

(tf2 <- factor(tc, levels=c('one','two','three','four'))) # override alphabetical default
tc[tc=='two'] <- 'four'
tf[tf=='two'] <- 'four'
tf1[tf1=='two'] <- 'four'
tf2[tf2=='two'] <- 'four'
data.frame(original=rep(c('one','two','three'), 2), tc=tc,
           tf=tf, tf1=tf1, tf2=tf2, stringsAsFactors=FALSE)
tf # still has 'two' as a factor level even though it is no longer used
factor(tf) # has dropped the unused factor level

# Beware the following trap
(trap <- factor(c(8.9, 9.8, 10.1)))
as.numeric(trap) # gives the level values
as.numeric(as.character(trap)) # by first converting to character this is avoided

## R dw
examp3$DW <- examp3$Wgt/(1+examp3$Moist/100)
examp3$DWtha <- 10*examp3$DW/(12.8*1.62) # should get plot size from spreadsheet
head(examp3[,-c(1,8)])

## R save
# save(RObj1, RObj2, ..., file='myObjects.RData')
# load('myObjects.RData')

## R writing
filePath <- '../RNotes'
filename <- paste0(filePath, '/Example3')

write.table(examp3, paste0(filename, '.txt'), sep='\t', na='*')

library(openxlsx) # if not installed get from CRAN
# installr::install.rtools() # requires installr from CRAN.  Takes about 10-15 minutes
write.xlsx(examp3, paste0(filename, '.xlsx'), sheetName='Example3 from openxlsx',
           keepNA=TRUE, firstRow=TRUE)

## R pkgGraphics
ls('package:graphics')

## R ooPlot
plot(examp3$Maturity, examp3$DW)
plot(factor(examp3$Maturity), examp3$DW)

## R scatPlot, fig.height=10
par(mfrow=c(2,1))
plot(examp3$Height, examp3$DW, xlab='Plant height (cm)', ylab='Yield (DW kg/plot)',
     pch=16)
par(mgp=c(2, 0.8, 0), font.axis=3, font.lab=8)
plot(jitter(examp3$Height, 0.2), examp3$DW, xlab='Plant height (cm)', ylab='Yield (DW kg/plot)',
     pch=16, col=colorRampPalette(c('pink', 'darkred'))(3)[examp3$Maturity])


########################## Linear models

## R aov, results=TRUE, fig.height=8
par(mfrow=c(2,2))
examp3$Cultivar <- factor(examp3$Cultivar)
ex3AOV <- aov(DW~Maturity*Cultivar+Rep, data=examp3)
plot(ex3AOV)
anova(ex3AOV)

## R lm, results=TRUE, fig.height=8
par(mfrow=c(2,2))
ex3LM <- lm(DW~Maturity*Cultivar+Rep, data=examp3)
plot(ex3LM)
anova(ex3LM)

ex3LM <- lm(DW~Maturity+Cultivar+Rep, data=examp3)
plot(ex3LM)
anova(ex3LM)
ND <- expand.grid(Cultivar=levels(examp3$Cultivar), Rep=1:4, Maturity=1:3)
ND$Rep <- factor(ND$Rep)
lmPred <- predict(ex3LM, newdata=ND, se=TRUE)
ND$pred <- lmPred$fit
ND$se <- lmPred$se.fit

par(mfrow=c(1,1))
plot(tapply(examp3$DW, examp3$Cultivar, mean, na.rm=TRUE),
     tapply(ND$pred, ND$Cultivar, mean, na.rm=TRUE),#lmPred$fit,
     xlab='Simple cultivar mean', ylab='LM predictions',
     panel.first=abline(0, 1, col='brown', lty='dashed'))

