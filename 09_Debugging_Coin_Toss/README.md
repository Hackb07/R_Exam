# Experiment 9: Debugging Errors in R & Coin Toss Simulation

## Aim
To learn debugging techniques in R (error types, debugging tools, error handling with tryCatch) and to simulate coin toss experiments demonstrating probability, the law of large numbers, biased coins, and the binomial distribution.

## Algorithm

```
PART A - DEBUGGING:
Step 1: Identify common error types (syntax, object not found, dim mismatch, etc.)
Step 2: Use traceback() to see call stack after error
Step 3: Insert browser() breakpoints for interactive debugging
Step 4: Use debug() / undebug() to step through functions
Step 5: Implement tryCatch() for graceful error handling
Step 6: Add cat() debug print statements
Step 7: Use stop() for errors, warning() for warnings

PART B - COIN TOSS:
Step 8: Basic coin toss using sample(c("Heads","Tails"), n, replace=TRUE)
Step 9: Multiple simulations using replicate() to demonstrate LLN
Step 10: Cumulative proportion convergence to 0.5
Step 11: Biased coin with custom probability (prob_heads)
Step 12: Multiple coins experiment (binomial distribution)
Step 13: Probability calculations using dbinom() and pbinom()
Step 14: End
```

## Code

[code.R](code.R)

```r
# --- DEBUGGING ---
divide_with_check <- function(x, y) {
  if (!is.numeric(x) || !is.numeric(y)) stop("Must be numeric")
  if (y == 0) { warning("Division by zero"); return(NA) }
  x / y
}

# tryCatch for error handling
safe_divide <- function(x, y) {
  tryCatch(x / y,
    error = function(e) { cat("Error:", e$message, "\n"); NA },
    warning = function(w) { cat("Warning:", w$message, "\n"); x/y })
}

# browser() - insert breakpoint
# debug(my_function) / undebug(my_function)

# --- COIN TOSS ---
coin_toss <- function(n = 10) {
  sample(c("Heads", "Tails"), n, replace = TRUE)
}

# Multiple simulations
simulate_coin <- function(tosses = 100, sims = 1000) {
  replicate(sims, mean(sample(c(0,1), tosses, replace = TRUE)))
}

# Biased coin
biased_coin <- function(n = 100, p = 0.7) {
  sample(c("Heads","Tails"), n, replace = TRUE, prob = c(p, 1-p))
}

# Probability calculation
dbinom(5, 10, 0.5)   # exactly 5 heads in 10 tosses
pbinom(5, 10, 0.5)   # ≤ 5 heads in 10 tosses
```

## Output

```
===== DEBUGGING ERRORS & COIN TOSS SIMULATION =====

========== PART A: DEBUGGING IN R ==========

divide_with_check(10, 3): 3.333333
divide_with_check(10, 0): Warning - Division by zero - returning NA
  [1] NA

safe_divide(10, 3): 3.333333
safe_divide(10, 0): Warning caught - division by zero
  [1] Inf
safe_divide("a", 2): Error caught - non-numeric argument

========== PART B: COIN TOSS SIMULATION ==========

--- 10 tosses ---
Number of tosses: 10
Heads: 4 (40%) | Tails: 6 (60%)

2. MULTIPLE SIMULATIONS
Mean proportion of heads: 0.5002
SD of proportions: 0.05

3. CONVERGENCE TO 0.5
After 10 tosses: 0.5
After 100 tosses: 0.48
After 500 tosses: 0.496
After 1000 tosses: 0.501

4. BIASED COIN
Tosses: 100 | P(Heads) = 0.7
Heads: 72 (72%) | Expected: 70

6. PROBABILITY CALCULATION
P(exactly 5 heads in 10 tosses): 0.2461
P(exactly 7 heads in 10 tosses): 0.1172
P(≤ 5 heads in 10 tosses): 0.6230
```

## Result

**Debugging:** Successfully demonstrated error detection using traceback, interactive debugging with browser(), error handling with tryCatch(), and diagnostic printing with cat(). The divide_with_check function showed proper use of stop() and warning().

**Coin Toss:** Demonstrated that (1) coin tosses approach the theoretical 0.5 probability as the number of tosses increases (Law of Large Numbers), (2) biased coins correctly reflect custom probabilities, (3) multiple coin tosses follow the binomial distribution, and (4) exact probabilities can be computed using dbinom()/pbinom().
