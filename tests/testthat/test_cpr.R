library(cprr)
context('CPR validation')

test_that('Date of birth is corretly calculated from test CPR numbers',
          expect_identical(dob(test_cpr$cpr), test_cpr$dob))

test_that('Gender is corretly calculated from test CPR numbers',
          expect_identical(gender(test_cpr$cpr), test_cpr$gender))
