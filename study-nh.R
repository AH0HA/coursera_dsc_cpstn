final4Data <- readRDS(file="./data/final4Data.RData")
final3Data <- readRDS(file="./data/final3Data.RData")
final2Data <- readRDS(file="./data/final2Data.RData")


library(taRifx)
xx<-sort(final4Data, f= ~ frequency )

str(final3Data)

min(final3Data$frequency)#4
min(final4Data$frequency)#3
min(final2Data$frequency)#4

head(final3Data)
head(final4Data)

qtext<-'hello my name'

qtextInput <- cleanInput(qtext)
qwordCount <- length(qtextInput)
qwordPrediction <- nextWordPrediction(qwordCount,qtextInput)
