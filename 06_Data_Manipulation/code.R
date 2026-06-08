# ============================================================
# Experiment 6: Data Manipulation using mtcars and Built-in Datasets
# ============================================================

cat("===== DATA MANIPULATION WITH BUILT-IN DATASETS =====\n\n")

# ==================== 1. EXPLORE DATASETS ====================

cat("1. EXPLORING BUILT-IN DATASETS\n\n")

data()  # Lists all available datasets - uncomment to see

# Load datasets
data(mtcars)
data(iris)
data(airquality)
data(CO2)

cat("--- mtcars dataset ---\n")
cat("dim:", dim(mtcars), "  |  rows:", nrow(mtcars), "cols:", ncol(mtcars), "\n")
cat("names:", names(mtcars), "\n")

cat("\n--- iris dataset ---\n")
cat("dim:", dim(iris), "  |  Species:", levels(iris$Species), "\n")

# ==================== 2. VIEWING DATA ====================

cat("\n2. VIEWING DATA\n\n")

cat("head(mtcars):\n")
print(head(mtcars))

cat("\ntail(mtcars, 3):\n")
print(tail(mtcars, 3))

cat("\nstr(mtcars):\n")
str(mtcars)

cat("\nsummary(mtcars):\n")
summary(mtcars)

# ==================== 3. FILTERING / SUBSETTING ====================

cat("\n3. FILTERING / SUBSETTING\n\n")

# Using subset()
cat("Cars with mpg > 25:\n")
print(subset(mtcars, mpg > 25))

cat("\nCars with cyl == 6 and gear == 4:\n")
print(subset(mtcars, cyl == 6 & gear == 4))

# Using bracket notation
cat("\nCars with hp > 200:\n")
print(mtcars[mtcars$hp > 200, ])

# Select specific columns
cat("\nSelect mpg, wt, qsec for cars with wt < 3:\n")
print(mtcars[mtcars$wt < 3, c("mpg", "wt", "qsec")])

# ==================== 4. SORTING ====================

cat("\n4. SORTING\n\n")

cat("Cars sorted by mpg (ascending):\n")
print(head(mtcars[order(mtcars$mpg), ], 5))

cat("\nCars sorted by mpg (descending):\n")
print(head(mtcars[order(mtcars$mpg, decreasing = TRUE), ], 5))

cat("\nCars sorted by cyl then mpg:\n")
print(head(mtcars[order(mtcars$cyl, -mtcars$mpg), ], 8))

# ==================== 5. ADDING COLUMNS ====================

cat("\n5. ADDING / MODIFYING COLUMNS\n\n")

mtcars2 <- mtcars
mtcars2$mpg_category <- ifelse(mtcars2$mpg > 20, "High", "Low")
mtcars2$wt_kg <- mtcars2$wt * 453.592  # convert from 1000 lbs to kg
mtcars2$efficiency <- mtcars2$mpg / mtcars2$wt

cat("New columns added:\n")
print(head(mtcars2[, c("mpg", "wt", "mpg_category", "wt_kg", "efficiency")], 5))

# Using transform()
mtcars3 <- transform(mtcars,
                     mpg_per_cyl = mpg / cyl,
                     heavy = wt > 3.5)
cat("\nUsing transform():\n")
print(head(mtcars3[, c("mpg", "cyl", "mpg_per_cyl", "wt", "heavy")], 5))

# ==================== 6. AGGREGATION ====================

cat("\n6. AGGREGATION\n\n")

# Using aggregate()
cat("Mean mpg by cylinder:\n")
print(aggregate(mpg ~ cyl, data = mtcars, FUN = mean))

cat("\nMean of all numeric cols by cylinder:\n")
print(aggregate(. ~ cyl, data = mtcars, FUN = mean))

cat("\nMean mpg by cyl and gear:\n")
print(aggregate(mpg ~ cyl + gear, data = mtcars, FUN = mean))

cat("\nSummary stats by cylinder:\n")
print(aggregate(mpg ~ cyl, data = mtcars,
                FUN = function(x) c(mean = mean(x), sd = sd(x),
                                    min = min(x), max = max(x))))

# ==================== 7. APPLY FAMILY ====================

cat("\n7. APPLY FAMILY\n\n")

# lapply - returns list
cat("lapply(mtcars, mean) - first 5:\n")
print(head(lapply(mtcars, mean), 5))

# sapply - simplifies output
cat("\nsapply(mtcars, mean):\n")
print(sapply(mtcars, mean))

cat("\nsapply(mtcars, summary):\n")
print(sapply(mtcars[, 1:4], summary))

# tapply - grouped application
cat("\ntapply(mpg ~ cyl, mean):\n")
print(tapply(mtcars$mpg, mtcars$cyl, mean))

# apply on dataframe (margin=1 rows, margin=2 cols)
cat("\napply(mtcars[, 1:4], 2, sum):\n")
print(apply(mtcars[, 1:4], 2, sum))

# ==================== 8. MERGING / JOINING ====================

cat("\n8. MERGING DATAFRAMES\n\n")

df1 <- iris[1:5, c("Sepal.Length", "Sepal.Width", "Species")]
df2 <- iris[1:5, c("Sepal.Length", "Petal.Length", "Petal.Width")]
cat("df1:\n"); print(df1)
cat("\ndf2:\n"); print(df2)
cat("\nmerged (by Sepal.Length):\n")
print(merge(df1, df2, by = "Sepal.Length"))

# ==================== 9. IRIS EXAMPLE ====================

cat("\n9. IRIS DATA MANIPULATION\n\n")

cat("Mean sepal length by Species:\n")
print(aggregate(Sepal.Length ~ Species, data = iris, FUN = mean))

cat("\nIris setosa only:\n")
setosa <- subset(iris, Species == "setosa")
print(head(setosa, 3))

cat("\nIris with new column:\n")
iris2 <- iris
iris2$Sepal.Area <- iris2$Sepal.Length * iris2$Sepal.Width
iris2$Petal.Area <- iris2$Petal.Length * iris2$Petal.Width
iris2$Total.Area <- iris2$Sepal.Area + iris2$Petal.Area
print(head(iris2[, c("Species", "Sepal.Area", "Petal.Area", "Total.Area")]))

# ==================== 10. AIRQUALITY EXAMPLE ====================

cat("\n10. AIRQUALITY DATA MANIPULATION\n\n")

data(airquality)
cat("Summary of airquality:\n")
summary(airquality)

cat("\nComplete cases only:\n")
aq_clean <- na.omit(airquality)
cat("Rows before:", nrow(airquality), ", after:", nrow(aq_clean), "\n")

cat("\nMean ozone by month:\n")
print(aggregate(Ozone ~ Month, data = airquality,
                FUN = mean, na.rm = TRUE))
