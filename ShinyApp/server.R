################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                 Neric Ka                                                   
##                                                                            ##
##           Github Repo: https://github.com/AH0HA/coursera_dsc_cpstn         ##
##                                                                            ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)))

source("./shinyPreprocess.R")
source("./myPick.R")
source("./dt2str.R")
df1x<- readRDS(file="./data/df1x.rds")
df2x<- readRDS(file="./data/df2x.rds")
df3x<- readRDS(file="./data/df3x.rds")
df4x<- readRDS(file="./data/df4x.rds")



shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                textInput <- cleanInput(text)
                wordCount <- length(textInput)
                wordPrediction <- nextWordPrediction(wordCount,textInput)})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})