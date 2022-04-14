#' Add `gretl` as knit-engine to knitr package
#'
#' The \code{gretl} engine can be activated via
#'
#' ```
#' knitr::knit_engines$set(gretl = gretlR::eng_gretl)
#' ```
#'
#' This will be set within an R Markdown document's setup chunk.
#'
#' @description This package runs on top of knitr to facilitate communication with `gretl`. Run `gretl` scripts from R, R Markdown and Quarto document.
#' @usage eng_gretl(options)
#' @param options Chunk options, as provided by \code{knitr} during chunk execution. Chunk option for this is \code{gretl}
#' @return Set of \code{gretl} (open-source software for Econometrics) codes
#' @author \href{https://smati.com.ng}{Sagiru Mati}, \href{https://orcid.org/0000-0003-1413-3974}{ORCID: 0000-0003-1413-3974}
#' * [Yusuf Maitama Sule (Northwest) University Kano, Nigeria](https://yumsuk.edu.ng)
#' * [SMATI Academy](https://academy.smati.com.ng)
#' @examples knitr::knit_engines$set(gretl = gretlR::eng_gretl)
#' library(gretlR)
#' @references Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
#'
#' Yihui Xie (2019). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.24.
#'
#' Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition. Chapman and Hall/CRC. ISBN 978-1498716963
#'
#' Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible Research in R. In Victoria Stodden, Friedrich Leisch and Roger D. Peng, editors, Implementing Reproducible Computational Research. Chapman and Hall/CRC. ISBN 978-1466561595
#'
#' @family important functions
#' @keywords documentation
#' @export
  eng_gretl <- function (options){
  path <- paste0("gretlR/",options$label,"/",options$label)
  if (options$eval) exec_gretl(options$code,path)
}
