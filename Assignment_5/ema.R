# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

ema <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(period) != 1 || period < 1 || period != as.integer(period)) stop("period must be a positive integer")
  multiplier <- 2 / (period + 1)
  ema_values <- numeric(length(data))
  for (i in 1:length(data)) {
    if (i == 1) {
      ema_values[i] <- data[i]
    } else {
      ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier + ema_values[i - 1]
    }
  }
  return(ema_values)
}
