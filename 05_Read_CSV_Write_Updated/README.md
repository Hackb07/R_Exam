# Experiment 5: Read CSV into Dataframe and Write Back to a New File

## Aim
To read a CSV file into an R dataframe, perform data manipulation operations (add columns, update values, categorize data), and write the modified dataframe to a new CSV file.

## Algorithm

```
Step 1: Create original CSV file with employee/student data
Step 2: Read CSV into dataframe using read.csv()
Step 3: Add new calculated columns (Bonus = Salary * 0.10)
Step 4: Add derived categorical columns (Salary_Category using ifelse)
Step 5: Update existing column values (salary hike for specific dept)
Step 6: Calculate derived fields (Experience = current_year - joining_year)
Step 7: Add conditional status columns (Senior/Junior based on experience)
Step 8: Reorder columns for better readability
Step 9: Write updated dataframe to new CSV using write.csv(row.names = FALSE)
Step 10: Verify by reading the new CSV back
Step 11: Demonstrate with student marks example (Total, Average, Result)
Step 12: End
```

## Code

[code.R](code.R)

```r
# 1. CREATE ORIGINAL
employee_data <- data.frame(
  EmpID = c(1001,1002,1003,1004,1005),
  Name = c("John","Sarah","Mike","Emma","David"),
  Department = c("IT","HR","IT","Finance","HR"),
  Salary = c(50000,45000,55000,48000,42000),
  Joining_Year = c(2018,2020,2017,2019,2021)
)
write.csv(employee_data, "original_employees.csv", row.names = FALSE)

# 2. READ
df <- read.csv("original_employees.csv")

# 3. MANIPULATE
df$Bonus <- df$Salary * 0.10
df$Salary_Category <- ifelse(df$Salary >= 50000, "High",
                       ifelse(df$Salary >= 45000, "Medium", "Low"))
df$Salary[df$Department == "IT"] <- df$Salary[df$Department == "IT"] * 1.10
df$Experience <- 2025 - df$Joining_Year
df$Status <- ifelse(df$Experience >= 7, "Senior", "Junior")

# 4. WRITE NEW
write.csv(df, "updated_employees.csv", row.names = FALSE)
```

## Output

```
===== READ CSV -> MODIFY DATAFRAME -> WRITE NEW CSV =====

1. Creating original CSV file...
  EmpID  Name Department Salary Joining_Year
1  1001  John         IT  50000         2018
2  1002 Sarah         HR  45000         2020
3  1003  Mike         IT  55000         2017
4  1004  Emma    Finance  48000         2019
5  1005 David         HR  42000         2021

3. Manipulating dataframe...
Updated dataframe:
  EmpID  Name Department  Salary  Bonus Salary_Category Joining_Year Experience  Status
1  1001  John         IT 55000.0   5000            High         2018          7  Senior
2  1002 Sarah         HR 45000.0   4500         Medium         2020          5  Junior
3  1003  Mike         IT 60500.0   5500            High         2017          8  Senior
4  1004  Emma    Finance 48000.0   4800         Medium         2019          6  Junior
5  1005 David         HR 42000.0   4200             Low         2021          4  Junior

4. Writing updated dataframe to new CSV file...
'updated_employees.csv' written successfully.

===== ADDITIONAL EXAMPLES =====
Example 2: Student Marks Processing
  StudentID    Name Math Science English Total Average       Result
1         1   Alice   85      80      78   243   81.00 Distinction
2         2     Bob   72      75      82   229   76.33 Distinction
3         3 Charlie   90      88      85   263   87.67 Distinction
4         4   Diana   68      72      70   210   70.00  First Class
5         5     Eve   95      92      88   275   91.67 Distinction
6         6   Frank   78      70      74   222   74.00  First Class
```

## Result

The workflow of reading a CSV file, manipulating the dataframe (adding columns, updating values, creating categories), and writing to a new CSV file was successfully demonstrated. This is a common data pipeline pattern in data science: extract data from CSV, transform/clean it in R, and load the results back to a new CSV file.
