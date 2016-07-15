library(taRifx)
library(pryr)
create_lookup<-function(xyvocab,fmin=2){
        

        x = cbind.data.frame(c(xyvocab$vocab$terms), c(xyvocab$vocab$terms_count))
        colnames(x)=c('terms','cnt')
        x<-sort(x, f= ~ -cnt )
        xs4<-subset(x, x$cnt >= fmin)
        xs4key3<-strsplit(as.character(xs4[,1]), "_")
        df3 <- data.frame(matrix(unlist(xs4key3), nrow=length(xs4key3), byrow=T),stringsAsFactors=FALSE)
        df3<-cbind(df3,xs4$cnt)
        colnames(df3)[dim(df3)[2]]<-c("cnt")
        df3$pct <-  df3$cnt/sum(df3$cnt)*100
        if(dim(df3)[2]==3){
          
          colnames(df3)=c('X1','cnt','pct')
        }
        return(df3)

}