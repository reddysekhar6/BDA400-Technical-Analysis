# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

rsi <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(data) < period + 1) stop("Data length must be at least period + 1")
  diff_values <- diff(data)
  gains <- numeric(length(diff_values))
  losses <- numeric(length(diff_values))
  for (i in 1:length(diff_values)) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
      losses[i] <- 0
    } else {
      gains[i] <- 0
      losses[i] <- abs(diff_values[i])
    }
  }
  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period
  rsi_values <- rep(NA_real_, length(data))
  for (i in (period + 1):length(data)) {
    avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
    avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period
    if (avg_loss == 0) {
      rsi_values[i] <- 100
    } else {
      rs <- avg_gain / avg_loss
      rsi_values[i] <- 100 - (100 / (1 + rs))
    }
  }
  return(rsi_values)
}
