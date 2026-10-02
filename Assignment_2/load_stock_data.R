# BDA400 Assignment 2 - Load stock data
# Student: Chinnakotla Reddysekhar
# This script reads portfolio.txt and imports each symbol with quantmod.

load_stock_data <- function(portfolio_file = "portfolio.txt") {
  if (!file.exists(portfolio_file)) {
    stop("The portfolio file does not exist.")
  }
  symbols <- readLines(portfolio_file, warn = FALSE)
  symbols <- trimws(symbols)
  symbols <- symbols[nzchar(symbols)]
  if (length(symbols) == 0) stop("portfolio.txt does not contain any symbols.")

  if (!requireNamespace("quantmod", quietly = TRUE)) {
    stop("Please install the quantmod package before running this function.")
  }

  stock_data <- list()
  for (symbol in symbols) {
    data_xts <- quantmod::getSymbols(symbol, src = "yahoo", auto.assign = FALSE)
    stock_data[[symbol]] <- as.data.frame(data_xts)
  }
  stock_data
}
