# BDA400 Assignment 1 - Synthetic analysis script
# Student: Chinnakotla Reddysekhar
# This simple script is the R source documented by technical_analysis_documentation.Rmd.
# It uses only synthetic values so the documentation workflow remains reproducible.

analysis_data <- c(12, 15, 18, 21, 24, 27, 30, 33)

analysis_summary <- data.frame(
  Count = length(analysis_data),
  Mean = mean(analysis_data),
  Median = median(analysis_data),
  Minimum = min(analysis_data),
  Maximum = max(analysis_data),
  Standard_Deviation = sd(analysis_data)
)

print(analysis_summary)
