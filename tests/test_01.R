##
## File: test_01.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Note the data directory.
path <- paste(
        "..", .Platform$file.sep,
        "..", .Platform$file.sep,
        "SchemaOnRead", .Platform$file.sep,
        "inst", .Platform$file.sep,
        "extdata",
        sep = "")

## Perform an overall test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)),
        testthat::equals(9))
