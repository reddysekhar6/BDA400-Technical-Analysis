# BDA400 Assignment 4 - Clean synthetic sales data
# Student: Chinnakotla Reddysekhar
# Input: 08 BDA400 Assignment 4 - sales_data_dirty.csv
#
# AI Assistance Declaration:
# ChatGPT (GPT-5.6 Luna) was used for ideation, code-structure suggestions,
# and explanation. All data-quality decisions must be verified against the
# supplied synthetic dataset.

library(dplyr)

sales_data <- read.csv("08 BDA400 Assignment 4 - sales_data_dirty.csv",
                       stringsAsFactors = FALSE)

# BEFORE checks
cat("Rows before:", nrow(sales_data), "\n")
cat("Duplicate rows before:", sum(duplicated(sales_data)), "\n")
cat("Missing Product before:", sum(is.na(sales_data$Product)), "\n")
cat("Missing Quantity before:", sum(is.na(sales_data$Quantity)), "\n")
cat("Non-positive Quantity before:", sum(sales_data$Quantity <= 0, na.rm = TRUE), "\n")
cat("Quantity equal to 1000 before:", sum(sales_data$Quantity == 1000, na.rm = TRUE), "\n")

# Cleaning decisions:
# 1. Remove exact duplicate rows.
# 2. Remove records with missing Product or Quantity because those fields are
#    required for a usable sales record.
# 3. Remove non-positive quantities because a completed sale cannot have a
#    zero or negative quantity in this synthetic dataset.
# 4. Remove the extreme quantity value 1000 as an unreasonable outlier.

clean_sales_data <- sales_data %>%
  distinct() %>%
  filter(!is.na(Product), !is.na(Quantity)) %>%
  filter(Quantity > 0) %>%
  filter(Quantity < 1000)

# AFTER checks
cat("Rows after:", nrow(clean_sales_data), "\n")
cat("Duplicate rows after:", sum(duplicated(clean_sales_data)), "\n")
cat("Total missing values after:", sum(is.na(clean_sales_data)), "\n")
cat("Non-positive Quantity after:", sum(clean_sales_data$Quantity <= 0), "\n")
cat("Quantity equal to 1000 after:", sum(clean_sales_data$Quantity == 1000), "\n")
cat("Products after cleaning:\n")
print(table(clean_sales_data$Product))

# Save cleaned data
write.csv(clean_sales_data, "clean_sales_data.csv", row.names = FALSE)
