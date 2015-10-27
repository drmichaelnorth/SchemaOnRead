##
## File: test_11.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Note the type of test.
context("XLS files")

## Note the data path.
path <- system.file("extdata", paste("dir1", .Platform$file.sep,
        "Data2.xls", sep = ""), package = "SchemaOnRead")

## Perform a test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)$Data),
        testthat::equals(3))
