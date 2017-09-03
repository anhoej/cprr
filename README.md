
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/anhoej/cprr.svg?branch=master)](https://travis-ci.org/anhoej/cprr)

cprr
====

Functions for working with Danish CPR numbers.

Calculate date of birth, age, and gender, and generate anonymous sequence numbers from CPR numbers.

Examples
--------

``` r
# Load cprr
library(cprr)

# Make vector of example cpr numbers
cpr <- c('150863-1111', '020962-4444', '131076-2222', '150863-1111')

# Caluculate dates of birth from cpr numbers
dob(cpr)
#> [1] "1963-08-15" "1962-09-02" "1976-10-13" "1963-08-15"

# Calculate ages from cpr numbers
age(cpr)
#> [1] 54.05339 55.00342 40.88980 54.05339

# Calculate genders from cpr numbers
gender(cpr)
#> [1] 1 0 0 1

# Generate anonymous sequence numbers from cpr numbers
scramble(cpr)
#> [1] 2 3 1 2

# Make data frame from build in data set of official test cpr numbers
data.frame(
  cpr    = test_cpr$cpr,
  id     = scramble(test_cpr$cpr),
  dob    = dob(test_cpr$cpr),
  gender = gender(test_cpr$cpr)
)
#>           cpr id        dob gender
#> 1  0104909995 20 1990-04-01      1
#> 2  0104909989  7 1990-04-01      1
#> 3  0107729995 23 1972-07-01      1
#> 4  0108589995 18 1958-08-01      1
#> 5  0108629996  3 1962-08-01      0
#> 6  0201609995 30 1960-01-02      1
#> 7  0201609996 21 1960-01-02      0
#> 8  0201919990  8 1991-01-02      0
#> 9  0201919995  6 1991-01-02      1
#> 10 0201919996 29 1991-01-02      0
#> 11 0211223989  5 1922-11-02      1
#> 12 0212159995 13 2015-12-02      1
#> 13 0504909989 28 1990-04-05      1
#> 14 0504909995  2 1990-04-05      1
#> 15 0506889996 16 1988-06-05      0
#> 16 1007059995 26 2005-07-10      1
#> 17 1110109996 27 2010-10-11      0
#> 18 1310169995 22 2016-10-13      1
#> 19 1310169996 11 2016-10-13      0
#> 20 1502779995  4 1977-02-15      1
#> 21 1502799995 10 1979-02-15      1
#> 22 1502829995 25 1982-02-15      1
#> 23 1509819996  1 1981-09-15      0
#> 24 2103009996 17 2000-03-21      0
#> 25 2311143995  9 1914-11-23      1
#> 26 2509479989 12 1947-09-25      1
#> 27 2512489996 15 1948-12-25      0
#> 28 2911829996 19 1982-11-29      0
#> 29 3001749995 14 1974-01-30      1
#> 30 3103979995 24 1997-03-31      1
```

Installation
------------

You can install cprr from github with:

``` r
# install.packages("devtools")
devtools::install_github("anhoej/cprr")
```

About CPR numbers
-----------------

The Danish Personal Identification number (Danish: *CPR-nummer* or *personnummer*) is a national identification number, which is part of the personal information stored in the Civil Registration System (Danish: *[Det Centrale Personregister](https://www.cpr.dk/)*).

It is a ten-digit number with the format DDMMYY-SSSS, where DDMMYY is the date of birth and SSSS is a sequence number. The first digit of the sequence number encodes the century of birth (so that centenarians are distinguished from infants), and the last digit of the sequence number is odd for males and even for females.

The civil register lists only persons who:

-   Are born in Denmark of a mother already registered in the civil register, or
-   have their birth or baptism registered in a ’Dansk Elektronisk Kirkebog (DNK)’ (Danish electronic church-book), or
-   reside legally in Denmark for 3 months or more (non-Nordic citizens must also have a residence permit).

Danish citizens, including newborn babies, who are entitled to Danish citizenship, but are living abroad, do not receive a personal ID number, unless they move to Denmark.

Source: <https://en.wikipedia.org/wiki/Personal_identification_number_(Denmark)>
