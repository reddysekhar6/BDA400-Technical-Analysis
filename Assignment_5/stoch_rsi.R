# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

stoch_rsi <- function(data, period, k_period, d_period) {
  rsi_values <- rsi(data, period)
  valid_rsi <- rsi_values[!is.na(rsi_values)]
  if (length(valid_rsi) == 0) stop("No valid RSI values available")
  min_rsi <- min(valid_rsi)
  max_rsi <- max(valid_rsi)
  if (max_rsi == min_rsi) {
    k_values <- rep(0, length(rsi_values))
  } else {
    k_values <- (rsi_values - min_rsi) / (max_rsi - min_rsi)
  }
  k_values <- k_values[!is.na(k_values)]
  if (length(k_values) < k_period) stop("Not enough values for k_period")
  k_line <- sma(k_values, k_period)
  if (length(k_line) < d_period) stop("Not enough values for d_period")
  d_line <- sma(k_line, d_period)
  result <- list(k_line = k_line, d_line = d_line)
  return(result)
}
