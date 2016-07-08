library(tm)
preprocess<-function(uxcorp){
  uxcorp<-removeNumbers(uxcorp)
  uxcorp<-removePunctuation(uxcorp)
  uxcorp<-tolower(uxcorp)
  uxcorp<-stripWhitespace(uxcorp)
  return (uxcorp)
}