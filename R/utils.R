#' @import knitr
#' @import kableExtra
#' @import rmarkdown
#' @importFrom utils read.csv


# create_dir


create_dir=function(x) if(!dir.exists(x)) dir.create(x,recursive = T)



# system_exec

system_exec=function(){
  gretlExecFile=eval(expression(gretlExecFile),envir = parent.frame()) # Dynamic scoping
  system2("gretlcli",paste("-b -e -t",gretlExecFile))
on.exit(unlink(gretlExecFile),add = T)
  }



# .onLoad


.onLoad<-function(libname,pkgname){
  knit_engines$set(gretl=eng_gretl)
}


kable_format <- function(){
  if(opts_knit$get("rmarkdown.pandoc.to")=="docx") format="pandoc"
  if(opts_knit$get("rmarkdown.pandoc.to")=="latex") format="latex"
  if(opts_knit$get("rmarkdown.pandoc.to")=="html") format="html"
  return(format)
}


# writeLines(c("set use_cwd on",code), gretlFile)
# which(!nzchar(a))


# which(sapply(a,xfun::is_blank)) To find all blank lines in a text
# OR
# grep("^\\s*$", a)
# which(!nzchar(a))
