sampleBy <- function(dir, percentage) {
  set.seed(2019)
  files <- list.files(dir, full.names = TRUE)
  result <- c()
  for(f in files) {
    con <- file(f, "r")
    fileLines <- readLines(con, skipNul = TRUE)
    result <- append(result, sample(fileLines, length(fileLines) * percentage))
    close(con)
  }
  result
}

toCorpus <- function(characterVectors) {
  library(tm)
  corpus <- VCorpus(VectorSource(characterVectors))
  toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
  corpus <- tm_map(corpus, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")
  corpus <- tm_map(corpus, toSpace, "@[^\\s]+")
  corpus <- tm_map(corpus, tolower)
  corpus <- tm_map(corpus, removeWords, stopwords("en"))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, PlainTextDocument)
  corpus
}

toTermDocumentMatrix <- function(corpus, n) {
  if (n == 1) {
    return (removeSparseTerms(TermDocumentMatrix(corpus), sparse))
  }
  library(RWeka)
  tdm <- TermDocumentMatrix(corpus, 
                            control = list(tokenize = function(x) NGramTokenizer(x, Weka_control(min = n, max = n))))
  tdm
}

sortFreq <- function(tdm, decreasing = FALSE) {
  freq <- sort(rowSums(as.matrix(tdm)), decreasing = decreasing)
  data.frame(word = names(freq), freq = freq)
}

makePlot <- function(data, label) {
  ggplot(data[1:30, ], aes(x=word, y=freq, fill=word)) + 
  geom_bar(width = 0.75,  stat = "identity", colour = "black", size = 1) + 
  coord_polar(theta = "x") + xlab("") + ylab("") + ggtitle("Word Frequency") + 
  theme(legend.position = "none") + labs(x = NULL, y = NULL)
}

