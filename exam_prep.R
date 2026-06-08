# ============================================================
# R Programming Exam Preparation - Data Science
# ============================================================

# ---- 1. BASIC R COMMANDS ----

# Arithmetic
2 + 3; 10 - 4; 5 * 6; 20 / 4; 3^2; 10 %% 3; 10 %/% 3

# Relational
5 > 3; 5 < 3; 5 == 5; 5 != 4; 5 >= 5; 5 <= 4

# Logical
TRUE & FALSE; TRUE | FALSE; !TRUE

# Assignment
x <- 10
y = 20
30 -> z
assign("a", 100)

# Data type checks
is.numeric(x); is.character("hello"); is.logical(TRUE); is.vector(x)

# Type conversion
as.character(x); as.numeric("50"); as.factor(c("a","b"))

# Sequences
1:10
seq(1, 10, by = 2)
rep(3, 5)
rep(c("A","B"), each = 3)

# Help
# ?mean
# help(mean)

# Working directory
getwd()
# setwd("C:/path")

# ---- 2. VECTORS, MATRICES, DATAFRAMES, LISTS ----

# --- VECTORS ---
v1 <- c(1, 2, 5, 7, 9)                # numeric vector
v2 <- c("apple", "banana", "cherry")   # character vector
v3 <- c(TRUE, FALSE, TRUE)             # logical vector
v4 <- 1:10                             # sequence vector

# Named vector
v5 <- c(a = 10, b = 20, c = 30)

# Vector operations
v1 + 10; v1 * 2; sqrt(v1); sum(v1); mean(v1); length(v1)
v1[c(1, 3)]          # access by index
v1[2:4]              # range
v1[v1 > 4]          # conditional

# --- MATRICES ---
m1 <- matrix(1:12, nrow = 3, ncol = 4)
m2 <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
m3 <- matrix(c(2,4,6,8), nrow = 2)

# Row/Column binding
rbind(c(1,2), c(3,4))
cbind(c(1,2), c(3,4))

# Named matrix
m4 <- matrix(1:6, nrow = 2,
             dimnames = list(c("r1","r2"), c("c1","c2","c3")))

# Access
m1[2, 3]            # single element
m1[1, ]             # first row
m1[, 2]             # second column
m1[1:2, 3:4]        # sub-matrix
t(m1)               # transpose
m1 %*% t(m1)        # matrix multiplication
diag(m1)            # diagonal
rownames(m4); colnames(m4)

# --- DATAFRAMES ---
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age  = c(25, 30, 35),
  Score = c(88, 92, 85),
  Pass  = c(TRUE, TRUE, FALSE)
)

# Access
df$Name
df[, "Age"]
df[1, ]
df[1:2, c("Name", "Score")]

# Structure
str(df)
summary(df)
dim(df); nrow(df); ncol(df)
head(df); tail(df)
names(df)

# Add columns
df$Grade <- c("B", "A", "B")
df$City <- c("NYC", "LA", "Chicago")

# Subset
subset(df, Age > 28)
df[df$Pass == TRUE, ]

# --- LISTS ---
lst <- list(
  numbers = c(10, 20, 30),
  matrix  = matrix(1:4, nrow = 2),
  df      = df,
  text    = "hello"
)

# Access
lst[[1]]; lst$numbers; lst[["df"]]
lst[c("numbers", "text")]

# Add to list
lst$new_item <- 100

# ---- 3. FACTORS ----

# Creating factors
f1 <- factor(c("low", "medium", "high", "low", "medium"))
f2 <- factor(c("low", "medium", "high"),
             levels = c("low", "medium", "high"), ordered = TRUE)

# Levels
levels(f1)
nlevels(f1)

# Ordered factors (importance: comparisons allowed)
temp <- factor(c("cold", "hot", "warm", "hot"),
               levels = c("cold", "warm", "hot"), ordered = TRUE)
temp[1] < temp[2]  # TRUE

# Factor from numeric bins
scores <- c(55, 72, 88, 91, 63, 78)
cut(scores, breaks = c(0, 60, 75, 90, 100),
    labels = c("Fail", "Pass", "Merit", "Distinction"))

# Table of counts
table(f1)

# ---- 4. CSV FILE HANDLING ----

# Create a CSV file
data_to_write <- data.frame(
  ID = 1:5,
  Name = c("A", "B", "C", "D", "E"),
  Score = c(90, 85, 78, 92, 88)
)
write.csv(data_to_write, "sample.csv", row.names = FALSE)

# Read CSV
df_csv <- read.csv("sample.csv")

# Read with options
df_csv2 <- read.csv("sample.csv", header = TRUE, sep = ",",
                    stringsAsFactors = FALSE)

# Write CSV (different name)
write.csv(df_csv, "output.csv", row.names = FALSE)

# Other file handling commands
# file.exists("sample.csv")
# file.remove("sample.csv")
# file.rename("sample.csv", "renamed.csv")
# list.files(pattern = "*.csv")
# file.info("sample.csv")
# readLines("sample.csv", n = 3)
# writeLines("hello", "test.txt")

