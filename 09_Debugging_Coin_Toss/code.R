# ============================================================
# Experiment 9: Debugging Errors in R & Coin Toss Simulation
# ============================================================

cat("===== DEBUGGING ERRORS & COIN TOSS SIMULATION =====\n\n")

# ==================== PART A: DEBUGGING ====================

cat("========== PART A: DEBUGGING IN R ==========\n\n")

# --- 1. Common Error Types ---

cat("1. COMMON ERROR TYPES\n\n")

# Syntax error (missing closing parenthesis)
# This would error:
# result <- sum(1, 2, 3

# Object not found error
# print(undefined_variable)

# Dimension mismatch
# matrix(1:4, nrow=2) + matrix(1:9, nrow=3)

# Non-numeric argument
# sum("hello", "world")

# Subscript out of bounds
# letters[30]

# --- 2. Debugging Tools ---

cat("2. DEBUGGING TOOLS\n\n")

# traceback() - shows call stack after error
cat("traceback() - shows call stack after an error occurs\n")

# browser() - inserts breakpoint
cat("browser() - pauses execution for interactive debugging\n")

# debug() / undebug() - flag function for debugging
cat("debug(fn) / undebug(fn) - step through function execution\n")

# options(error = recover) - enter debugger on any error
cat("options(error = recover) - interactive debug on error\n")

# --- 3. DEMO: Debugging with browser() ---

cat("\n3. DEBUGGING DEMONSTRATION\n\n")

# Function with potential issues
divide_with_check <- function(x, y) {
  if (!is.numeric(x) || !is.numeric(y)) {
    stop("Both arguments must be numeric")
  }
  if (y == 0) {
    warning("Division by zero - returning NA")
    return(NA)
  }
  result <- x / y
  return(result)
}

# Test the function
cat("divide_with_check(10, 3):", divide_with_check(10, 3), "\n")
cat("divide_with_check(10, 0):", divide_with_check(10, 0), "\n")

# Try-Catch for error handling
cat("\n--- Error Handling with tryCatch ---\n")
safe_divide <- function(x, y) {
  tryCatch({
    x / y
  }, error = function(e) {
    cat("Error caught:", e$message, "\n")
    return(NA)
  }, warning = function(w) {
    cat("Warning caught:", w$message, "\n")
    return(x / y)
  })
}

cat("safe_divide(10, 3):", safe_divide(10, 3), "\n")
cat("safe_divide(10, 0):", safe_divide(10, 0), "\n")
cat('safe_divide("a", 2):', safe_divide("a", 2), "\n")

# --- 4. Debugging with cat() statements ---

cat("\n--- Debugging with cat() statements ---\n")

debug_sum_product <- function(vec) {
  cat("[DEBUG] Input vector:", vec, "\n")
  cat("[DEBUG] Length:", length(vec), "\n")

  evens <- vec[vec %% 2 == 0]
  odds  <- vec[vec %% 2 != 0]

  cat("[DEBUG] Even numbers:", evens, "\n")
  cat("[DEBUG] Odd numbers:", odds, "\n")

  result <- list(
    sum_evens = if (length(evens) > 0) sum(evens) else 0,
    prod_odds = if (length(odds) > 0) prod(odds) else 1
  )

  cat("[DEBUG] Returning sum_evens =", result$sum_evens,
      ", prod_odds =", result$prod_odds, "\n")
  return(result)
}

debug_sum_product(1:10)

# ==================== PART B: COIN TOSS SIMULATION ====================

cat("\n========== PART B: COIN TOSS SIMULATION ==========\n\n")

# --- 1. Basic Coin Toss ---

cat("1. BASIC COIN TOSS\n\n")

coin_toss <- function(n = 10) {
  results <- sample(c("Heads", "Tails"), n, replace = TRUE)
  heads <- sum(results == "Heads")
  tails <- sum(results == "Tails")

  cat("Number of tosses:", n, "\n")
  cat("Heads:", heads, "(", round(heads/n * 100, 1), "%)\n")
  cat("Tails:", tails, "(", round(tails/n * 100, 1), "%)\n")

  return(results)
}

cat("--- 10 tosses ---\n")
set.seed(123)  # for reproducibility
toss1 <- coin_toss(10)
cat("Results:", toss1, "\n\n")

