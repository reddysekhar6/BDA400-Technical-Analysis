# BDA400 Assignment 5 - Technical Analysis using R, Development Phase
# Student: Chinnakotla Reddysekhar
# IMPORTANT: Functions use base R/core functions only and preserve the required names.

# Load all indicator functions.
source("sma.R"); source("ema.R"); source("macd.R"); source("stdev.R")
source("linreg.R"); source("rsi.R"); source("stoch_rsi.R")
source("crossover.R"); source("crossunder.R")

sample <- c(10, 12, 15, 20, 18, 22, 25, 24, 21, 23, 27, 29, 31, 30, 32, 35, 34, 36, 38, 40)

print(sma(sample, 3))
print(ema(sample, 3))
print(macd(sample, 3, 5, 2))
print(stdev(sample))
print(linreg(sample, 10, 0))
print(rsi(sample, 5))
print(stoch_rsi(sample, 5, 3, 3))

arr1 <- c(1, 2, 3, 5, 4)
arr2 <- c(2, 2, 2, 3, 5)
print(crossover(arr1, arr2))
print(crossunder(arr1, arr2))

# Explicit signal-format checks based on the supplied pseudocode.
arr3 <- c(1, 3, 1, 4)
arr4 <- c(2, 2, 2, 3)
print(crossover(arr3, arr4))
print(crossunder(arr3, arr4))

# Intentional error tests:
# sma(c(1, 2), 3)
# crossover(c(1, 2), c(1))
