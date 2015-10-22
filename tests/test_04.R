##
## File: test_04.R
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
        "image.png",
        sep = "")

## Perform a test.
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)),
        testthat::equals(23680))
