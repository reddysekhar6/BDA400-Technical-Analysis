# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

sma <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(data) < period) stop("Data length should be greater than or equal to the period")
  if (length(period) != 1 || period < 1 || period != as.integer(period)) stop("period must be a positive integer")
  sma_values <- numeric(length(data) - period + 1)
  for (i in 1:length(sma_values)) {
    current_window <- data[i:(i + period - 1)]
    sma_values[i] <- sum(current_window) / period
  }
  return(sma_values)
}
