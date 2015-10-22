##
## File: test_02.R
## Author: Michael J. North
## Date: September 14, 2015
##

## Perform a test.
testthat::expect_that(
        SchemaOnRead::schemaOnRead(""),
        testthat::equals("Entry Does Not Exist"))
