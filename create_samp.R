create_samp <-function(mydir = '/home/rstudio/final/en_US',sample_rate= 0.1,myseed=123){
#mydir <-'./final/en_US'
  
  
setwd(mydir)  
files<-list.files()

xCorpusSamp<-NULL
set.seed(myseed)

for (i in seq(files)) {
  #print(files[i])
  

  fline<-readLines(files[i], encoding = "UTF-8", skipNul = TRUE)
  fline<-iconv(fline, "latin1", "ASCII", sub="")
#blogs <- readLines("en_US.blogs.txt", encoding = "UTF-8", skipNul = TRUE)
#news <- readLines("en_US.news.txt", encoding = "UTF-8", skipNul = TRUE)
#twitter <- readLines("en_US.twitter.txt", encoding = "UTF-8", skipNul = TRUE)


#http://rstudio-pubs-static.s3.amazonaws.com/189180_ae48d991c954445681d9c2c18488c3a2.html

#http://www.rpubs.com/Albert_Shuxiang_Li/162819


#blogs <- iconv(blogs, "latin1", "ASCII", sub="")
#news <- iconv(news, "latin1", "ASCII", sub="")
#twitter <- iconv(twitter, "latin1", "ASCII", sub="")

#sample_rate<-0.01

#blogsSamp <- sample(blogs, length(blogs) * sample_rate)
#newsSamp <- sample(news, length(news) * sample_rate)
#twitterSamp <- sample(twitter, length(twitter) * sample_rate)
#CorpusSamp <- c(blogsSamp,newsSamp,twitterSamp)
#CorpusSamp <- c(blogsSamp,newsSamp)
  xsamp<-sample(fline, length(fline) * sample_rate)
xCorpusSamp <- c(xCorpusSamp,xsamp)
}#end for
return (xCorpusSamp)
}#end create_samp

#CorpusSamp <- VCorpus(VectorSource(CorpusSamp))
#CorpusSamp <- tm_map(CorpusSamp, removeNumbers)
#CorpusSamp <- tm_map(CorpusSamp,removePunctuation)
#CorpusSamp <- tm_map(CorpusSamp,tolower)
#CorpusSamp <- tm_map(CorpusSamp,stripWhitespace)
#CorpusSamp <- tm_map(CorpusSamp,PlainTextDocument)

#xcorp<-removeNumbers(xcorp)
#xcorp<-removePunctuation(xcorp)
#xcorp<-tolower(xcorp)
#xcorp<-stripWhitespace(xcorp)

#xcorp[1:10]



