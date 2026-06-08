# Experiment 2: Vectors, Matrices, Dataframes, and Lists

## Aim
To understand and implement the four fundamental data structures in R: vectors (1D homogeneous), matrices (2D homogeneous), dataframes (2D heterogeneous), and lists (recursive heterogeneous).

## Algorithm

```
Step 1: Create vectors using c(), : operator, seq(), and rep()
Step 2: Perform vector operations (arithmetic, indexing, filtering)
Step 3: Create matrices using matrix() with row-wise and column-wise filling
Step 4: Perform matrix operations (transpose, multiplication, dimension queries)
Step 5: Access matrix elements using row/column indices
Step 6: Create dataframes using data.frame() with heterogeneous columns
Step 7: Access dataframe columns using $, [, [[ operators
Step 8: Add new columns and subset dataframes
Step 9: Create lists containing mixed data types
Step 10: Access list elements using [[, $, and [ operators
Step 11: Add new elements to existing lists
Step 12: End
```

## Code

[code.R](code.R)

```r
# VECTORS
v_num <- c(1, 2, 5, 7, 9)
v_char <- c("apple", "banana", "cherry")
v_log <- c(TRUE, FALSE, TRUE)
v_seq <- 1:10
v_named <- c(a = 10, b = 20, c = 30)
v1 + 10; v1 * 2; sqrt(v1)
v1[2]; v1[c(1,3)]; v1[v1 > 5]

# MATRICES
m1 <- matrix(1:12, nrow = 3, ncol = 4)
m2 <- matrix(1:12, nrow = 3, byrow = TRUE)
t(m1); m1[2,3]; m1[1,]; m1[,2]; m1[1:2, 3:4]
rbind(c(1,2), c(3,4)); cbind(c(1,2), c(3,4))

# DATAFRAMES
df <- data.frame(Name=c("Alice","Bob"), Age=c(25,30),
                 Score=c(88,92), Pass=c(TRUE,TRUE))
df$Name; df[, "Age"]; df[1,]; df[1:2, c("Name","Score")]
df$Grade <- c("B","A"); subset(df, Age > 28)

# LISTS
lst <- list(numbers=c(10,20,30), mat=matrix(1:4,nrow=2),
            data=df, text="hello")
lst[[1]]; lst$numbers; lst[['text']]; lst[c("numbers","text")]
lst$new_item <- 100
```

## Output

```
===== VECTORS =====
Numeric vector: 1 2 5 7 9
Character vector: apple banana cherry
Sequence vector seq(2,20,2): 2 4 6 8 10 12 14 16 18 20
v1 + 10: 11 13 15 17 19
v1 * 2: 2 6 10 14 18
v1[2]: 3
v1[v1 > 5]: 7 9

===== MATRICES =====
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
[3,]    9   10   11   12

m1[2,3]: 7
m1[1,]: 1 2 3 4

===== DATAFRAMES =====
    Name Age Score  Pass
1  Alice  25    88  TRUE
2    Bob  30    92  TRUE
3 Charlie  35    85 FALSE
4  Diana  28    90  TRUE

===== LISTS =====
List of 4
 $ numbers: num [1:3] 10 20 30
 $ mat    : int [1:2, 1:2] 1 3 2 4
 $ data   :'data.frame':   4 obs. of  6 variables
 $ text   : chr "Hello from list"
```

## Result

All four R data structures were successfully created and manipulated. Vectors store homogeneous 1D data; matrices store homogeneous 2D data; dataframes store heterogeneous 2D data (like tables); lists store heterogeneous data of any type recursively. Each structure has specific access methods and operations that make R powerful for data analysis.
