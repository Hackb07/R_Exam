# Experiment 3: Factors and their Importance

## Aim
To understand R factors, how to create them (ordered and unordered), their properties, their importance in statistical modeling, memory efficiency, cross-tabulation, ordinal data handling, and plot ordering.

## Algorithm

```
Step 1: Create unordered factors using factor()
Step 2: Create ordered factors with specified level order
Step 3: Create factors with extra levels not present in data
Step 4: Bin numeric data into categorical using cut()
Step 5: Examine factor properties (levels, nlevels, table, summary)
Step 6: Demonstrate memory efficiency (character vs factor)
Step 7: Use factors in statistical modeling (ANOVA)
Step 8: Create cross-tabulation and proportion tables
Step 9: Show ordinal comparisons with ordered factors
Step 10: Control ordering in tables and plots
Step 11: Manipulate factors (rename, add, droplevels, convert)
Step 12: End
```

## Code

[code.R](code.R)

```r
# Unordered factor
f <- factor(c("low", "medium", "high", "low", "medium"))

# Ordered factor
f_ord <- factor(c("low", "medium", "high"),
                levels = c("low", "medium", "high"), ordered = TRUE)

# Bin numeric data
cut(scores, breaks = c(0, 60, 75, 90, 100),
    labels = c("Fail", "Pass", "Merit", "Distinction"))

# Properties
levels(f); nlevels(f); table(f); summary(f)

# In modeling
mtcars$cyl <- as.factor(mtcars$cyl)
lm(mpg ~ cyl, data = mtcars)

# Manipulation
levels(f) <- c("L", "M", "H")
droplevels(f)
as.numeric(f); as.character(f)
```

## Output

```
===== CREATING FACTORS =====
Unordered factor:
[1] low    medium high   low    medium
Levels: high low medium

Ordered factor:
[1] low    medium high
Levels: low < medium < high

Grade bins from numeric:
   Score      Grade
1     55       Fail
2     72       Pass
3     88     Merit
4     91 Distinction
5     63       Pass

===== IMPORTANCE OF FACTORS =====
1. Memory efficiency:
   Character vector: 80000 bytes
   Factor vector:    4192 bytes

2. Statistical modeling (ANOVA):
   lm(mpg ~ cyl) creates proper dummy coding

3. Cross-tabulation:
         Result
Gender    Fail Pass
  Female   15   35
  Male     10   40

4. Ordered factors:
   "Master" > "Bachelor": TRUE
   "PhD" > "Master": TRUE

5. Controlling plot order:
   Character order: Fri Mon Tue Wed Thu
   Factor order:    Mon Tue Wed Thu Fri
```

## Result

Factors are essential in R for categorical data. They provide: (1) memory efficiency by storing integer codes instead of strings, (2) proper handling in statistical models (dummy coding, contrasts), (3) ordered factors for ordinal data with meaningful comparisons, (4) controlled ordering in tables and plots, and (5) cross-tabulation for contingency analysis. Understanding factors is critical for data analysis in R.
