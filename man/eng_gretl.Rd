\name{eng_gretl}
\alias{eng_gretl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Package to Run gretl Scripts from R Markdown
}
\description{
This package runs on top of knitr to facilitate communication with gretl. Run gretl scripts from R Markdown document.
}
\usage{
eng_gretl(options)
}
\arguments{
\item{options}{Chunk options, as provided by \code{knitr} during chunk execution. Chunk option for this is \code{gretl}}
}
\value{
Set of \code{gretl} (Gnu Regression, Econometrics and Time-series Library) codes
}
\details{
The \code{gretl} can be activated via \preformatted{knitr::knit_engines$set(gretl = gretlR::eng_gretl)
}

This will be set within an R Markdown document's setup chunk.
}
%- maybe also 'usage' for other objects documented here.
\references{
Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
Yihui Xie (2019). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.24.

Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition. Chapman and Hall/CRC. ISBN 978-1498716963

Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible Research in R. In Victoria Stodden, Friedrich Leisch and Roger D. Peng, editors, Implementing Reproducible Computational Research. Chapman and Hall/CRC. ISBN 978-1466561595
}
\author{
*Sagiru Mati, ORCID: 0000-0003-1413-3974, https://smati.com.ng

* Yusuf Maitama Sule (Northwest) University Kano, Nigeria

* SMATI Academy
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
knitr::knit_engines$set(gretl = gretlR::eng_gretl)
\dontrun{

library(gretlR)

# Copy and paste the following chunk in R Markdown document

```{gretl gretlR,eval=T,echo=F,comment=NULL}
nulldata 500
set seed 13
gretl1 = normal()
gretl2 = normal()
setobs 12 1980:01 --time-series
gnuplot gretl1 --time-series --with-lines --output="line.png"
gnuplot gretl2 gretl1 --output="scatter.png"
ols gretl1 const gretl2
modeltab add
tabprint --output="ols.Rmd"
eqnprint --output="olsmodel.Rmd"
tabprint --output="ols.csv"
```

}
}

\keyword{documentation}% use one of  RShowDoc("KEYWORDS")

