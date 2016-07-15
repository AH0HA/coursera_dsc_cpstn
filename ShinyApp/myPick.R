library("plyr")




  myPick <- function(xInput,numPick=4,mylimit=0.12){
    
    
    
    xlen = length(xInput)
    yInput <- xInput
    
    if (xlen>=3) {
      yInput <- yInput[(xlen-2):xlen] 
      
    }
    
    if(xlen==2) {
      yInput <- c(NA,yInput)   
    }
  
    if (xlen==1){
      yInput <- c(NA,NA,yInput)
    }    

  
    xlen=3
    top3w<-df4x[df4x$X1==yInput[xlen-2] & 
                                  df4x$X2==yInput[xlen-1] & 
                                  df4x$X3==yInput[xlen],][1:numPick,c('X4','pct')]
    
    colnames(top3w)<-c('term','pct')
    
    top2w<-df3x[df3x$X1==yInput[xlen-1] & 
                 df3x$X2==yInput[xlen],][1:numPick,c('X3','pct')] 
    colnames(top2w)<-c('term','pct')
    
    top1w<-df2x[df2x$X1==yInput[xlen],][1:numPick,c('X2','pct')]
    colnames(top1w)<-c('term','pct')
    
 
    xtop<-rbind(top1w,top2w,top3w)
    
    xtop <- xtop[complete.cases(xtop),]
    
    if (dim(xtop)[1]==0){
      
       idx <- which(df1x$pct>=mylimit)
        ztop<-df1x[ sample(idx,numPick), ]
        colnames(ztop)<-c('term','cnt','pct')
        ztop<-ztop[,c("term","pct")]
        return(ztop)
    }
    else {
    ytop<-ddply(xtop, .(term), colwise(sum))
    ytop[ order(-ytop[,c('pct')]), ]
    ztop<-ytop[1:numPick,]
    return(ztop)
    
    }
    
    
    
    
   
  }