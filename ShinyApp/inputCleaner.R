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


final4Data <- readRDS(file="./data/v4gram.rds")
final3Data <- readRDS(file="./data/v3gram.rds")
final2Data <- readRDS(file="./data/v2gram.rds")

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
        
        if (wordCount>=3) {
                textInput <- textInput[(wordCount-2):wordCount] 
                
        }
        
        else if(wordCount==2) {
                textInput <- c(NA,textInput)   
        }
        
        else {
                textInput <- c(NA,NA,textInput)
        }
        
        
        ### 1 ###
        wordPrediction <- as.character(final4Data[final4Data$X1==textInput[1] & 
                                                          final4Data$X2==textInput[2] & 
                                                          final4Data$X3==textInput[3],][1,]$X4)
        
        if(is.na(wordPrediction)) {
                wordPrediction1 <- as.character(final3Data[final3Data$X1==textInput[2] & 
                                                                   final3Data$X2==textInput[3],][1,]$X3)
                
                if(is.na(wordPrediction)) {
                        wordPrediction <- as.character(final2Data[final2Data$X1==textInput[3],][1,]$X2)
                }
        }
        
        
        print(wordPrediction)
        
}