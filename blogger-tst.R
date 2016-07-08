#http://www.r-bloggers.com/analyzing-texts-with-text2vec-package/

#https://cran.r-project.org/web/packages/text2vec/vignettes/text-vectorization.html

devtools::install_github('dselivanov/text2vec')

set.seed(42L)

?str

?itoken

?create_vocabulary

data("movie_review")
# str(movie_review, nchar.max = 20, width = 80, strict.width = 'wrap')

library(tm)

it <- itoken(CorpusSamp, preprocess_function = tolower, 
             tokenizer = word_tokenizer, chunks_number = 10, progessbar = F)

#vocab <- create_vocabulary(it, ngram = c(1L, 1#L))

vocab <- create_vocabulary(it, ngram = c(1L, 1L))

sw <- c("i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours")
vocab <- create_vocabulary(it, stopwords = sw)

vectorizer <- vocab_vectorizer(vocab)
dtm <- create_dtm(it, vectorizer)

# using unigrams here
t1 <- Sys.time()
print( difftime( Sys.time(), t1, units = 'sec'))



corpus <- create_vocab_corpus(it, vocabulary = vocab)
dtm <- get_dtm(corpus)

#We got DTM matrix. Lets check its dimension:
  
  dim(dtm)
