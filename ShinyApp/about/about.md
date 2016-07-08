### Coursera Data Science Capstone Project


This application is the capstone project for the Coursera Data Science specialization held by Coursera & Johns Hopkins with cooperation of SwiftKey.

![SwiftKey, Bloomberg & Coursera Logo](logos.png)

******

#### Objective

The main goal of this capstone project is to build a shiny application that is able to predict the next word of a sentence. 

All text data that is used to create a frequency dictionary and thus to predict the next words comes from a corpus called [HC Corpora](http://www.corpora.heliohost.org/). 

All text mining[tm](https://cran.r-project.org/web/packages/tm/index.html) and natural language processing[NLP](https://cran.r-project.org/web/packages/text2vec/index.html) was done with the usage of a variety of well-known R packages.

******

#### Methods & Models

After acquiring the choosen text, a sample is taken which is then pre-processed by removing punctuation, links, white space, numbers and all kinds of special characters & conversing to lowercase.
This processed sample is then [tokenized](http://en.wikipedia.org/wiki/Tokenization_%28lexical_analysis%29) into so-called [*n*-grams](http://en.wikipedia.org/wiki/N-gram). 
> In the fields of computational linguistics and probability, an *n*-gram is a contiguous sequence of n items from a given sequence of text or speech. ([Source](http://en.wikipedia.org/wiki/N-gram))


Those aggregated bi-,tri- and quadgram term frequency matrices have been transferred into frequency tables.

The resulting n-gram frequency tables are used to predict the next word in connection with the text input by a user of the described application.

******

#### Usage 


Entering the word(s) of a sentence (**1**), the field with the predicted next word (**2**) refreshes instantaneously and  also the whole input (**3**) gets displayed.

![Application Screenshot](demo.png)

******

#### More Info


* The next word prediction app is hosted on shinyapps.io: [http://launeric.shinyapps.io/ShinyApp ](http://launeric.shinyapps.io/ShinyApp)

* The whole code of this application can be found in this GitHub repo: [https://github.com/AH0HA/coursera_dsc_cpstn](https://github.com/AH0HA/coursera_dsc_cpstn)

* This pitch deck is located here: [https://github.com/AH0HA/coursera_dsc_cpstn](https://github.com/AH0HA/coursera_dsc_cpstn)