# ---- 5. READ CSV INTO DATAFRAME & WRITE TO NEW FILE ----

# Read original
df_original <- read.csv("sample.csv")

# Manipulate
df_original$Score_Adjusted <- df_original$Score + 5
df_original$Result <- ifelse(df_original$Score >= 80, "Pass", "Fail")

# Write to new file
write.csv(df_original, "updated_data.csv", row.names = FALSE)

# ---- 6. DATA MANIPULATION ----

# mtcars dataset
data(mtcars)
df_mt <- mtcars

# Basic exploration
dim(mtcars)
names(mtcars)
head(mtcars, 10)
tail(mtcars)

# Filter
subset(mtcars, mpg > 20)
subset(mtcars, cyl == 6 & gear == 4)

# Sort
mtcars[order(mtcars$mpg), ]
mtcars[order(mtcars$mpg, decreasing = TRUE), ]

# Add columns
mtcars$mpg_gt_20 <- mtcars$mpg > 20

# Aggregate
aggregate(mpg ~ cyl, data = mtcars, FUN = mean)
aggregate(. ~ cyl, data = mtcars, FUN = mean)

# Apply family
lapply(mtcars, mean)
sapply(mtcars, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)

# Transform
mtcars <- within(mtcars, {
  mpg_rank <- rank(-mpg)
})

# Merge (using iris)
df1 <- iris[1:5, 1:3]
df2 <- iris[1:5, c(1, 5)]
merged <- merge(df1, df2, by = "Sepal.Length")

# ---- 7. SUM OF EVEN / PRODUCT OF ODD ----

numbers <- 1:20

# Method 1
evens <- numbers[numbers %% 2 == 0]
odds  <- numbers[numbers %% 2 != 0]
sum_even <- sum(evens)
prod_odd <- prod(odds)
cat("Sum of evens:", sum_even, "\n")
cat("Product of odds:", prod_odd, "\n")

# Method 2 (loop)
sum_e <- 0
prod_o <- 1
for (n in numbers) {
  if (n %% 2 == 0) {
    sum_e <- sum_e + n
  } else {
    prod_o <- prod_o * n
  }
}

# ---- 8. FUNCTIONS IN R ----

# --- Sum of Squares ---
sum_of_squares <- function(x) {
  sum(x^2)
}
sum_of_squares(1:5)

# --- Prime Number Function ---
is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}
is_prime(7); is_prime(10)

# --- Calculator Function ---
calculator <- function(a, b, op = "+") {
  switch(op,
    "+" = a + b,
    "-" = a - b,
    "*" = a * b,
    "/" = if (b != 0) a / b else NA,
    stop("Invalid operator")
  )
}
calculator(10, 5, "+")
calculator(10, 5, "*")

# --- Custom Sum Function ---
custom_sum_function <- function(..., na.rm = FALSE) {
  vals <- c(...)
  if (na.rm) vals <- vals[!is.na(vals)]
  sum(vals)
}
custom_sum_function(1, 2, 3, NA, 5, na.rm = TRUE)

# --- Mandatory & Optional Arguments ---
describe_person <- function(name, age, city = "Unknown", married = FALSE) {
  cat(name, "is", age, "years old from", city)
  if (married) cat(" and is married")
  cat("\n")
}
describe_person("Alice", 30)
describe_person("Bob", 25, "NYC", TRUE)

# ---- 9. DEBUGGING & COIN TOSS SIMULATION ----

# --- Debugging ---
# traceback()        # after error
# debug(function_name)
# undebug(function_name)
# browser()          # insert breakpoint
# options(error = recover)  # enter debug on error

debugged_fn <- function(x) {
  browser()  # pauses here for debugging
  result <- x + 10
  return(result)
}
# debugged_fn(5)   # uncomment to step through

# --- Coin Toss Simulation ---
coin_toss <- function(n = 10) {
  results <- sample(c("Heads", "Tails"), n, replace = TRUE)
  heads <- sum(results == "Heads")
  tails <- sum(results == "Tails")
  cat("Tosses:", n, "\nHeads:", heads, "\nTails:", tails,
      "\nProportion Heads:", heads / n, "\n")
  return(results)
}
coin_toss(100)

# Multiple simulations
multi_toss <- function(reps = 1000, tosses = 10) {
  props <- replicate(reps, mean(sample(c(0,1), tosses, replace = TRUE)))
  hist(props, main = paste(reps, "simulations of", tosses, "tosses"),
       col = "lightblue", xlab = "Proportion of Heads")
  abline(v = 0.5, col = "red", lwd = 2)
  cat("Mean proportion:", mean(props), "\n")
}
multi_toss(5000, 20)

# ---- EXTRA: plot example ----
plot(mtcars$wt, mtcars$mpg,
     main = "MPG vs Weight",
     xlab = "Weight", ylab = "MPG",
     col = "blue", pch = 19)
abline(lm(mpg ~ wt, data = mtcars), col = "red")
