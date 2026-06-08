# ============================================================
# Experiment 8: Functions in R
# ============================================================

cat("===== FUNCTIONS IN R =====\n\n")

# ==================== 1. SUM OF SQUARES ====================

cat("1. SUM OF SQUARES FUNCTION\n\n")

sum_of_squares <- function(x) {
  # Computes sum of squares of elements
  sum(x^2)
}

cat("sum_of_squares(1:5):", sum_of_squares(1:5), "\n")
cat("sum_of_squares(c(2, 4, 6)):", sum_of_squares(c(2, 4, 6)), "\n")
cat("sum_of_squares(c(10, 20)):", sum_of_squares(c(10, 20)), "\n\n")

# Alternative with explicit loop
sum_of_squares_loop <- function(x) {
  total <- 0
  for (val in x) {
    total <- total + val^2
  }
  total
}
cat("sum_of_squares_loop(1:5):", sum_of_squares_loop(1:5), "\n")

# ==================== 2. PRIME NUMBER FUNCTION ====================

cat("\n2. PRIME NUMBER FUNCTION\n\n")

is_prime <- function(n) {
  if (!is.numeric(n) || length(n) != 1 || n != floor(n)) {
    stop("Input must be a single integer")
  }
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  if (n %% 2 == 0) return(FALSE)

  for (i in 3:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

# Test
test_numbers <- c(1, 2, 3, 4, 5, 7, 10, 11, 13, 17, 20, 23, 29, 30)
for (num in test_numbers) {
  cat(num, "->", if (is_prime(num)) "Prime" else "Not Prime", "\n")
}

# Extended: Find primes in a range
find_primes <- function(start, end) {
  nums <- start:end
  nums[sapply(nums, is_prime)]
}
cat("\nPrimes between 1 and 50:\n")
cat(find_primes(1, 50), "\n")

# ==================== 3. CALCULATOR FUNCTION ====================

cat("\n3. CALCULATOR FUNCTION\n\n")

calculator <- function(a, b, operation = "+") {
  result <- switch(operation,
    "+" = a + b,
    "-" = a - b,
    "*" = a * b,
    "/" = if (b != 0) a / b else NA,
    "^" = a^b,
    "%%" = a %% b,
    stop("Invalid operation. Use: +, -, *, /, ^, %%")
  )

  cat(a, operation, b, "=", result, "\n")
  return(invisible(result))
}

calculator(10, 5, "+")
calculator(10, 5, "-")
calculator(10, 5, "*")
calculator(10, 5, "/")
calculator(10, 5, "^")
calculator(10, 3, "%%")

# ==================== 4. CUSTOM_SUM_FUNCTION() ====================

cat("\n4. CUSTOM_SUM_FUNCTION()\n\n")

custom_sum_function <- function(..., na.rm = FALSE) {
  values <- c(...)

  if (na.rm) {
    values <- values[!is.na(values)]
  }

  total <- 0
  for (v in values) {
    total <- total + v
  }
  cat("Sum:", total, "(na.rm =", na.rm, ")\n")
  return(total)
}

custom_sum_function(1, 2, 3, 4, 5)
custom_sum_function(10, 20, 30)
custom_sum_function(1, 2, NA, 4, 5, na.rm = FALSE)
custom_sum_function(1, 2, NA, 4, 5, na.rm = TRUE)
custom_sum_function(1:10)

# ==================== 5. MANDATORY & OPTIONAL ARGUMENTS ====================

cat("\n5. MANDATORY & OPTIONAL ARGUMENTS\n\n")

# --- Example 1: Employee details ---
employee_info <- function(emp_id, name, department = "General",
                          salary = 30000, bonus = 0) {
  total_comp <- salary + bonus
  cat("--- Employee Info ---\n")
  cat("ID:", emp_id, "\n")
  cat("Name:", name, "\n")
  cat("Department:", department, "\n")
  cat("Salary: $", salary, "\n", sep = "")
  cat("Bonus: $", bonus, "\n", sep = "")
  cat("Total Compensation: $", total_comp, "\n\n", sep = "")
}

# Mandatory only
employee_info(101, "Alice")

# Mandatory + some optional
employee_info(102, "Bob", "IT", 50000)

# All arguments
employee_info(103, "Charlie", "Finance", 60000, 5000)

# Using named arguments (any order)
employee_info(name = "Diana", emp_id = 104, bonus = 3000,
              department = "HR", salary = 45000)

# --- Example 2: Rectangle analysis ---
rectangle <- function(length, width, color = "blue",
                      border = "black", lwd = 1) {
  area <- length * width
  perimeter <- 2 * (length + width)
  diagonal <- sqrt(length^2 + width^2)

  cat("Rectangle (", length, "x", width, "):\n", sep = "")
  cat("  Area:", area, "\n")
  cat("  Perimeter:", perimeter, "\n")
  cat("  Diagonal:", round(diagonal, 2), "\n")
  cat("  Color:", color, ", Border:", border, ", lwd:", lwd, "\n\n")
}

rectangle(5, 3)
rectangle(10, 4, color = "red")
rectangle(7, 7, color = "green", border = "gold", lwd = 2)

# --- Example 3: Statistical summary with defaults ---
stats_summary <- function(x, na.rm = FALSE, digits = 2, detailed = FALSE) {
  if (na.rm) x <- x[!is.na(x)]

  result <- list(
    n      = length(x),
    min    = min(x),
    max    = max(x),
    mean   = round(mean(x), digits),
    median = round(median(x), digits),
    sd     = round(sd(x), digits)
  )

  if (detailed) {
    result$q25 <- round(quantile(x, 0.25), digits)
    result$q75 <- round(quantile(x, 0.75), digits)
    result$sum <- sum(x)
  }

  return(result)
}

cat("Basic stats:\n")
print(stats_summary(mtcars$mpg))

cat("\nDetailed stats:\n")
print(stats_summary(mtcars$mpg, detailed = TRUE))