cat("--- 50 tosses ---\n")
set.seed(123)
toss2 <- coin_toss(50)
cat("\n")

# --- 2. Multiple Simulations ---

cat("2. MULTIPLE SIMULATIONS (Law of Large Numbers)\n\n")

# Simulate multiple times and track proportion of heads
simulate_coin <- function(num_tosses = 100, num_simulations = 1000) {
  props <- replicate(num_simulations, {
    tosses <- sample(c(0, 1), num_tosses, replace = TRUE)
    mean(tosses)  # proportion of heads
  })

  cat("Simulations:", num_simulations, "\n")
  cat("Tosses per simulation:", num_tosses, "\n")
  cat("Mean proportion of heads:", mean(props), "\n")
  cat("SD of proportions:", sd(props), "\n")
  cat("95% range: [", round(mean(props) - 1.96*sd(props), 3), ",",
      round(mean(props) + 1.96*sd(props), 3), "]\n")

  return(props)
}

set.seed(42)
props <- simulate_coin(100, 1000)

# --- 3. Cumulative Proportion Plot ---

cat("\n3. CONVERGENCE TO 0.5 (Law of Large Numbers)\n\n")

convergence_demo <- function(max_tosses = 1000) {
  tosses <- sample(c("H", "T"), max_tosses, replace = TRUE)
  heads_cumsum <- cumsum(tosses == "H")
  proportions <- heads_cumsum / (1:max_tosses)

  cat("First 10 tosses:", tosses[1:10], "\n")
  cat("After", max_tosses, "tosses -> proportion of heads:",
      round(proportions[max_tosses], 4), "\n")
  cat("Theoretical probability: 0.5\n")

  # Show at various milestones
  milestones <- c(10, 50, 100, 200, 500, 1000)
  for (m in milestones) {
    if (m <= max_tosses) {
      cat("  After", m, "tosses:", round(proportions[m], 4), "\n")
    }
  }

  return(list(tosses = tosses, proportions = proportions))
}

set.seed(123)
conv <- convergence_demo(1000)

# --- 4. Biased Coin ---

cat("\n4. BIASED COIN TOSS\n\n")

biased_coin <- function(n = 100, prob_heads = 0.7) {
  results <- sample(c("Heads", "Tails"), n, replace = TRUE,
                    prob = c(prob_heads, 1 - prob_heads))
  heads <- sum(results == "Heads")

  cat("Tosses:", n, "| P(Heads) =", prob_heads, "\n")
  cat("Heads:", heads, "(", round(heads/n * 100, 1), "%)\n")
  cat("Expected:", n * prob_heads, "\n")
}

set.seed(123)
biased_coin(100, 0.7)
cat("\n")
biased_coin(100, 0.9)

# --- 5. Simulating Multiple Coins (Binomial Distribution) ---

cat("\n5. MULTIPLE COINS - BINOMIAL DISTRIBUTION\n\n")

multiple_coins <- function(num_coins = 10, tosses_each = 20) {
  results <- replicate(num_coins, {
    sum(sample(c(0, 1), tosses_each, replace = TRUE))
  })

  cat(num_coins, "coins tossed", tosses_each, "times each\n")
  cat("Number of heads per coin:\n")
  cat("  Min:", min(results), "| Max:", max(results),
      "| Mean:", round(mean(results), 2),
      "| SD:", round(sd(results), 2), "\n")

  return(results)
}

set.seed(123)
heads_counts <- multiple_coins(10, 20)
cat("  Results:", heads_counts, "\n")

# --- 6. Probability Calculation ---

cat("\n6. PROBABILITY CALCULATION\n\n")

# Exactly k heads in n tosses (fair coin)
prob_exact_heads <- function(n, k) {
  dbinom(k, size = n, prob = 0.5)
}

cat("Probability of exactly 5 heads in 10 tosses:",
    round(prob_exact_heads(10, 5), 4), "\n")
cat("Probability of exactly 7 heads in 10 tosses:",
    round(prob_exact_heads(10, 7), 4), "\n")
cat("Probability of 5 OR FEWER heads in 10 tosses:",
    round(pbinom(5, 10, 0.5), 4), "\n")
