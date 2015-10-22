##
## File: test_15.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Note the data directory.
path <- paste(
        "..", .Platform$file.sep,
        "..", .Platform$file.sep,
        "SchemaOnRead", .Platform$file.sep,
        "inst", .Platform$file.sep,
        "extdata", .Platform$file.sep,
        "dir2", .Platform$file.sep,
        "Example.paj",
        sep = "")

## Perform a test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)),
        testthat::equals(5))
