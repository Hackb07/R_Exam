# ============================================================
# Experiment 5: Read CSV into Dataframe, Update, Write to New File
# ============================================================

cat("===== READ CSV -> MODIFY DATAFRAME -> WRITE NEW CSV =====\n\n")

# ==================== 1. CREATE ORIGINAL CSV ====================

cat("1. Creating original CSV file...\n")

employee_data <- data.frame(
  EmpID    = c(1001, 1002, 1003, 1004, 1005),
  Name     = c("John", "Sarah", "Mike", "Emma", "David"),
  Department = c("IT", "HR", "IT", "Finance", "HR"),
  Salary   = c(50000, 45000, 55000, 48000, 42000),
  Joining_Year = c(2018, 2020, 2017, 2019, 2021)
)
write.csv(employee_data, "original_employees.csv", row.names = FALSE)
cat("'original_employees.csv' created.\n")
print(employee_data)

# ==================== 2. READ CSV INTO DATAFRAME ====================

cat("\n2. Reading CSV into dataframe...\n")
df <- read.csv("original_employees.csv", stringsAsFactors = FALSE)
cat("Dataframe loaded. dim():", dim(df), "\n")
cat("Column names:", names(df), "\n")
str(df)

# ==================== 3. MANIPULATE / UPDATE THE DATAFRAME ====================

cat("\n3. Manipulating dataframe...\n")

# a) Add new calculated column: 10% bonus
df$Bonus <- df$Salary * 0.10
cat("a) Added Bonus column (10% of Salary):\n")

# b) Add derived column: Salary category
df$Salary_Category <- ifelse(df$Salary >= 50000, "High",
                      ifelse(df$Salary >= 45000, "Medium", "Low"))
cat("b) Added Salary_Category:\n")

# c) Update existing values (10% hike for IT department)
df$Salary[df$Department == "IT"] <- df$Salary[df$Department == "IT"] * 1.10
cat("c) Applied 10% salary hike to IT department.\n")

# d) Calculate years of experience
current_year <- 2025
df$Experience <- current_year - df$Joining_Year
cat("d) Added Experience column (years since joining).\n")

# e) Add seniority status
df$Status <- ifelse(df$Experience >= 7, "Senior", "Junior")

# f) Reorder columns
df <- df[, c("EmpID", "Name", "Department", "Salary", "Bonus",
             "Salary_Category", "Joining_Year", "Experience", "Status")]

cat("\nUpdated dataframe:\n")
print(df)

# ==================== 4. WRITE TO NEW CSV FILE ====================

cat("\n4. Writing updated dataframe to new CSV file...\n")
write.csv(df, "updated_employees.csv", row.names = FALSE)
cat("'updated_employees.csv' written successfully.\n\n")

# Verify by reading it back
cat("Verification - reading back 'updated_employees.csv':\n")
df_verified <- read.csv("updated_employees.csv")
print(df_verified)

# ==================== 5. ADDITIONAL EXAMPLES ====================

cat("\n===== ADDITIONAL EXAMPLES =====\n")

# Example 2: Student marks processing
cat("\nExample 2: Student Marks Processing\n")

# Create original
marks <- data.frame(
  StudentID = 1:6,
  Name = c("Alice", "Bob", "Charlie", "Diana", "Eve", "Frank"),
  Math = c(85, 72, 90, 68, 95, 78),
  Science = c(80, 75, 88, 72, 92, 70),
  English = c(78, 82, 85, 70, 88, 74)
)
write.csv(marks, "original_marks.csv", row.names = FALSE)

# Read, process, write new
df_marks <- read.csv("original_marks.csv")
df_marks$Total <- df_marks$Math + df_marks$Science + df_marks$English
df_marks$Average <- round(df_marks$Total / 3, 2)
df_marks$Result <- ifelse(df_marks$Average >= 75, "Distinction",
                   ifelse(df_marks$Average >= 60, "First Class",
                   ifelse(df_marks$Average >= 50, "Pass", "Fail")))

write.csv(df_marks, "updated_marks.csv", row.names = FALSE)
cat("Updated marks written to 'updated_marks.csv'\n")
print(df_marks)

# ==================== 6. CLEANUP ====================

cat("\n===== CLEANUP =====\n")
# Keep only the updated files, remove originals
unlink("original_employees.csv")
unlink("original_marks.csv")
cat("Temporary original files removed.\n")
cat("Retained: updated_employees.csv, updated_marks.csv\n")
