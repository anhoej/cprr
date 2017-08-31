#' Scramble
#'
#' Create data frame translating CPR numbers to random numbers.
#'
#' @param cpr Character vector of CPR numbers without hyphens (10 digits).
#'
#' @return A data frame with corresponding CPR and anonymous id numbers.
#'
#' @examples
#'   scramble(c('1508631111', '1310762222'))
#'
#' @export
#'
scramble <- function(cpr) {
  x <- seq_along(sample(unique(cpr)))
  names(x) <- sample(unique(cpr))
  x <- x[cpr]
  names(x) <- NULL
  x
# scramble(c('1508631111', '1310762222', '1310762222', '1508631111'))
}

#' Date of birth
#'
#' Calculate date of birth from CPR number.
#'
#' @param cpr Character Vector of CPR numbers without hyphens (10 digits).
#'
#' @return Vector of dates of birth.
#'
#' @examples
#'   dob(c('1508631111', '1310762222'))
#'
#' @export
#'
dob <- function(cpr) {
  if(any(nchar(cpr) != 10)) {
    stop('One or more invalid CPR numbers.')
  }

  d <- lapply(cpr, dobone)
  d <- unlist(d)
  as.Date(d, origin = '1970-01-01')
}

#' Gender
#'
#' Calculate gender from CPR number.
#'
#' @param cpr Character Vector of CPR numbers without hyphen (10 digits).
#'
#' @return Integer vector of genders. 0 = Female, 1 = Male.
#'
#' @examples
#'   gender(c('1508631111', '1310762222'))
#'
#' @export
#'
gender <- function(cpr) {
  if(any(nchar(cpr) != 10)) {
    stop('One or more invalid CPR numbers.')
  }

  as.numeric(substring(cpr, 10)) %% 2

}

#' Age
#'
#' Calculate age from CPR number
#'
#' @param cpr Character Vector of CPR numbers without hyphen (10 digits).
#' @param date Character or date vector of dates used in computation of ages.
#'   Dates provided as characters must follow the ISO standard, 'yyyy-mm-dd'.
#' @param unit Character indicating the unit representing ages. Possible values
#'   are: 'year', 'month', 'week', 'day'.
#'
#' @return A numeric vector of ages. By default, ages are computed in years.
#'   Note that year and month units are calculated by approximaion, 1 year =
#'   365.25 days, 1 month = 30.44 days.
#'
#' @examples
#'   age(c('1508631111', '1310762222'))
#'
#' @export
#'
age <- function(cpr, date = Sys.Date(), unit = 'year') {
  if(any(nchar(cpr) != 10)) {
    stop('One or more invalid CPR numbers.')
  }

  u <- switch(unit,
              'year' = 365.25,
              'month' = 30.44,
              'week' = 7,
              'day' = 1)
  d1 <- dob(cpr)
  d2 <- as.Date(date)
  a <- as.numeric(d2 - d1, units = 'days')
  a / u
}

dobone <- function(cpr) {
  dd <- as.numeric(substr(cpr, 1, 2))
  mm <- as.numeric(substr(cpr, 3, 4))
  yy <- as.numeric(substr(cpr, 5, 6))
  x7 <- as.numeric(substr(cpr, 7, 7))

  if(x7 < 4) {
    yyyy <- 1900
  } else if(x7 == 4 & yy < 37) {
    yyyy <- 2000
  } else if(x7 == 4) {
    yyyy <- 1900
  } else if(x7 == 5 & yy < 58) {
    yyyy <- 2000
  } else if(x7 == 5) {
    yyyy <- 1800
  } else if(x7 == 6 & yy < 58) {
    yyyy <- 2000
  } else if(x7 == 6) {
    yyyy <- 1800
  } else if(x7 == 7 & yy < 58) {
    yyyy <- 2000
  } else if(x7 == 7) {
    yyyy <- 1800
  } else if(x7 == 8 & yy < 58) {
    yyyy <- 2000
  } else if(x7 == 8) {
    yyyy <- 1800
  } else if(x7 == 9 & yy < 37) {
    yyyy <- 2000
  } else {
    yyyy <- 1900
  }

  yyyy <- yyyy + yy

  as.Date(paste(yyyy, mm, dd, sep = '-'))
}
