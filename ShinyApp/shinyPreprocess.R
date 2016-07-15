################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                         
##              Neric Ka
##                                                                            ##
##           Github Repo: https://github.com/AH0HA/coursera_dsc_cpstn         ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(shinyapps),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo),
  library(text2vec),
  library(pryr),
  library(taRifx)))


df1x <- readRDS(file="./data/df1x.rds")
df2x <- readRDS(file="./data/df2x.rds")
df3x <- readRDS(file="./data/df3x.rds")
df4x <- readRDS(file="./data/df4x.rds")

dataCleaner<-function(text){
  
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  
  return(cleanText)
}

cleanInput <- function(text){
  
  textInput <- dataCleaner(text)
  textInput <- txt.to.words.ext(textInput, 
                                language="English.all", 
                                preserve.case = TRUE)
  
  return(textInput)
}


nextWordPrediction <- function(wordCount,textInput){
  
  #if (wordCount>=3) {
    #textInput <- textInput[(wordCount-2):wordCount] 
    
  #}
  
  #else if(wordCount==2) {
    #textInput <- c(NA,textInput)   
  #}
  
  #else {
    #textInput <- c(NA,NA,textInput)
  #}
  
  
  ### 1 ###
   pickDt<- myPick(textInput)
  

  wordPrediction<-dt2str(pickDt)
  #return(wordPrediction)
  print(wordPrediction)
  
}
