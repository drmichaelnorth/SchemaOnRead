##
## File: test_13.R
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
        "spreadsheet.ods",
        sep = "")

## Perform a test.
print(SchemaOnRead::schemaOnRead(path))
testthat::expect_that(
        length(SchemaOnRead::schemaOnRead(path)),
        testthat::equals(2))
