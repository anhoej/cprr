library(cprr)
context('CPR validation')

test_that('Date of birth is corretly calculated from test CPR numbers',
          expect_equal(dob(test_cpr$cpr), test_cpr$dob))

test_that('Gender is corretly calculated from test CPR numbers',
          expect_equal(gender(test_cpr$cpr), test_cpr$gender))
