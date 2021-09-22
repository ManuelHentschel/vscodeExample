


writeMatrixToFile <- function(m, filename=''){
  # Convert numerical matrix to strings:
  mString <- sprintf('%.2f', m)
  dim(mString) <- dim(m)
  
  # Join columns by '&'
  rows <- lapply(
    seq_len(nrow(m)),
    function(i){
      paste(mString[i,], collapse = ' & ')
    }
  )
  
  # Join rows by '\\'
  ret <- paste(rows, collapse = '\\\\\n')

  # Write to file
  cat(ret, file=filename)
}

