# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

stdev <- function(data) {
  if (!is.numeric(data) || length(data) == 0) stop("data must be a non-empty numeric vector")
  mean_value <- sum(data) / length(data)
  diff_values <- numeric(length(data))
  for (i in 1:length(data)) diff_values[i] <- data[i] - mean_value
  squared_diff <- diff_values^2
  variance <- sum(squared_diff) / length(squared_diff)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}
