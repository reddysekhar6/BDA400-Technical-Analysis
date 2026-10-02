# BDA400 Assignment 3 - Initial AI-generated function
# Student: Chinnakotla Reddysekhar
# This file preserves the initial function form produced from the seed prompt.

remove_iqr_outliers_ai <- function(data) {
  q1 <- quantile(data, 0.25, na.rm = TRUE)
  q3 <- quantile(data, 0.75, na.rm = TRUE)
  iqr_value <- q3 - q1
  lower <- q1 - 1.5 * iqr_value
  upper <- q3 + 1.5 * iqr_value
  data[!is.na(data) & data >= lower & data <= upper]
}
