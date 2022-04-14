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

import_kable=function(path=".",chunk,file,start=NA,end=NA,skip_blank=FALSE,format=kable_format(), digits = getOption("digits"), row.names = NA,
col.names = NA, align, caption = NULL, label = NULL, format.args = list(),escape = FALSE, table.attr = "", booktabs = TRUE, longtable = FALSE, valign = "t", position = "h", centering = TRUE, vline = getOption("knitr.table.vline",
if (booktabs) "" else "|"), toprule = getOption("knitr.table.toprule",
if (booktabs) "\\toprule" else "\\hline"), bottomrule = getOption("knitr.table.bottomrule",
if (booktabs) "\\bottomrule" else "\\hline"), midrule = getOption("knitr.table.midrule",
if (booktabs) "\\midrule" else "\\hline"), linesep = if (booktabs) c("",
"", "", "", "\\addlinespace") else "\\hline", caption.short = "", table.envir = if (!is.null(caption)) "table",...){

  if(chunk!="" && file!=""){
    # tex=gsub("\\.tex$","",tex)
    # tex=paste0(tex,".tex")
    path=paste0('gretlR/',chunk,'/',file)
    }
if(path!=".") {
  # path=gsub("\\.tex","",path)
  # path=paste0(path,".tex")
path=path
  }

  path=readLines(path)

  if(!is.na(start) && is.na(end)){
    # path=readLines(path)
    path=path[start:length(path)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
    }


  if(is.na(start) && !is.na(end)){
    # path=readLines(path)
    path=path[(1:end)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }


  if(!is.na(start) && !is.na(end)){
    # path=readLines(path)
    path=path[start:end]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }

if(skip_blank==T) path=path[-grep("^\\s*$", path)]
path=writeLines(path,"gretlr.csv")
return(knitr::kable(read.csv("gretlr.csv",allowEscapes = T,header = T,check.names = FALSE), format = format, digits = digits,row.names = row.names, col.names = col.names, align = align, caption = caption, label = label, format.args = format.args, escape = escape, ...))
# if (!is.na(start) || !is.na(end)) cat(path) else cat(paste0("\\input{",path,"}"))
}
