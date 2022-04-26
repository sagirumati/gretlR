#' Execute  existing `gretl` `inp` file(s) in R
#'
#' Use this function to execute existing `gretl` `inp` file(s) in R
#'
#' @usage exec_inp(path=".")
#' @param path Object or a character string representing the path(s) to the `gretl` file(s). (default: `"."`)
#' @return Set of \code{gretl} (open-source software for Econometrics) outputs
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
#' write_inp(code,path="SomeFolder/gretlCodes")
#' exec_inp("SomeFolder/gretlCodes")
#'
#'}
#' @family important functions
#' @keywords documentation
#' @export

exec_inp <- function(path=".") {
  if(path=="."){
    path=list.files(pattern = "\\.inp$")
    path1=gsub("\\.inp$","",path)
    lapply(path1,create_dir)
    for(i in seq(path)) file.copy(path[i],path1[i],overwrite = T)
    path=paste0(path1,'/',path)

    on.exit(unlink(paste0(path,".inp")))
  }
  for (i in path){
    fileDir=dirname(i)
    file=basename(i)
    file=gsub("\\.inp$","",file)
    gretlFile=paste0(fileDir,"/",file,".inp")

    create_dir(fileDir)
    fileDir=normalizePath(fileDir)

    gretlWorkDir=paste0("set workdir ",shQuote(fileDir,type="cmd"))

    gretlExecFile=basename(tempfile("gretlexec",".",".inp"))

writeLines(c(gretlWorkDir,paste("include",gretlFile)),gretlExecFile)
    system_exec()
  }

}
