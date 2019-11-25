loadData <- function(filepath) {
  con = file(filepath, "r")
  out = file(paste(filepath, "sample", sep = "."), "w")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if (rbinom(1, 1, 0.5) == 1) {
      writeLines(line, out)
    }
    if ( length(line) == 0 ) {
      break
    }
  }
  close(con)
  close(out)
}

compute <- function(filepath) {
  con = file(filepath, "r")
  count <- 0
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    if (grepl("A computer once beat me at chess, but it was no match for me at kickboxing", line)) {
      count <- count + 1
    }
  }
  close(con)
  count
}