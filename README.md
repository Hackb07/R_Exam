# R Programming for Data Science - Exam Preparation

## Experiments Overview

| # | Experiment | Topics Covered |
|---|-----------|----------------|
| [1](01_Basic_R_Commands/) | Basic R Commands | Arithmetic, relational, logical operators; assignments; type checks; sequences; built-in functions |
| [2](02_Vectors_Matrices_Dataframes_Lists/) | Vectors, Matrices, Dataframes, Lists | Creating, accessing, manipulating all 4 core data structures |
| [3](03_Factors_and_Importance/) | Factors and their Importance | Ordered/unordered factors, levels, cut(), memory efficiency, statistical modeling, cross-tabulation |
| [4](04_CSV_File_Handling/) | CSV File Handling | write.csv, read.csv, write.table, file.exists, file.info, file.rename, file.copy, file.remove |
| [5](05_Read_CSV_Write_Updated/) | Read CSV → Update → Write New File | Full data pipeline: read, transform, write updated CSV |
| [6](06_Data_Manipulation/) | Data Manipulation (mtcars, iris) | Filter, sort, aggregate, apply family, merge, missing values |
| [7](07_Sum_Even_Product_Odd/) | Sum of Evens / Product of Odds | Vectorized, for loop, while loop, reusable function |
| [8](08_Functions_in_R/) | Functions in R | sum_of_squares, is_prime, calculator, custom_sum_function, mandatory & optional arguments |
| [9](09_Debugging_Coin_Toss/) | Debugging & Coin Toss | traceback, browser, tryCatch, coin toss simulation, LLN, biased coin, binomial distribution |
| [10](10_R_RStudio_Installation/) | R & RStudio Installation | Windows/macOS/Linux install, verification, package setup |

## How to Run

```r
source("01_Basic_R_Commands/code.R")
source("02_Vectors_Matrices_Dataframes_Lists/code.R")
# or the all-in-one:
source("exam_prep.R")
```

## R & RStudio Installation

See [Experiment 10](10_R_RStudio_Installation/) and [INSTALL.md](INSTALL.md) for installation guides on Windows, macOS, and Linux.

## Directory Structure

```
R/
├── README.md
├── INSTALL.md
├── exam_prep.R
├── 01_Basic_R_Commands/
│   ├── README.md
│   └── code.R
├── 02_Vectors_Matrices_Dataframes_Lists/
│   ├── README.md
│   └── code.R
├── 03_Factors_and_Importance/
│   ├── README.md
│   └── code.R
├── 04_CSV_File_Handling/
│   ├── README.md
│   └── code.R
├── 05_Read_CSV_Write_Updated/
│   ├── README.md
│   └── code.R
├── 06_Data_Manipulation/
│   ├── README.md
│   └── code.R
├── 07_Sum_Even_Product_Odd/
│   ├── README.md
│   └── code.R
├── 08_Functions_in_R/
│   ├── README.md
│   └── code.R
├── 09_Debugging_Coin_Toss/
│   ├── README.md
│   └── code.R
└── 10_R_RStudio_Installation/
    ├── README.md
    └── code.R
```
