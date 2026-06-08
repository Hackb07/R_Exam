# ============================================================
# Experiment 4: CSV File Handling (Create, Read, Write)
# ============================================================

cat("===== CSV FILE HANDLING IN R =====\n\n")

# ==================== 1. CREATE A CSV FILE ====================

cat("1. CREATING A CSV FILE\n")

# Create a dataframe
student_data <- data.frame(
  RollNo   = 101:105,
  Name     = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
  Subject  = c("Math", "Science", "English", "History", "Art"),
  Marks    = c(95, 87, 78, 92, 88),
  Grade    = c("A", "B", "C", "A", "B")
)
cat("Dataframe created:\n")
print(student_data)

# Write to CSV
write.csv(student_data, "students.csv", row.names = FALSE)
cat("\nFile 'students.csv' created successfully.\n\n")

# Write with row names
student_data2 <- student_data
rownames(student_data2) <- student_data2$Name
write.csv(student_data2, "students_with_rownames.csv")
cat("File 'students_with_rownames.csv' created.\n\n")

# ==================== 2. READ A CSV FILE ====================

cat("2. READING A CSV FILE\n")

# Basic read
df_read <- read.csv("students.csv")
cat("Basic read.csv('students.csv'):\n")
print(df_read)

# Read with various options
df_read2 <- read.csv("students.csv",
                     header = TRUE,
                     sep = ",",
                     stringsAsFactors = FALSE)
cat("\nWith stringsAsFactors = FALSE:\n")
str(df_read2)

# Read specific number of rows
df_head <- read.csv("students.csv", nrows = 3)
cat("\nFirst 3 rows only:\n")
print(df_head)

# ==================== 3. WRITE TO CSV ====================

cat("\n3. WRITING TO CSV\n")

# Basic write (already done above)
# write.csv(df, "filename.csv", row.names = FALSE)

# Write using write.table (more options)
write.table(student_data, "students_table.csv",
            sep = ",", row.names = FALSE, col.names = TRUE,
            quote = FALSE)
cat("File 'students_table.csv' written with write.table().\n")

# Append to existing CSV
new_student <- data.frame(
  RollNo = 106, Name = "Frank",
  Subject = "Physics", Marks = 91, Grade = "A"
)
write.table(new_student, "students.csv",
            sep = ",", row.names = FALSE, col.names = FALSE,
            append = TRUE)
cat("New row appended to 'students.csv'.\n\n")
df_updated <- read.csv("students.csv")
print(df_updated)

# ==================== 4. OTHER FILE HANDLING COMMANDS ====================

cat("\n4. OTHER FILE HANDLING COMMANDS\n")

# Check if file exists
cat("file.exists('students.csv'):", file.exists("students.csv"), "\n")

# File information
cat("\nfile.info('students.csv'):\n")
print(file.info("students.csv"))

# List CSV files
csv_files <- list.files(pattern = "*.csv")
cat("\nCSV files in directory:\n")
print(csv_files)

# Read lines from file
cat("\nFirst 3 lines of students.csv:\n")
first_lines <- readLines("students.csv", n = 3)
cat(first_lines, sep = "\n")

# File size
cat("\nfile.size('students.csv'):", file.size("students.csv"), "bytes\n")

# Rename file
file.rename("students_with_rownames.csv", "students_renamed.csv")
cat("\nFile renamed: 'students_with_rownames.csv' -> 'students_renamed.csv'\n")
cat("file.exists('students_renamed.csv'):",
    file.exists("students_renamed.csv"), "\n")

# Copy file
file.copy("students.csv", "students_backup.csv")
cat("\nFile copied: 'students_backup.csv' created.\n")

# Remove file
file.remove("students_renamed.csv", "students_backup.csv")
cat("Files 'students_renamed.csv' and 'students_backup.csv' removed.\n")

# ==================== 5. ADDITIONAL FORMATS ====================

cat("\n5. ADDITIONAL FILE FORMATS\n")

# Write as tab-separated
write.table(student_data, "students.txt", sep = "\t",
            row.names = FALSE, quote = FALSE)
cat("Tab-separated file 'students.txt' created.\n")

# Read tab-separated
df_tab <- read.table("students.txt", header = TRUE, sep = "\t")
cat("Read tab-separated file:\n")
print(df_tab)

# ==================== CLEANUP ====================

cat("\n===== CLEANUP (keeping students.csv) =====\n")
unlink("students_table.csv")
unlink("students.txt")
cat("Temporary files cleaned up.\n")
cat("'students.csv' retained for further use.\n")
