#' @export
eng_gretl <- function (options){
  fileName <- tempfile("GRETL", ".",".inp")
  on.exit(unlink(fileName))
  writeLines(c("set use_cwd on", options$code), fileName)
  if (options$eval) {
shell(paste("gretlcli -b -e -t",fileName))

  }
  knitr::engine_output(options, options$code,"")
}
.onLoad<-function(libname,pkgname){
knitr::knit_engines$set(gretl=eng_gretl)
}
