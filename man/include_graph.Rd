% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/include_graph.R
\name{include_graph}
\alias{include_graph}
\title{Include graph file in R Markdown or Quarto document.}
\usage{
include_graph(path=".",chunk="",graph="")
}
\arguments{
\item{path}{Object or a character string representing the path(s) to the \code{TeX} (default: \code{"."})}

\item{chunk}{Name of the \code{gretl} chunk that generates the \code{TeX} file.}

\item{graph}{Name of the graph and its extension}
}
\value{
Set of \code{gretl} (open-source software for Econometrics) outputs
}
\description{
Use this function to include graph file in R Markdown or Quarto document.
}
\examples{
library(gretlR)
\dontrun{
code=r'(nulldata 500
set seed 13
gretl1 = normal()
gretl2 = normal()
setobs 12 1980:01 --time-series
gnuplot gretl1 --time-series --with-lines --output="line.png"
)'
exec_gretl(code)

include_graph(path="line.png")

}
}
\seealso{
Other important functions: 
\code{\link{eng_gretl}()},
\code{\link{exec_gretl}()},
\code{\link{exec_inp}()},
\code{\link{gretlR}},
\code{\link{import_kable}()},
\code{\link{include_tex}()},
\code{\link{write_inp}()}
}
\concept{important functions}
\keyword{documentation}
