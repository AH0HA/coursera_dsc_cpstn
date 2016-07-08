library(taRifx)

str(xvocab$vocab$terms)
x4vocab
x4vocab$vocab$terms[1:10]
x4vocab$vocab$terms_count[1:10]

str(xvocab$vocab$terms_count)

str(xvocab$vocab)

length(xvocab$vocab$terms)

length(xvocab$vocab$terms_count)


library(data.table)
#https://github.com/dhashman/datasciencecapstone/blob/master/capstone.Rpres

#https://github.com/mhnierhoff/CapstoneCoursera

#xng<-cbind(xvocab$vocab$terms,xvocab$vocab$terms_count)

#xng = cbind(data.frame(c(10, 20)), xvocab$vocab$terms_count)

x = cbind.data.frame(c(xvocab$vocab$terms), c(xvocab$vocab$terms_count))

min(final3Data$frequency)#4
min(final4Data$frequency)#3
min(final2Data$frequency)#4

library(tm)

colnames(x)=c('terms','cnt')

library(taRifx)
xs<-sort(x, f= ~ -cnt )
dim(xs)
library(pryr)
object_size(xs)
object_size(final3Data)

xs4<-subset(xs, xs$cnt >= 2)
#xxs2<-subset(xs, xs$cnt >= 50)
#rm(xxs)
#gc()
#dim(xxs)
#library(pryr)
#object_size(xxs2)

#strsplit(xs[1,1], "_")

#xs[1,1]
#strsplit(pangram, " ")

xs4key3<-strsplit(as.character(xs4[,1]), "_")

#head(final3Data)

df3 <- data.frame(matrix(unlist(xs4key3), nrow=length(xs4key3), byrow=T),stringsAsFactors=FALSE)

#strkey3<-as.data.frame(key3)

tail(df3,50)

object_size(df3)
df3<-cbind(df3,xs4$cnt)
#key3<-unlist(key3)

pangram <- "The quick brown fox jumps over the lazy dog"

c1<-c("one_of_the",3408)
c2<-c("a_lot_of",3039)
vlookup<-rbind(c1,c2)

library(pryr)
?object_size

rm(key3)
gc()

head(final2Data)

head(final4Data)
> key3[[1]][1]
[1] "one"
> key3[[1]][2]
[1] "of"
> key3[[1]][3]
[1] "the"


#xs<-cbind(do.call(rbind, strsplit(as.character(xs[,1]), "_")), xs[,2])

#xng<-sort()

#xng[ order(-dd[,4], dd[,1]), ]

#dd <- data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
#                            levels = c("Low", "Med", "Hi"), ordered = TRUE),
#                 x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
#                 z = c(1, 1, 1, 2))

#sort(dd, f= ~ -z + b )

#sxng<-xng[order(-xng$cnt)]



#BiGramToken = function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
#BiGramMatrix <- DocumentTermMatrix(CorpusSamp, control = list(tokenize = BiGramToken))
#Bigrams_Freq <- sort(colSums(as.matrix(removeSparseTerms(BiGramMatrix, 0.999))), decreasing = TRUE)
#Bigrams_Freq_df <- data.frame(word = names(Bigrams_Freq), frequency = Bigrams_Freq)
#plotFreq(Bigrams_Freq_df[1:30,],"Bigrams","30 Most Common Bigrams")