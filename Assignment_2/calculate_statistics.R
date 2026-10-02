# BDA400 Assignment 2 - Basic statistics
# Student: Chinnakotla Reddysekhar

mode_value <- function(x) {
  x <- x[!is.na(x)]
  if (length(x) == 0) return(NA_real_)
  tab <- table(x)
  as.numeric(names(tab)[which.max(tab)])
}

calculate_statistics <- function(stock_df, price_column = NULL, moving_average_period = 20) {
  if (!is.data.frame(stock_df)) stop("stock_df must be a data frame.")
  if (is.null(price_column)) {
    candidates <- grep("Close", names(stock_df), value = TRUE)
    if (length(candidates) == 0) stop("No Close column was found.")
    price_column <- candidates[1]
  }
  prices <- as.numeric(stock_df[[price_column]])
  prices <- prices[is.finite(prices)]
  if (length(prices) == 0) stop("No numeric price data available.")
  ma <- if (length(prices) >= moving_average_period) mean(tail(prices, moving_average_period)) else mean(prices)
  data.frame(
    Moving_Average = ma,
    Mean = mean(prices),
    Mode = mode_value(prices),
    Median = median(prices),
    Standard_Deviation = sd(prices)
  )
}
