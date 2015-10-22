\name{schemaOnReadSimpleProcessors}
\alias{schemaOnReadSimpleProcessors}
\title{Automated Schema on Read Simple Processors}
\description{ Provides schema-on-read tools including a single function call (e.g., schemaOnRead("filename")) that reads a wide range of file formats. It also recursively reads folders (e.g., schemaOnRead("folder")) returning a list.
  \code{schemaOnReadSimpleProcessors}.
}
\usage{
schemaOnReadSimpleProcessors()
}
\seealso{
  \code{\link{schemaOnReadSimpleProcessors}}.
}
\examples{
## Define a new processor.
newProcessor <- function(path, processors, verbose) {

        ## Check the given path.
        if (file.exists(path)) {

                ## Return a new result...
                return("put your code here")

        } else {

                ## Note that the file does not exist.
                return("entry - does not exist")

        }

}

## Define a new processors list.
newProcessors <- c(newProcessor, SchemaOnRead::schemaOnReadSimpleProcessors())

# Use the new processors list.
SchemaOnRead::schemaOnRead(path = "inst/extdata", processors = newProcessors)
}
\keyword{schemaOnReadSimpleProcessors}
