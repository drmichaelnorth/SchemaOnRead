\name{schemaOnRead}
\alias{schemaOnRead}
\title{Automated Schema on Read}
\description{Provides schema-on-read tools including a single function call (e.g., schemaOnRead("filename")) that reads text (TXT), comma separated value (CSV), raster image (BMP, PNG, GIF, TIFF, and JPG), R data (RDS), HDF5 ('H5'), NetCDF ('CS'), spreadsheet (XLS, XLSX, ODS, and DIF), Weka Attribute-Relation File Format (ARFF), Epi Info (REC), Pajek network (PAJ), R network (NET), Hypertext Markup Language (HTML), SPSS (SAV), Systat (SYS), and Stata (DTA) files. It also recursively reads folders (e.g., schemaOnRead("folder")), returning a nested list of the contained elements.

The standard use of SchemaOnRead is to recursively load a folder. The result is a named list of elements for each entry in the folder's tree. Sub-elements (e.g., files or subfolders) of a folder can be accessed using the R named list ("\$") operator followed by the sub-element name. Files or folders with names that do not conform to standard
R variable naming requirements can be accessed using single quote notation (e.g.,
"results$'Nonconforming Name!'").
\code{schemaOnRead(path)}.
}
\usage{
schemaOnRead(path = ".", processors = SchemaOnRead::defaultProcessors(), verbose = FALSE)
}
\arguments{
  \item{path}{a file to load or folder to recursively load.}
  \item{processors}{a list of processors to use in the order in the list.}
  \item{verbose}{a flag specifying whether or not to show progress feedback, warnings, and errors.}
}
\seealso{
  \code{\link{schemaOnRead}}.
}
\examples{
## Load a file to a variable.
file <- SchemaOnRead::schemaOnRead("file.txt")

## Load a directory to a list.
folder <- SchemaOnRead::schemaOnRead("folder")

}
\keyword{schemaOnRead}
