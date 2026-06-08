# Experiment 6: Data Manipulation using mtcars and Other Built-in Datasets

## Aim
To perform comprehensive data manipulation operations on built-in R datasets (mtcars, iris, airquality, etc.) including viewing, filtering, sorting, adding columns, aggregation, apply family functions, and merging.

## Algorithm

```
Step 1: Load built-in datasets (mtcars, iris, airquality)
Step 2: View data using head(), tail(), str(), summary()
Step 3: Filter rows using subset() and bracket notation with conditions
Step 4: Select specific columns
Step 5: Sort data using order() (ascending and descending)
Step 6: Add new columns using $ assignment and transform()
Step 7: Aggregate data using aggregate() with formula interface
Step 8: Use apply family (lapply, sapply, tapply, apply)
Step 9: Merge two dataframes using merge()
Step 10: Perform iris-specific analysis (group means, derived columns)
Step 11: Handle missing values with na.omit() on airquality
Step 12: End
```

## Code

[code.R](code.R)

```r
# LOAD
data(mtcars); data(iris); data(airquality)

# VIEW
head(mtcars); tail(mtcars); str(mtcars); summary(mtcars)

# FILTER
subset(mtcars, mpg > 25)
mtcars[mtcars$hp > 200, ]
mtcars[mtcars$wt < 3, c("mpg", "wt")]

# SORT
mtcars[order(mtcars$mpg), ]
mtcars[order(mtcars$mpg, decreasing = TRUE), ]
mtcars[order(mtcars$cyl, -mtcars$mpg), ]

# ADD COLUMNS
mtcars$mpg_cat <- ifelse(mtcars$mpg > 20, "High", "Low")
transform(mtcars, heavy = wt > 3.5)

# AGGREGATE
aggregate(mpg ~ cyl, data = mtcars, FUN = mean)
aggregate(. ~ cyl, data = mtcars, FUN = mean)

# APPLY FAMILY
lapply(mtcars, mean); sapply(mtcars, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)

# MERGE
merge(df1, df2, by = "Sepal.Length")

# MISSING VALUES
na.omit(airquality)
```

## Output

```
===== DATA MANIPULATION WITH BUILT-IN DATASETS =====

1. EXPLORING BUILT-IN DATASETS
--- mtcars dataset ---
dim: 32 11  |  rows: 32 cols: 11

2. VIEWING DATA
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1

3. FILTERING
Cars with mpg > 25:
                mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1

6. AGGREGATION
Mean mpg by cylinder:
  cyl      mpg
1   4 26.66364
2   6 19.74286
3   8 15.10000

7. APPLY FAMILY
sapply(mtcars, mean):
       mpg        cyl       disp         hp       drat         wt       qsec
  20.09062    6.18750  230.72188  146.68750    3.59656    3.21725   17.84875
```

## Result

Data manipulation on built-in datasets was successfully demonstrated. Key techniques covered: filtering with conditions, multi-key sorting, adding derived columns, aggregation with formula syntax (aggregate), apply family functions (lapply/sapply/tapply/apply), merging dataframes, handling missing values (na.omit), and grouped statistical summaries. These operations form the core of data wrangling in R.
