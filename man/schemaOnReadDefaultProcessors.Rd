\name{schemaOnReadDefaultProcessors}
\alias{schemaOnReadDefaultProcessors}
\title{Automated Schema on Read Default Processors}
\description{Provides schema-on-read tools including a single function call (e.g., schemaOnRead("filename")) that reads a wide range of file formats. It also recursively reads folders (e.g., schemaOnRead("folder")) returning a list.
  \code{schemaOnReadDefaultProcessors}.
}
\usage{
schemaOnReadDefaultProcessors()
}
\seealso{
  \code{\link{schemaOnReadDefaultProcessors}}.
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
newProcessors <- c(newProcessor, SchemaOnRead::schemaOnReadDefaultProcessors())

# Use the new processors list.
SchemaOnRead::schemaOnRead(path = "inst/extdata", processors = newProcessors)
}
\keyword{schemaOnReadDefaultProcessors}
