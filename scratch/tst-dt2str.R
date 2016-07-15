dt2str<-function(xdt){
  
    xstr<-xdt[,c('term')]
    xstr<-paste(xstr,collapse=",")
    return(xstr)
  
}