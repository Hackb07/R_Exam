# ============================================================
# Experiment 3: Factors and their Importance
# ============================================================

# ==================== CREATING FACTORS ====================

cat("===== CREATING FACTORS =====\n")

# Unordered factor
f_unordered <- factor(c("low", "medium", "high", "low", "medium"))
cat("Unordered factor:\n")
print(f_unordered)
cat("class:", class(f_unordered), "\n")

# Ordered factor
f_ordered <- factor(c("low", "medium", "high"),
                    levels = c("low", "medium", "high"),
                    ordered = TRUE)
cat("\nOrdered factor:\n")
print(f_ordered)
cat("is.ordered:", is.ordered(f_ordered), "\n")

# Factor with custom levels (not all levels present in data)
f_with_levels <- factor(c("male", "female", "female"),
                        levels = c("male", "female", "other"))
cat("\nFactor with extra level:\n")
print(f_with_levels)

# Factor from numeric - binning
scores <- c(55, 72, 88, 91, 63, 78, 45, 95, 82, 69)
grade_factor <- cut(scores,
                    breaks = c(0, 60, 75, 90, 100),
                    labels = c("Fail", "Pass", "Merit", "Distinction"))
cat("\nGrade bins from numeric:\n")
data.frame(Score = scores, Grade = grade_factor)

# ==================== FACTOR PROPERTIES ====================

cat("\n===== FACTOR PROPERTIES =====\n")

f <- factor(c("red", "blue", "green", "blue", "red", "green", "red"))
cat("Factor f:", f, "\n")
cat("levels(f):", levels(f), "\n")
cat("nlevels(f):", nlevels(f), "\n")
cat("table(f):\n")
print(table(f))
cat("summary(f):\n")
summary(f)

# ==================== IMPORTANCE OF FACTORS ====================

cat("\n===== IMPORTANCE OF FACTORS =====\n")

# 1. Memory efficiency (stored as integers internally)
cat("1. Memory efficiency:\n")
char_vec <- rep(c("low", "medium", "high"), 10000)
fact_vec <- factor(rep(c("low", "medium", "high"), 10000))
cat("   Object sizes:\n")
cat("   Character vector:", object.size(char_vec), "bytes\n")
cat("   Factor vector:   ", object.size(fact_vec), "bytes\n")
cat("   Saving:", object.size(char_vec) - object.size(fact_vec), "bytes\n")

# 2. Statistical modeling - factors create proper contrasts
cat("\n2. Statistical modeling (ANOVA ready):\n")
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
cat("   Class of mtcars$cyl:", class(mtcars$cyl), "\n")
model <- lm(mpg ~ cyl, data = mtcars)
cat("   ANOVA model summary:\n")
print(summary(model))

# 3. Frequency tables and cross-tabulation
cat("\n3. Cross-tabulation:\n")
gender <- factor(rep(c("Male", "Female"), each = 50))
result <- factor(c(rep("Pass", 40), rep("Fail", 10),
                   rep("Pass", 35), rep("Fail", 15)))
cat("   Contingency table:\n")
print(table(Gender = gender, Result = result))
cat("   proportions:\n")
print(prop.table(table(Gender = gender, Result = result), margin = 1))

# 4. Ordered factors for ordinal data
cat("\n4. Ordered factors (ordinal data):\n")
education <- factor(c("High School", "Bachelor", "Master", "PhD",
                      "Bachelor", "High School"),
                    levels = c("High School", "Bachelor", "Master", "PhD"),
                    ordered = TRUE)
cat("   Education levels (ordered):\n")
print(education)
cat("   Comparisons:\n")
cat('   "Master" > "Bachelor":', education[3] > education[2], "\n")
cat('   "PhD" > "Master":', education[4] > education[3], "\n")

# 5. Control order in plots
cat("\n5. Controlling plot order:\n")
# Without factor - alphabetical order
days_char <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Mon", "Tue")
cat("   Character order in table:", names(table(days_char)), "\n")

# With ordered factor - custom order
days_fact <- factor(c("Mon", "Tue", "Wed", "Thu", "Fri", "Mon", "Tue"),
                    levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                    ordered = TRUE)
cat("   Factor order in table:  ", names(table(days_fact)), "\n")

# ==================== MANIPULATING FACTORS ====================

cat("\n===== MANIPULATING FACTORS =====\n")

f <- factor(c("low", "medium", "high", "low", "medium"))

# Change levels
levels(f) <- c("L", "M", "H")
cat("After renaming levels:", f, "\n")

# Add new level
levels(f) <- c(levels(f), "very_high")
cat("Levels after adding 'very_high':", levels(f), "\n")

# droplevels() to remove unused levels
f_sub <- f[1:2]
cat("Before droplevels:\n")
cat("  levels:", levels(f_sub), "\n")
f_sub <- droplevels(f_sub)
cat("After droplevels:\n")
cat("  levels:", levels(f_sub), "\n")

# as.numeric() on factor (gives internal codes)
cat("\nas.numeric(f):", as.numeric(factor(c("low","medium","high"))), "\n")

# as.character() to get original labels
cat("as.character(f):", as.character(f), "\n")
