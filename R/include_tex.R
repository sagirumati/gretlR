#' Include TeX file in R Markdown or Quarto document.
#'
#' Use this function to include TeX file in R Markdown or Quarto document.
#'
#' @usage include_tex(chunk="",tex="",path=".",start=NA,end=NA)
#' @param path Object or a character string representing the path(s) to the `TeX` (default: `"."`)
#' @param chunk Name of the `gretl` chunk that generates the `TeX` file.
#' @param start Numeric. The start line of the `TeX` file to include.
#' @param end Numeric. The last line of the `TeX` file to include.
#' @return Set of \code{gretl} (open-source software for Econometrics) outputs
#' @family important functions
#' @examples library(gretlR)
#' \dontrun{
#' include_tex(chunk="gretlR1",tex="ols")
#'
#' include_tex("path/to/the/tex/file.tex")
#'}
#' @keywords documentation
#' @export

include_tex <- function(chunk="",tex="",path=".",start=NA,end=NA) {

  if(chunk!="" && tex!=""){
    tex=gsub("\\.tex$","",tex)
    tex1=paste0(tex,".tex")
    path=paste0('gretlR/',chunk,'/',tex1)
    }
if(path!=".") {
  path=gsub("\\.tex","",path)
  path=paste0(path,".tex")
}

  if(!is.na(start) && is.na(end)){
    path=readLines(path)
    path=path[start:length(path)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
    }


  if(is.na(start) && !is.na(end)){
    path=readLines(path)
    path=path[(1:end)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }


  if(!is.na(start) && !is.na(end)){
    path=readLines(path)
    path=path[start:end]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }


if (!is.na(start) || !is.na(end)) cat(path) else cat(paste0("\\input{",path,"}"))
}
