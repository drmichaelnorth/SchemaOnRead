##
## File: test_11.R
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
        "dir1", .Platform$file.sep,
        "Data2.xls",
        sep = "")

## Perform a test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)$Data),
        testthat::equals(3))
