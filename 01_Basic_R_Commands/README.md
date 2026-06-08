# Experiment 1: Basic R Commands

## Aim
To learn and implement basic R commands including arithmetic operators, relational operators, logical operators, assignment methods, data type checks, type conversions, sequences, and commonly used built-in functions.

## Algorithm

```
Step 1: Start R environment
Step 2: Demonstrate arithmetic operators (+, -, *, /, ^, %%, %/%)
Step 3: Demonstrate relational operators (>, <, ==, !=, >=, <=)
Step 4: Demonstrate logical operators (&, |, !)
Step 5: Show various assignment methods (<-, =, ->, assign())
Step 6: Check data types using is.numeric(), is.character(), etc.
Step 7: Perform type conversions using as.numeric(), as.character(), etc.
Step 8: Generate sequences using : operator, seq(), rep()
Step 9: Use common built-in functions (length, sum, mean, median, etc.)
Step 10: Print working directory
Step 11: End
```

## Code

[code.R](code.R)

```r
# --- 1. Arithmetic Operators ---
cat("2 + 3 =", 2 + 3, "\n")
cat("10 - 4 =", 10 - 4, "\n")
cat("5 * 6 =", 5 * 6, "\n")
cat("20 / 4 =", 20 / 4, "\n")
cat("3^2 =", 3^2, "\n")
cat("10 %% 3 =", 10 %% 3, "(modulus)\n")
cat("10 %/% 3 =", 10 %/% 3, "(integer division)\n")

# --- 2. Relational Operators ---
cat("5 > 3 :", 5 > 3, "\n")
cat("5 < 3 :", 5 < 3, "\n")
cat("5 == 5 :", 5 == 5, "\n")
cat("5 != 4 :", 5 != 4, "\n")
cat("5 >= 4 :", 5 >= 4, "\n")
cat("5 <= 4 :", 5 <= 4, "\n")

# --- 3. Logical Operators ---
cat("TRUE & FALSE :", TRUE & FALSE, "\n")
cat("TRUE | FALSE :", TRUE | FALSE, "\n")
cat("!TRUE :", !TRUE, "\n")

# --- 4. Assignment Operators ---
x <- 10; y = 20; 30 -> z
assign("a", 100)

# --- 5. Data Type Checks ---
is.numeric(10); is.character("hello"); is.logical(TRUE)

# --- 6. Type Conversion ---
as.character(100); as.numeric("50"); as.integer(10.7)

# --- 7. Sequences ---
1:10; seq(1, 10, by = 2); rep(3, 5)
rep(c("A","B"), each = 3)

# --- 8. Common Functions ---
v <- c(10, 20, 30, 40, 50)
length(v); sum(v); mean(v); median(v); min(v); max(v); sd(v); var(v)

# --- 9. Working Directory ---
getwd()
```

## Output

```
=== ARITHMETIC OPERATORS ===
2 + 3 = 5
10 - 4 = 6
5 * 6 = 30
20 / 4 = 5
3^2 = 9
10 %% 3 = 1 (modulus)
10 %/% 3 = 3 (integer division)

=== RELATIONAL OPERATORS ===
5 > 3 : TRUE
5 < 3 : FALSE
5 == 5 : TRUE
5 != 4 : TRUE
5 >= 4 : TRUE
5 <= 4 : FALSE

=== LOGICAL OPERATORS ===
TRUE & FALSE : FALSE
TRUE | FALSE : TRUE
!TRUE : FALSE

=== ASSIGNMENT OPERATORS ===
x <- 10 : 10
y = 20 : 20
30 -> z : 30
assign("a", 100) : 100

=== DATA TYPE CHECKS ===
is.numeric(10) : TRUE
is.character('hello') : TRUE
is.logical(TRUE) : TRUE

=== SEQUENCES ===
1:10 : 1 2 3 4 5 6 7 8 9 10
seq(1, 10, by = 2) : 1 3 5 7 9
rep(3, 5) : 3 3 3 3 3

=== COMMON FUNCTIONS ===
Vector v : 10 20 30 40 50
length(v) : 5
sum(v) : 150
mean(v) : 30
```

## Result

All basic R commands were successfully executed. The program demonstrated arithmetic, relational, and logical operators, various assignment techniques, data type checking, type conversion, sequence generation, and common built-in functions. This forms the foundation for all further R programming.
