#' Write `gretl` `inp` file in R
#'
#' Use this function to write `gretl` `inp` file in R
#'
#' @usage write_inp(code,path)
#' @param path Object or a character string representing the path to write the `gretl` `inp` file.
#' @inheritParams exec_gretl
#' @return Set of \code{gretl} (open-source software for Econometrics) outputs
#' @family important functions
#' @examples library(gretlR)
#' \dontrun{
#' code=r'(nulldata 500
#' set seed 13
#' gretl1 = normal()
#' gretl2 = normal()
#' setobs 12 1980:01 --time-series
#' gnuplot gretl1 --time-series --with-lines --output="line.png"
#' gnuplot gretl2 gretl1 --output="scatter.png"
#' )'
#' write_inp(code,path="gretlCodes")
#'}
#' @keywords documentation
#' @export

write_inp <- function(code,path) {
  fileDir=dirname(path)
  file=basename(path)
  file=gsub("\\.inp$","",file)
  create_dir(fileDir)
  fileDir=normalizePath(fileDir)
  # gretlWorkDir=paste0("set workdir ",shQuote(fileDir))
  gretlFile <-paste0(fileDir,"/",file, ".inp")

  writeLines(code, gretlFile)

  # writeLines(c(gretlWorkDir,code), gretlFile)
  # writeLines(c("set use_cwd on",code), gretlFile)
  }
