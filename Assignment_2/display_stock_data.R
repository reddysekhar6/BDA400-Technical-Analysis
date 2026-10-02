# BDA400 Assignment 2 - Display data and statistics
# Student: Chinnakotla Reddysekhar

display_stock_data <- function(stock_data, n = 10) {
  if (!is.list(stock_data)) stop("stock_data must be a list.")
  for (symbol in names(stock_data)) {
    cat("\n==============================\n")
    cat("Symbol:", symbol, "\n")
    cat("==============================\n")
    print(utils::head(stock_data[[symbol]], n))
  }
}

plot_close_price <- function(stock_df, symbol = "Stock") {
  candidates <- grep("Close", names(stock_df), value = TRUE)
  if (length(candidates) == 0) stop("No Close column was found.")
  close_price <- as.numeric(stock_df[[candidates[1]]])
  plot(close_price, type = "l", main = paste(symbol, "Closing Price"),
       xlab = "Observation", ylab = "Close Price")
}
