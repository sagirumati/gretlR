#' Include graph file in R Markdown or Quarto document.
#'
#' Use this function to include graph file in R Markdown or Quarto document.
#'
#' @usage include_graph(path=".",chunk="",graph="")
#' @param path Object or a character string representing the path(s) to the `TeX` (default: `"."`)
#' @param chunk Name of the `gretl` chunk that generates the `TeX` file.
#' @param graph Name of the graph and its extension
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
#' )'
#' exec_gretl(code)
#'
#' include_graph(path="line.png")
#'
#'}
#' @keywords documentation
#' @export

include_graph <- function(path=".",chunk="",graph="") {

  if(chunk!="" && graph!=""){
    # file_extension="\\.(bmp|emf|eps|jpeg|pdf|png|ps|svg|tex|tiff|wmf)$"
    # graph=gsub(file_extension,"",graph)
    # graph1=paste0(graph,".png")
    path=paste0('gretlR/',chunk,'/',graph)
    }
if(path!=".") path=path

include_graphics(path)
}
