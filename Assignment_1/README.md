# BDA400 Technical Analysis using R

## Overview
This project documents a staged R-based technical analysis workflow for historical stock data. The project begins with professional Markdown documentation and continues into data import, descriptive statistics, technical indicators, and development-stage implementations.

## Project Objectives
- Organize an R analytics project for GitHub.
- Document scripts and workflows using Markdown and R Markdown.
- Import historical stock data using `quantmod`.
- Calculate basic statistics and technical indicators.
- Keep code readable, reproducible, and easy to review.

## Repository Structure
```text
BDA400-Technical-Analysis/
├── Assignment_1/
│   ├── README.md
│   ├── Reflection.md
│   ├── analysis.R
│   └── technical_analysis_documentation.Rmd
├── Assignment_2/
│   ├── portfolio.txt
│   ├── load_stock_data.R
│   ├── calculate_statistics.R
│   └── display_stock_data.R
├── Assignment_3/
│   └── Chinnakotla_AI_RFunction_Assignment.R
├── Assignment_4/
│   ├── Chinnakotla_Reddysekhar_clean_sales_data.R
│   └── Chinnakotla_Reddysekhar_reflection.txt
└── Assignment_5/
    ├── sma.R
    ├── ema.R
    ├── macd.R
    ├── stdev.R
    ├── linreg.R
    ├── rsi.R
    ├── stoch_rsi.R
    ├── crossover.R
    └── crossunder.R
```

## Installation
Install R and RStudio. For the stock-data stage, install the packages used by the project:

```r
install.packages("quantmod")
install.packages("TTR")
```

## Example Usage
```r
source("analysis.R")
summary(analysis_data)
```

## Data
The course instructions specify synthetic datasets for the AI-assisted assignments. Stock-data examples in the technical-analysis stage are designed around publicly available historical market data.

## Verification
Markdown headings, lists, code blocks, and file organization should be previewed before committing to GitHub. R code should be tested in RStudio, and numerical results should be independently checked.

## AI Assistance Disclosure
**Tool:** ChatGPT (GPT-5.6 Luna)  
**Use:** Documentation structure, prompt refinement, code-organization suggestions, and explanation.  
**Human review:** The final structure and code should be checked against the assignment instructions before submission.

## License
This course project is prepared for academic submission and is not intended as financial advice.

## GitHub Repository
**Repository:** [BDA400-Technical-Analysis](https://github.com/reddysekhar6/BDA400-Technical-Analysis)  
**Student:** Chinnakotla Reddysekhar  
**Course:** BDA400 / Data Science Tools and Techniques

