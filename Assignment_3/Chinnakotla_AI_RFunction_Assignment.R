# BDA400 Assignment 3 - Prompting R Functions with AI
# Student: Chinnakotla Reddysekhar
# Task: Remove statistical outliers from a numeric vector using the IQR rule.
#
# AI Assistance Declaration:
# ChatGPT (GPT-5.6 Luna) was used for ideation, function structure, comments,
# and prompt refinement. Verification cases are included below for reproducibility.

# Original task description:
# "Create an R function that removes statistical outliers from a numeric vector
# using the interquartile range (IQR) rule while handling missing values."

# Seed prompt:
# "Write an R function that removes outliers from a numeric vector using the IQR rule."

# Refinement prompt:
# "Revise the function to include comments, argument validation, and return a clean result."

# Testing prompt:
# "How could you test this function with normal values, an obvious outlier,
# NA values, and a vector too short for an IQR calculation?"

remove_iqr_outliers <- function(data, na.rm = TRUE) {
  # Validate that the input is numeric.
  if (!is.numeric(data)) {
    stop("data must be a numeric vector.")
  }

  # Validate that the input contains enough observations.
  if (length(data) < 4) {
    stop("data must contain at least four observations.")
  }

  # Remove missing values when requested.
  if (na.rm) {
    data <- data[!is.na(data)]
  } else if (anyNA(data)) {
    stop("data contains NA values; set na.rm = TRUE or remove them first.")
  }

  if (length(data) < 4) {
    stop("At least four non-missing observations are required.")
  }

  # Calculate the first and third quartiles.
  q1 <- as.numeric(quantile(data, 0.25, names = FALSE))
  q3 <- as.numeric(quantile(data, 0.75, names = FALSE))

  # Calculate the interquartile range.
  iqr_value <- q3 - q1

  # Define the lower and upper acceptable limits.
  lower <- q1 - 1.5 * iqr_value
  upper <- q3 + 1.5 * iqr_value

  # Keep only values inside the acceptable interval.
  cleaned <- data[data >= lower & data <= upper]

  # Return the cleaned vector.
  cleaned
}

# Test data
sample_data <- c(10, 15, 999, 20, 25, NA, 18, 22)

# Test the function
cleaned_data <- remove_iqr_outliers(sample_data)
print(cleaned_data)

# Independent comparison using base R's boxplot.stats()
reference <- boxplot.stats(sample_data[!is.na(sample_data)])$stats
print(reference)

# Edge-case test: invalid input
# remove_iqr_outliers(c("10", "20", "30", "40"))
# Edge-case test: fewer than four observations
# remove_iqr_outliers(c(10, 20, 30))
