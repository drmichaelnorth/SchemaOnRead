##
## File: test_17.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Note the type of test.
context("HTML files")

## Note the data path.
path <- system.file("extdata", paste("dir2", .Platform$file.sep,
        "index.html", sep = ""), package = "SchemaOnRead")

## Perform a test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)),
        testthat::equals(3))
