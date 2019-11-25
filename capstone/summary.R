summary <- function(dir) {
  library(ngram)
  files <- list.files(dir, full.names = TRUE)
  filenames <- c()
  filesizes <- c()
  lines <- c()
  words <- c()
  for(f in files) {
    filename <- tail(unlist(strsplit(f, "/")), n=1)
    filenames <- append(filenames, filename)
    filesizeMB <- paste(file.info(f)$size / 1024^2, "MB")
    filesizes <- append(filesizes, filesizeMB)
    con <- file(f, "r")
    fileLines <- readLines(con, skipNul = TRUE)
    lines <- append(lines, length(fileLines))
    words <- append(words, wordcount(fileLines))
    close(con)
  }
  data.frame(filename=filenames, size=filesizes, line.count=lines, word.count=words)
}