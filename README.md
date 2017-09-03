
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
#> [1] 2 1 3 2
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
