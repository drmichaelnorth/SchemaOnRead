\name{defaultProcessors}
\alias{defaultProcessors}
\title{Automated Schema on Read Default Processors}
\description{Provides a  default list of extensions for custom processing.}
\usage{
defaultProcessors()
}
\seealso{
  \code{\link{defaultProcessors}}.
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
newProcessors <- c(newProcessor, SchemaOnRead::defaultProcessors())

# Use the new processors list.
schemaOnRead(path = "../inst/extdata", processors = newProcessors)
}
\keyword{defaultProcessors}
