#' @export
eng_gretl <- function(options) {
  # create a temporary file
  f <-tempfile("GRETL", '.', paste('.', "inp", sep = '')) # inp is file extension of gretl program
  on.exit(unlink(f)) # cleanup temp file on function exit
  writeLines(c('set use_cwd on',options$code), f)
  out <- ''

  # if eval != FALSE compile/run the code, preserving output

  if (options$eval) {
    texto = sprintf(paste("gretlcli -b -e -t", paste(f,options$engine.opts)))
    shell(texto, ignore.stderr = TRUE, intern = TRUE)
    }

  # spit back stuff to the user

  knitr::engine_output(options, options$code, out)
}
.onLoad<-function(libname,pkgname){
  knitr::knit_engines$set(gretl=eng_gretl)
}
