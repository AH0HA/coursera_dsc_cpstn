

myname_str = 'Neric Ka'
myinfo_url_str = "https://www.linkedin.com/in/neric-ka-b686518"
mygithub="https://github.com/AH0HA/coursera_dsc_cpstn"
#today<-ymd(Sys.Date())

suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo),
        library(lubridate)))

shinyUI(navbarPage("Coursera Data Science Capstone", 
                   
                   theme = shinytheme("flatly"),
                   
############################### ~~~~~~~~1~~~~~~~~ ##############################  
## Tab 1 - Prediction

tabPanel("Next Word Prediction",
         
         tags$head(includeScript("./js/ga-shinyapps-io.js")),
         
         fluidRow(
                 
                 column(3),
                 column(6,
                        tags$div(textInput("text", 
                                  label = h2("Enter your words:"),
                                  value = ),
                        tags$span(style="color:grey",("Only English is supported.")),
                        br(),
                        tags$hr(),
                        h3("Predicted next word:"),
                        tags$span(style="color:darkred",
                                  tags$strong(tags$h2(textOutput("predictedWord")))),
                        br(),
                        tags$hr(),
                        h3("You have entered:"),
                        tags$em(tags$h2(textOutput("enteredWords"))),
                        align="center")
                        ),
                 column(3)
         )
),

############################### ~~~~~~~~2~~~~~~~~ ##############################
## Tab 2 - About 

tabPanel("About This Application",
         fluidRow(
                 column(2,
                        p("")),
                 column(8,
                        includeMarkdown("./about/about.md")),
                 column(2,
                        p(""))
         )
),

############################### ~~~~~~~~F~~~~~~~~ ##############################

## Footer

tags$hr(),

tags$br(),

tags$span(style="color:grey", 
          tags$footer(("© 2016 - "), 
                      tags$a(
                              href=myinfo_url_str,
                              target="_blank",
                              myname_str), 
                      tags$br(),
                      ("Built with"), tags$a(
                              href="http://www.r-project.org/",
                              target="_blank",
                              "R"),
                      ("&"), tags$a(
                              href="http://shiny.rstudio.com",
                              target="_blank",
                              "Shiny."),
                      align = "center"),
          
          tags$br()
)
)
)
