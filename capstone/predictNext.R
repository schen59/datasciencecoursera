toSortedDataFrame <- function(tdm) {
  library(tidytext)
  library(dplyr)
  df <- tidy(tdm)
  df <- df %>% group_by(term) %>% summarise(n = n()) %>% mutate(freq = n / sum(n))
  df <- df[order(df$n), ]
  prefix <- apply(df, 1, function(r) {
    words <- unlist(strsplit(as.character(r[1]), split = " "))
    paste(words[1:length(words)-1], collapse = " ")
  })
  
  nextWord <- apply(df, 1, function(r) {
    words <- unlist(strsplit(as.character(r[1]), split = " "))
    words[length(words)]
  })
  
  df$prefix <- prefix
  df$nextWord <- nextWord
  df
}

saveModel <- function() {
  source("preprocess.R")
  cv <- sampleBy("./final/en_US", 0.01)
  corpus <- toCorpus(cv)
  bigram <- toTermDocumentMatrix(corpus, 2)
  trigram <- toTermDocumentMatrix(corpus, 3)
  quadgram <- toTermDocumentMatrix(corpus, 4)
  bigramDF <- toSortedDataFrame(bigram)
  trigramDF <- toSortedDataFrame(trigram)
  quadgramDF <- toSortedDataFrame(quadgram)
  df <- rbind(bigramDF, trigramDF, quadgramDF)
  df <- df[order(df$freq), ]
  saveRDS(df, "./freqmodel.RDS")
  df
}

predict <- function(sentence) {
  library(tm)
  sentence <- stripWhitespace(removeNumbers(removePunctuation(tolower(sentence))))
  words <- unlist(strsplit(sentence, split = " "))
  if (length(words) > 4) {
    words <- words[(length(words)-3): length(words)]
  }
  prefixes <- c()
  if (length(words) >= 4) {
    prefixes <- append(prefixes, paste(words[(length(words)-3):length(words)], collapse = " "))
  }
  if (length(words) >= 3) {
    prefixes <- append(prefixes, paste(words[(length(words)-2):length(words)], collapse = " "))
  }
  if (length(words) >= 2) {
    prefixes <- append(prefixes, paste(words[(length(words)-1):length(words)], collapse = " "))
  }
  if (length(words) >= 1) {
    prefixes <- append(prefixes, words[length(words)])
  }
  model <- readRDS("./freqmodel.RDS")
  print(prefixes)
  candidate <- subset(model, prefix %in% prefixes)
  as.character(tail(candidate, 3)$nextWord)
}