##
## File: run_tests.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Read the code to be tested.
source(paste(
        "..", .Platform$file.sep,
        "..", .Platform$file.sep,
        "SchemaOnRead", .Platform$file.sep,
        "R", .Platform$file.sep,
        "SchemaOnRead.R",
        sep = ""))

## Set the testing folder.
testthat::test_dir(paste(
        "..", .Platform$file.sep,
        "..", .Platform$file.sep,
        "SchemaOnRead", .Platform$file.sep,
        "tests", .Platform$file.sep,
        sep = ""),
        reporter = "Summary")
