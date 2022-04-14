#' Execute `gretl` codes in R
#'
#' Use this function to Execute `gretl` codes in R.
#'
#' @usage exec_gretl(code,path=basename(tempfile("gretlR")))
#' @param code Object or a character string representing the set of `gretl` codes
#' @param path Object or a character string representing the directory to execute the `gretl` codes (default: `gretlR`)
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
#' exec_gretl(code)
#'}
#' @keywords documentation
#' @export
exec_gretl <- function (code,path=basename(tempfile("gretlR"))){
  fileDir=dirname(path)
  file=basename(path)
  gretlFile <- paste0(fileDir,"/",file, ".inp")
  on.exit(unlink(gretlFile))
  write_inp(code,gretlFile)
  exec_inp(gretlFile)
}
