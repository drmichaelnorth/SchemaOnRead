\name{checkExtensions}
\alias{checkExtensions}
\title{Automated Schema on Read File Extensions Checker}
\description{Checks to see if the given file exists and has one of the provided extensions.}
\usage{
checkExtensions(path = ".", extensions = NULL)
}
\arguments{
  \item{path}{a file to load or folder to recursively load.}
  \item{extensions}{a list of file extensions to check provided as lower case strings.}
}
\seealso{
  \code{\link{checkExtensions}}.
}
\examples{
## Load the needed library.
library(SchemaOnRead)

## Define a new processor.
newProcessor <- function(path, ...) {

  # Check the file existance and extensions.
  if (!SchemaOnRead::checkExtensions(path, c("xyz"))) return(NULL)

  ## As an example, attempt to read an XYZ file as a CSV file.
  read.csv(path, header = FALSE)

}

## Define a new processors list.
newProcessors <- c(newProcessor, SchemaOnRead::simpleProcessors())

# Use the new processors list.
schemaOnRead(path = "../inst/extdata", processors = newProcessors)
}
\keyword{checkExtensions}
