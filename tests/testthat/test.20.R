##
## File: test_20.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Note the type of test.
context("User processors")

## Note the data path.
path <- system.file("extdata", "image.jpg", package = "SchemaOnRead")

## Define a new processor.
newProcessor <- function(path, processors, verbose) {

        ## Check the given path.
        if (file.exists(path)) {

                ## Return a custom value.
                return("Custom Test")

        } else {

                ## Note that the file does not exist.
                return("Entry Does Not Exist")

        }

}

## Define a new processors list.
newProcessors <- c(newProcessor,
        SchemaOnRead::schemaOnReadDefaultProcessors())

## Perform a test.
testthat::expect_that(
        SchemaOnRead::schemaOnRead(path = path,
        processors = newProcessors),
        testthat::equals("Custom Test"))

## Define a new processors list.
newProcessors <- c(newProcessor,
        SchemaOnRead::schemaOnReadSimpleProcessors())

## Perform a test.
testthat::expect_that(
        SchemaOnRead::schemaOnRead(path = path,
        processors = newProcessors),
        testthat::equals("Custom Test"))
