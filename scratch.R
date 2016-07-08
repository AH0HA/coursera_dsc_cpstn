library(taRifx)

str(xvocab$vocab$terms)

str(xvocab$vocab$terms_count)

str(xvocab$vocab)

length(xvocab$vocab$terms)

length(xvocab$vocab$terms_count)


#https://github.com/dhashman/datasciencecapstone/blob/master/capstone.Rpres

#https://github.com/mhnierhoff/CapstoneCoursera

#xng<-cbind(xvocab$vocab$terms,xvocab$vocab$terms_count)

#xng = cbind(data.frame(c(10, 20)), xvocab$vocab$terms_count)

x = cbind.data.frame(c(xvocab$vocab$terms), c(xvocab$vocab$terms_count))

library(tm)

colnames(x)=c('terms','cnt')

library(taRifx)
xs<-sort(x, f= ~ -cnt )

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