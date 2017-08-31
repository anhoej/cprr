# cprr

Functions for working with Danish CPR numbers.

Calculate date of birth, age, gender, and random "anonymous" numbers from CPR numbers.

## Installation

Install from GitHub: `devtools::install_github('anhoej/cprr')`

## Use

`cpr <- c('1508631111', '1310762222')`

`dob(cpr)`

`age(cpr)`

`gender(cpr)`

`scramble(cpr)`
