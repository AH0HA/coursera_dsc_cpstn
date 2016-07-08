library(text2vec)

get_ngram<-function(xsamp,max_ngram=3L,min_ngram=3L){
  
#tokens <- xsamp %>% 
  #tolower() %>% 
  #word_tokenizer()


it <- itoken(xsamp, 
             #preprocess_function = tolower, 
             tokenizer = word_tokenizer, 
             ids = NULL)
             #ids = movie_review$id)

#it <- itoken(tokens)


vocab <- create_vocabulary(it, ngram = c(min_ngram, max_ngram)) #%>% 
  prune_vocabulary(vocab,term_count_min = 10, 
                   doc_proportion_max = 0.5, 
                   doc_proportion_min = 0.001)

#vectorizer <- vocab_vectorizer(vocab)

#str(vocab$vocab$terms)

#str(vocab$vocab$terms)
return(vocab)
}