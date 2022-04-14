#' Include graph file in R Markdown or Quarto document.
#'
#' Use this function to include graph file in R Markdown or Quarto document.
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
#' include_graph(chunk="gretlR1",graph="line")
#'
#' include_tex("path/to/the/tex/file.tex")
#'}
#' @keywords documentation
#' @export

include_graph <- function(chunk="",graph="",path=".") {

  if(chunk!="" && graph!=""){
    # file_extension="\\.(bmp|emf|eps|jpeg|pdf|png|ps|svg|tex|tiff|wmf)$"
    # graph=gsub(file_extension,"",graph)
    # graph1=paste0(graph,".png")
    path=paste0('gretlR/',chunk,'/',graph)
    }
if(path!=".") path=path

include_graphics(path)
}
