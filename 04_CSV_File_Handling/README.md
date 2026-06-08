# Experiment 4: Create, Read, Write CSV Files and File Handling Commands

## Aim
To learn how to create CSV files from dataframes, read CSV files into R, write dataframes back to CSV files, and use various file handling commands in R.

## Algorithm

```
Step 1: Create a dataframe with sample data
Step 2: Write dataframe to CSV using write.csv() (with/without row names)
Step 3: Read CSV file back using read.csv() with various options
Step 4: Read specific number of rows using nrows parameter
Step 5: Write using write.table() with custom options (sep, quote, etc.)
Step 6: Append new rows to existing CSV file
Step 7: Check file existence with file.exists()
Step 8: Get file information with file.info()
Step 9: List CSV files using list.files(pattern = "*.csv")
Step 10: Read raw lines using readLines()
Step 11: Rename files using file.rename()
Step 12: Copy files using file.copy()
Step 13: Delete files using file.remove()
Step 14: Demonstrate tab-separated files (read.table / write.table)
Step 15: End
```

## Code

[code.R](code.R)

```r
# CREATE
student_data <- data.frame(RollNo=101:105, Name=c("Alice","Bob","Charlie","Diana","Eve"),
                           Subject=c("Math","Science","English","History","Art"),
                           Marks=c(95,87,78,92,88), Grade=c("A","B","C","A","B"))
write.csv(student_data, "students.csv", row.names = FALSE)

# READ
df <- read.csv("students.csv")
df2 <- read.csv("students.csv", stringsAsFactors = FALSE)
df3 <- read.csv("students.csv", nrows = 3)

# WRITE
write.csv(df, "output.csv", row.names = FALSE)
write.table(df, "output2.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(new_row, "students.csv", sep = ",", row.names = FALSE,
            col.names = FALSE, append = TRUE)

# FILE COMMANDS
file.exists("students.csv")
file.info("students.csv")
list.files(pattern = "*.csv")
readLines("students.csv", n = 3)
file.rename("old.csv", "new.csv")
file.copy("source.csv", "dest.csv")
file.remove("unwanted.csv")
```

## Output

```
===== CSV FILE HANDLING IN R =====

1. CREATING A CSV FILE
Dataframe created:
  RollNo    Name  Subject Marks Grade
1    101   Alice     Math    95     A
2    102     Bob  Science    87     B
3    103 Charlie  English    78     C
4    104   Diana  History    92     A
5    105     Eve      Art    88     B

2. READING A CSV FILE
Basic read.csv('students.csv'):
  RollNo    Name  Subject Marks Grade
1    101   Alice     Math    95     A
...

3. WRITING TO CSV
File 'students_table.csv' written with write.table().
New row appended to 'students.csv'.

4. OTHER FILE HANDLING COMMANDS
file.exists('students.csv'): TRUE
file.info('students.csv'):
  size isdir mode mtime              ...
  178  FALSE  666  2025-...

First 3 lines of students.csv:
RollNo,Name,Subject,Marks,Grade
101,Alice,Math,95,A
102,Bob,Science,87,B
```

## Result

All CSV file handling operations were successfully demonstrated. R provides write.csv() and read.csv() for simple CSV operations, write.table() and read.table() for more control, and numerous file management functions (file.exists, file.info, file.rename, file.copy, file.remove) for complete file system manipulation. Appending to existing CSV files is possible using write.table() with append=TRUE.
