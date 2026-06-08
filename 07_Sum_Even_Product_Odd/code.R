# ============================================================
# Experiment 7: Sum of Even Numbers & Product of Odd Numbers
# ============================================================

cat("===== SUM OF EVEN & PRODUCT OF ODD NUMBERS =====\n\n")

# ==================== METHOD 1: VECTORIZED ====================

cat("METHOD 1: Vectorized approach\n\n")

numbers <- 1:20
cat("Numbers:", numbers, "\n\n")

# Find even numbers
evens <- numbers[numbers %% 2 == 0]
cat("Even numbers:", evens, "\n")
sum_even <- sum(evens)
cat("Sum of even numbers:", sum_even, "\n\n")

# Find odd numbers
odds <- numbers[numbers %% 2 != 0]
cat("Odd numbers:", odds, "\n")
prod_odd <- prod(odds)
cat("Product of odd numbers:", prod_odd, "\n")

# ==================== METHOD 2: LOOP ====================

cat("\n----------------------------------------\n")
cat("METHOD 2: Loop-based approach\n\n")

sum_e <- 0
prod_o <- 1

for (n in numbers) {
  if (n %% 2 == 0) {
    sum_e <- sum_e + n
  } else {
    prod_o <- prod_o * n
  }
}
cat("Sum of evens (loop):", sum_e, "\n")
cat("Product of odds (loop):", prod_o, "\n")

# ==================== METHOD 3: FUNCTION ====================

cat("\n----------------------------------------\n")
cat("METHOD 3: Reusable function\n\n")

even_odd_calc <- function(vec) {
  evens <- vec[vec %% 2 == 0]
  odds  <- vec[vec %% 2 != 0]

  result <- list(
    numbers         = vec,
    even_numbers    = evens,
    odd_numbers     = odds,
    sum_of_evens    = sum(evens),
    product_of_odds = prod(odds)
  )

  return(result)
}

# Test with different ranges
res1 <- even_odd_calc(1:10)
cat("Range 1:10\n")
cat("  Sum of evens:", res1$sum_of_evens, "\n")
cat("  Product of odds:", res1$product_of_odds, "\n\n")

res2 <- even_odd_calc(c(2, 5, 8, 11, 14, 17, 20))
cat("Custom vector (2,5,8,11,14,17,20):\n")
cat("  Even numbers:", res2$even_numbers, "\n")
cat("  Odd numbers:", res2$odd_numbers, "\n")
cat("  Sum of evens:", res2$sum_of_evens, "\n")
cat("  Product of odds:", res2$product_of_odds, "\n")

# ==================== METHOD 4: USER INPUT ====================

cat("\n----------------------------------------\n")
cat("METHOD 4: Function with user range\n\n")

even_odd_range <- function(start, end) {
  vec <- start:end
  evens <- vec[vec %% 2 == 0]
  odds  <- vec[vec %% 2 != 0]

  cat("Range:", start, "to", end, "\n")
  cat("Sum of even numbers:", sum(evens), "\n")
  cat("Product of odd numbers:", prod(odds), "\n")

  return(invisible(list(sum_evens = sum(evens), prod_odds = prod(odds))))
}

even_odd_range(1, 15)
cat("\n")
even_odd_range(10, 30)

# ==================== VERIFICATION ====================

cat("\n----------------------------------------\n")
cat("VERIFICATION\n\n")

# For 1:20 manually:
# Evens: 2+4+6+8+10+12+14+16+18+20 = 110
# Odds: 1*3*5*7*9*11*13*15*17*19 = 654729075
cat("Expected sum of evens (1:20): 110\n")
cat("Expected product of odds (1:20): 654729075\n")
cat("Matches:", sum_even == 110 && prod_odd == 654729075, "\n\n")

# ==================== ADDITIONAL: USING WHILE LOOP ====================

cat("METHOD 5: While loop\n\n")

sum_while <- 0
prod_while <- 1
i <- 1
while (i <= 20) {
  if (i %% 2 == 0) {
    sum_while <- sum_while + i
  } else {
    prod_while <- prod_while * i
  }
  i <- i + 1
}
cat("Sum of evens (while):", sum_while, "\n")
cat("Product of odds (while):", prod_while, "\n")
