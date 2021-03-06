% Please edit documentation in R/rd2roxygen.R
\name{Rd2roxygen}
\alias{Rd2roxygen}
\title{Convert all the Rd files of a package to roxygen comments}
\usage{
Rd2roxygen(pkg, nomatch, usage = FALSE)
}
\arguments{
\item{pkg}{the root directory of the package}

\item{nomatch}{the file name (base name only) to use when an object in the Rd
file is not found in any R source files (typically this happens to the data
documentation); if not specified, the default will be `pkg'-package.R}

\item{usage}{logical: whether to include the usage section in the output}
}
\value{
NULL (but the process of conversion will be printed on screen)
}
\description{
This function takes a package root directory, parses all its Rd files under
the man directory and update the corresponding R source code by inserting
roxygen documentation in to the R scripts.
}
\note{
ESS users may use \code{options(roxygen.comment = "##' ")} to ensure
  the generated roxygen comments begin with \code{"##' "}, which is the
  default setting in Emacs/ESS.

  Re-run this function on a package will remove the previous roxygen comments
  before functions in R scripts.
}
\examples{
## a demo package
pkg = system.file("examples", "pkgDemo", package = "Rd2roxygen")
file.copy(pkg, tempdir(), recursive = TRUE)  # copy to temp dir first
od = setwd(tempdir())

## take a look at original R scripts
file.show("pkgDemo/R/foo.R")

options(roxygen.comment = "##' ")

## convert Rd's under man to roxygen comments
Rd2roxygen(file.path(tempdir(), "pkgDemo"))

file.show("pkgDemo/R/foo.R")  # what happened to foo.R and bar.R?

setwd(od)  # restore working directory
}
\author{
Yihui Xie <\url{http://yihui.name}>
}
