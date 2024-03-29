#' Import file as `kable` in R Markdown or Quarto document.
#'
#' Use this function to import file as `kable` in R Markdown or Quarto document.
#'
#'@usage import_kable(path=".",chunk="",file="",start=NA,end=NA,skip_blank=TRUE,
#'format=kable_format(),digits = getOption("digits"), row.names = NA,col.names = NA, align,
#'caption = NULL,
#'   label = NULL, format.args = list(),escape = FALSE, table.attr = "", booktabs = TRUE,
#'    longtable = FALSE, valign = "t",position = "h", centering = TRUE,
#'    vline = getOption("knitr.table.vline",if (booktabs) "" else "|"),
#' toprule = getOption("knitr.table.toprule",
#' if (booktabs) "\\\\toprule" else "\\\\hline"),
#' bottomrule = getOption("knitr.table.bottomrule",
#' if (booktabs) "\\\\bottomrule" else "\\\\hline"),
#' midrule = getOption("knitr.table.midrule",
#' if (booktabs) "\\\\midrule" else "\\\\hline"),
#' linesep = if (booktabs) c("","", "", "", "\\\\addlinespace") else "\\\\hline",
#'  caption.short = "",table.envir = if (!is.null(caption)) "table",...)
#' @inheritParams knitr::kable
#' @inheritParams kableExtra::kbl
#' @param file Name of a file to be imported as `kable`
#' @param skip_blank Logical. Whether or not to include blank rows.
#' @param path Object or a character string representing the path(s) to the `TeX` (default: `"."`)
#' @param chunk Name of the `gretl` chunk that generates the `TeX` file.
#' @param start Numeric. The start line of the `TeX` file to include.
#' @param end Numeric. The last line of the `TeX` file to include.
#' @return \code{kable}
#' @family important functions
#' @examples library(gretlR)
#' \dontrun{
#' code=r'(nulldata 500
#' set seed 13
#' gretl1 = normal()
#' gretl2 = normal()
#' setobs 12 1980:01 --time-series
#' ols gretl1 const gretl2
#' tabprint --output="olsTable.csv")'
#'
#' exec_gretl(code=code,path='gretlR/Table/gretlCode') # this creates 'gretlR/Table' folder
#'
#' import_kable(chunk = "Table",file = "olsTable.csv",format="pandoc",caption="Table generated
#' from gretl chunk", start=3,end=7,digits=2)
#'
#' # Alternatively, use the absolute/relative path to the file
#'
#' import_kable(path = "gretlR/Table/olsTable.csv",format="pandoc",caption="Table generated
#'  from path", start=3,end=7,digits=2)
#'}
#' @keywords documentation
#' @export

import_kable=function(path=".",chunk="",file="",start=NA,end=NA,skip_blank=TRUE,format=kable_format(), digits = getOption("digits"), row.names = NA,
col.names = NA, align, caption = NULL, label = NULL, format.args = list(),escape = FALSE, table.attr = "", booktabs = TRUE, longtable = FALSE, valign = "t", position = "h", centering = TRUE, vline = getOption("knitr.table.vline",
if (booktabs) "" else "|"), toprule = getOption("knitr.table.toprule",
if (booktabs) "\\toprule" else "\\hline"), bottomrule = getOption("knitr.table.bottomrule",
if (booktabs) "\\bottomrule" else "\\hline"), midrule = getOption("knitr.table.midrule",
if (booktabs) "\\midrule" else "\\hline"), linesep = if (booktabs) c("",
"", "", "", "\\addlinespace") else "\\hline", caption.short = "", table.envir = if (!is.null(caption)) "table",...){

  if(chunk!="" && file!="") path=paste0('gretlR/',chunk,'/',file)

  if(path!=".") path=path

  path=readLines(path)

  if(!is.na(start) && is.na(end)) path=path[start:length(path)]


  if(is.na(start) && !is.na(end))  path=path[(1:end)]


  if(!is.na(start) && !is.na(end)) path=path[start:end]

if(skip_blank && any(grep("^\\s*$", path))) path=path[-grep("^\\s*$", path)]

  # gretlRcsv=basename(tempfile("grertlR",".",".csv"))
# path=writeLines(path,gretlRcsv)
# on.exit(unlink(gretlRcsv),add = T)
return(kable(read.csv(text=path,allowEscapes = T,header = T,check.names = FALSE), format = format, digits = digits,row.names = row.names, col.names = col.names, align = align, caption = caption, label = label, format.args = format.args, escape = escape, ...))

}
