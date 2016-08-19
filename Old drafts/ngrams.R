tweets_source <- VectorSource(tweets_total)
corpus <- Corpus(tweets_source)

corpus <- tm_map(corpus, removePunctuation)

corpus <- tm_map(corpus, stripWhitespace)

corpus <- tm_map(corpus, removeWords, stopwords("english"))

dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)

frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)
frequency

BigramTokenizer <-
  function(x)
    unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)

tdm <- TermDocumentMatrix(corpus, control = list(tokenize = BigramTokenizer))
tdm2 <- as.matrix(tdm)

frequency_2 <- rowSums(tdm2)
frequency_2 <- sort(frequency_2, decreasing=TRUE)



trigramTokenizer <-
  function(x)
    unlist(lapply(ngrams(words(x), 3), paste, collapse = " "), use.names = FALSE)

tdm_3 <- TermDocumentMatrix(corpus, control = list(tokenize = trigramTokenizer))
tdm2_3 <- as.matrix(tdm_3)

frequency_3 <- rowSums(tdm2_3)
frequency_3 <- sort(frequency_3, decreasing=TRUE)




