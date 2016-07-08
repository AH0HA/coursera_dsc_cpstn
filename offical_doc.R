#https://cran.r-project.org/web/packages/text2vec/vignettes/text-vectorization.html

library(text2vec)
#data("movie_review")
set.seed(42L)

?itoken

CorpusSamp_id<-1:length(CorpusSamp)
CorpusSamp_id<-as.character(CorpusSamp_id)

it <- itoken(CorpusSamp, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer,
             ids = CorpusSamp_id)

it <- itoken(movie_review$review, 
             preprocess_function = tolower, 
             tokenizer = word_tokenizer,
             ids = movie_review$id)




sw <- c("i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours")
vocab <- create_vocabulary(it, stopwords = sw)


tokens <- movie_review$review %>% 
  tolower() %>% 
  word_tokenizer()
it <- itoken(tokens, ids = movie_review$id)
vocab <- create_vocabulary(it, stopwords = sw)

# Each element of list represents document
#tokens <- movie_review$review %>% 
  #tolower() %>% 
  #word_tokenizer()
#it <- itoken(tokens, ids = movie_review$id)
#vocab <- create_vocabulary(it, stopwords = sw)

#it <- itoken(tokens, ids = movie_review$id)
# Or
# it <- itoken(movie_review$review, tolower, word_tokenizer, ids = movie_review$id)
vectorizer <- vocab_vectorizer(vocab)
dtm <- create_dtm(it, vectorizer)



str(dtm)

#dtm$Dimnames[1]


identical(rownames(dtm), CorpusSamp_id)



it <- itoken(tokens, ids = movie_review$id)

vectorizer <- hash_vectorizer(hash_size = 2 ^ 16, ngram = c(1L, 3L))
dtm <- create_dtm(it, vectorizer) %>% 
  transform_tfidf()
## idf scaling matrix not provided, calculating it form input matrix

library(glmnet)

fit <- cv.glmnet(x = dtm, y = movie_review[['sentiment']], 
                 family = 'binomial', 
                 alpha = 1,
                 type.measure = "auc",
                 nfolds = 5,
                 thresh = 1e-3,
                 maxit = 1e3)

plot(fit)

print(paste("max AUC =", round(max(fit$cvm), 4)))

str(vectorizer )


tokens <- movie_review$review %>% 
  tolower() %>% 
  word_tokenizer()

it <- itoken(tokens, ids = movie_review$id)

vocab <- create_vocabulary(it, ngram = c(1L, 3L)) %>% 
  prune_vocabulary(term_count_min = 10, 
                   doc_proportion_max = 0.5, 
                   doc_proportion_min = 0.001)

vectorizer <- vocab_vectorizer(vocab)

str(vocab$vocab$terms)

str(vocab$vocab$terms)
