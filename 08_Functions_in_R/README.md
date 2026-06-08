# Experiment 8: Functions in R

## Aim
To understand and implement various types of functions in R including: sum of squares, prime number checker, calculator function, custom sum function with `...` (ellipsis) argument, and functions with mandatory and optional parameters.

## Algorithm

```
Step 1: Define sum_of_squares(x) - returns sum(x^2)
Step 2: Define is_prime(n) - test primality using loop up to sqrt(n)
Step 3: Define find_primes(start, end) - find all primes in range
Step 4: Define calculator(a, b, operation) - use switch() for operations
Step 5: Define custom_sum_function(..., na.rm) - accept variable args via ...
Step 6: Define employee_info() with mandatory (emp_id, name) and optional args (dept, salary, bonus)
Step 7: Define rectangle() with mandatory (length, width) and optional (color, border, lwd)
Step 8: Define stats_summary() with optional flags (na.rm, detailed)
Step 9: Call all functions with various argument combinations
Step 10: End
```

## Code

[code.R](code.R)

```r
# 1. SUM OF SQUARES
sum_of_squares <- function(x) { sum(x^2) }

# 2. PRIME NUMBER
is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  for (i in 2:sqrt(n)) if (n %% i == 0) return(FALSE)
  TRUE
}

# 3. CALCULATOR
calculator <- function(a, b, op = "+") {
  switch(op, "+" = a+b, "-" = a-b, "*" = a*b,
         "/" = if(b!=0) a/b else NA, "^" = a^b)
}

# 4. CUSTOM SUM
custom_sum_function <- function(..., na.rm = FALSE) {
  vals <- c(...)
  if (na.rm) vals <- vals[!is.na(vals)]
  sum(vals)
}

# 5. MANDATORY & OPTIONAL
employee_info <- function(emp_id, name, department = "General",
                          salary = 30000, bonus = 0) {
  cat("ID:", emp_id, "| Name:", name, "| Dept:", department,
      "| Total: $", salary + bonus, "\n")
}

# Named args in any order
employee_info(name = "Alice", emp_id = 101, bonus = 5000)
```

## Output

```
===== FUNCTIONS IN R =====

1. SUM OF SQUARES FUNCTION
sum_of_squares(1:5): 55
sum_of_squares(c(2,4,6)): 56
sum_of_squares(c(10,20)): 500

2. PRIME NUMBER FUNCTION
1 -> Not Prime
2 -> Prime
3 -> Prime
4 -> Not Prime
5 -> Prime
7 -> Prime
10 -> Not Prime
11 -> Prime
13 -> Prime
17 -> Prime
20 -> Not Prime
23 -> Prime

Primes between 1 and 50:
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47

3. CALCULATOR FUNCTION
10 + 5 = 15
10 - 5 = 5
10 * 5 = 50
10 / 5 = 2
10 ^ 5 = 1e+05
10 %% 3 = 1

4. CUSTOM_SUM_FUNCTION()
custom_sum_function(1,2,3,4,5): 15
custom_sum_function(1,2,NA,4,5, na.rm=TRUE): 12

5. MANDATORY & OPTIONAL ARGUMENTS
--- Employee Info ---
ID: 101 | Name: Alice | Dept: General | Total: $30000
ID: 102 | Name: Bob | Dept: IT | Total: $50000
ID: 103 | Name: Charlie | Dept: Finance | Total: $65000
```

## Result

All five function types were successfully implemented and tested:
1. **Sum of squares** - simple single-expression function
2. **Prime function** - loop-based conditional logic with early returns
3. **Calculator** - dispatch using switch() with default operator
4. **custom_sum_function** - ellipsis (...) for variable arguments, na.rm option
5. **Functions with mandatory & optional args** - positional defaults, named argument calling in any order, multiple optional parameters with sensible defaults
