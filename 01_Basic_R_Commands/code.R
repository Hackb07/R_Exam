# ============================================================
# Experiment 1: Basic R Commands
# ============================================================

# --- 1. Arithmetic Operators ---
cat("=== ARITHMETIC OPERATORS ===\n")
cat("2 + 3 =", 2 + 3, "\n")
cat("10 - 4 =", 10 - 4, "\n")
cat("5 * 6 =", 5 * 6, "\n")
cat("20 / 4 =", 20 / 4, "\n")
cat("3^2 =", 3^2, "\n")
cat("10 %% 3 =", 10 %% 3, "(modulus)\n")
cat("10 %/% 3 =", 10 %/% 3, "(integer division)\n")

# --- 2. Relational Operators ---
cat("\n=== RELATIONAL OPERATORS ===\n")
cat("5 > 3 :", 5 > 3, "\n")
cat("5 < 3 :", 5 < 3, "\n")
cat("5 == 5 :", 5 == 5, "\n")
cat("5 != 4 :", 5 != 4, "\n")
cat("5 >= 4 :", 5 >= 4, "\n")
cat("5 <= 4 :", 5 <= 4, "\n")

# --- 3. Logical Operators ---
cat("\n=== LOGICAL OPERATORS ===\n")
cat("TRUE & FALSE :", TRUE & FALSE, "\n")
cat("TRUE | FALSE :", TRUE | FALSE, "\n")
cat("!TRUE :", !TRUE, "\n")

# --- 4. Assignment Operators ---
cat("\n=== ASSIGNMENT OPERATORS ===\n")
x <- 10         # <- assignment
y = 20          # = assignment
30 -> z         # -> rightward assignment
assign("a", 100) # assign() function
cat("x <- 10 :", x, "\n")
cat("y = 20 :", y, "\n")
cat("30 -> z :", z, "\n")
cat('assign("a", 100) :', a, "\n")

# --- 5. Data Type Checks ---
cat("\n=== DATA TYPE CHECKS ===\n")
cat("is.numeric(10) :", is.numeric(10), "\n")
cat("is.character('hello') :", is.character("hello"), "\n")
cat("is.logical(TRUE) :", is.logical(TRUE), "\n")
cat("is.vector(c(1,2,3)) :", is.vector(c(1,2,3)), "\n")
cat("is.na(NA) :", is.na(NA), "\n")
cat("is.null(NULL) :", is.null(NULL), "\n")

# --- 6. Type Conversion ---
cat("\n=== TYPE CONVERSION ===\n")
cat('as.character(100) :', as.character(100), "\n")
cat('as.numeric("50") :', as.numeric("50"), "\n")
cat('as.factor(c("A","B","C")) :', as.factor(c("A","B","C")), "\n")
cat('as.integer(10.7) :', as.integer(10.7), "\n")

# --- 7. Sequences ---
cat("\n=== SEQUENCES ===\n")
cat("1:10 :", 1:10, "\n")
cat('seq(1, 10, by = 2) :', seq(1, 10, by = 2), "\n")
cat('rep(3, 5) :', rep(3, 5), "\n")
cat('rep(c("A","B"), each = 3) :', rep(c("A","B"), each = 3), "\n")
cat('seq_len(5) :', seq_len(5), "\n")
cat('seq_along(c(10,20,30)) :', seq_along(c(10,20,30)), "\n")

# --- 8. Commonly Used Functions ---
cat("\n=== COMMON FUNCTIONS ===\n")
v <- c(10, 20, 30, 40, 50)
cat("Vector v :", v, "\n")
cat("length(v) :", length(v), "\n")
cat("sum(v)    :", sum(v), "\n")
cat("mean(v)   :", mean(v), "\n")
cat("median(v) :", median(v), "\n")
cat("min(v)    :", min(v), "\n")
cat("max(v)    :", max(v), "\n")
cat("sd(v)     :", sd(v), "\n")
cat("var(v)    :", var(v), "\n")
cat("range(v)  :", range(v), "\n")
cat("summary(v):\n")
print(summary(v))

# --- 9. Working Directory ---
cat("\n=== WORKING DIRECTORY ===\n")
cat("Current working directory:", getwd(), "\n")
