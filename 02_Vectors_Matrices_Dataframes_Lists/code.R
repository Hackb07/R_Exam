# ============================================================
# Experiment 2: Vectors, Matrices, Dataframes, and Lists
# ============================================================

# ==================== VECTORS ====================

cat("===== VECTORS =====\n")

# Creating vectors
v_num <- c(1, 2, 5, 7, 9)
v_char <- c("apple", "banana", "cherry")
v_log <- c(TRUE, FALSE, TRUE)
v_seq <- 1:10
v_seq2 <- seq(2, 20, by = 2)

cat("Numeric vector:", v_num, "\n")
cat("Character vector:", v_char, "\n")
cat("Logical vector:", v_log, "\n")
cat("Sequence vector 1:10:", v_seq, "\n")
cat("Sequence vector seq(2,20,2):", v_seq2, "\n")

# Named vector
v_named <- c(a = 10, b = 20, c = 30)
cat("Named vector:\n")
print(v_named)

# Vector operations
cat("\nVector operations:\n")
v1 <- c(1, 3, 5, 7, 9)
cat("v1:", v1, "\n")
cat("v1 + 10:", v1 + 10, "\n")
cat("v1 * 2:", v1 * 2, "\n")
cat("sqrt(v1):", sqrt(v1), "\n")
cat("sum(v1):", sum(v1), "\n")
cat("mean(v1):", mean(v1), "\n")
cat("length(v1):", length(v1), "\n")

# Vector indexing
cat("\nVector indexing:\n")
cat("v1[2]:", v1[2], "\n")
cat("v1[c(1,3)]:", v1[c(1,3)], "\n")
cat("v1[2:4]:", v1[2:4], "\n")
cat("v1[v1 > 5]:", v1[v1 > 5], "\n")

# ==================== MATRICES ====================

cat("\n===== MATRICES =====\n")

# Creating matrices
m1 <- matrix(1:12, nrow = 3, ncol = 4)
cat("matrix(1:12, nrow=3, ncol=4) - column-wise:\n")
print(m1)

m2 <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
cat("matrix(1:12, byrow=TRUE):\n")
print(m2)

# Named matrix
m3 <- matrix(1:6, nrow = 2,
             dimnames = list(c("Row1", "Row2"), c("Col1", "Col2", "Col3")))
cat("Named matrix:\n")
print(m3)

# Matrix operations
cat("\nMatrix operations:\n")
cat("t(m1) - transpose:\n")
print(t(m1))

cat("dim(m1):", dim(m1), "\n")
cat("nrow(m1):", nrow(m1), ", ncol(m1):", ncol(m1), "\n")
cat("rownames(m3):", rownames(m3), "\n")
cat("colnames(m3):", colnames(m3), "\n")

# Matrix indexing
cat("\nMatrix indexing:\n")
cat("m1[2,3]:", m1[2,3], "\n")
cat("m1[1,] (first row):", m1[1,], "\n")
cat("m1[,2] (second col):", m1[,2], "\n")
cat("m1[1:2, 3:4] (sub-matrix):\n")
print(m1[1:2, 3:4])

# Row/Column binding
cat("\nrbind and cbind:\n")
print(rbind(c(1,2), c(3,4)))
print(cbind(c(1,2), c(3,4)))

# Matrix multiplication
A <- matrix(c(1,2,3,4), nrow = 2)
B <- matrix(c(5,6,7,8), nrow = 2)
cat("Matrix multiplication:\n")
print(A %*% B)

# ==================== DATAFRAMES ====================

cat("\n===== DATAFRAMES =====\n")

# Creating a dataframe
df <- data.frame(
  Name  = c("Alice", "Bob", "Charlie", "Diana"),
  Age   = c(25, 30, 35, 28),
  Score = c(88, 92, 85, 90),
  Pass  = c(TRUE, TRUE, FALSE, TRUE)
)
cat("Original dataframe:\n")
print(df)

# Structure and summary
cat("\nstr(df):\n")
str(df)
cat("\nsummary(df):\n")
summary(df)

# Dimensions
cat("\ndim(df):", dim(df), "\n")
cat("nrow(df):", nrow(df), ", ncol(df):", ncol(df), "\n")
cat("names(df):", names(df), "\n")

# Accessing data
cat("\nAccessing dataframe:\n")
cat("df$Name:", df$Name, "\n")
cat("df[, 'Age']:", df[, "Age"], "\n")
cat("df[1,]:\n")
print(df[1, ])
cat("df[1:2, c('Name','Score')]:\n")
print(df[1:2, c("Name", "Score")])

# Adding columns
cat("\nAdding columns:\n")
df$Grade <- c("B", "A", "B", "A")
df$City  <- c("NYC", "LA", "Chicago", "SF")
print(df)

# Subsetting
cat("\nSubsetting:\n")
cat("subset(df, Age > 28):\n")
print(subset(df, Age > 28))
cat("df[df$Pass == TRUE, ]:\n")
print(df[df$Pass == TRUE, ])

# ==================== LISTS ====================

cat("\n===== LISTS =====\n")

# Creating a list
lst <- list(
  numbers = c(10, 20, 30),
  mat     = matrix(1:4, nrow = 2),
  data    = df,
  text    = "Hello from list",
  logical = c(TRUE, FALSE)
)
cat("List structure:\n")
str(lst)

# Accessing list elements
cat("\nAccessing list elements:\n")
cat("lst[[1]]:", lst[[1]], "\n")
cat("lst$numbers:", lst$numbers, "\n")
cat("lst[['text']]:", lst[['text']], "\n")
cat("lst$mat:\n")
print(lst$mat)
cat("lst$data (first 2 rows):\n")
print(head(lst$data, 2))

# Subsetting lists
cat("\nSubsetting lists:\n")
cat("lst[c('numbers','text')]:\n")
print(lst[c("numbers", "text")])

# Adding to list
lst$new_item <- 100
cat("\nAfter adding new_item:\n")
print(names(lst))
