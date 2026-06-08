# Experiment 7: Sum of Even Numbers & Product of Odd Numbers

## Aim
To write R programs that compute the sum of all even numbers and the product of all odd numbers in a given range using multiple approaches: vectorized operations, for loops, while loops, and reusable functions.

## Algorithm

```
Step 1: Define a range of numbers (e.g., 1 to 20)
Step 2: METHOD 1 - Vectorized:
  2a: Use %% 2 == 0 to filter even numbers, sum() them
  2b: Use %% 2 != 0 to filter odd numbers, prod() them
Step 3: METHOD 2 - For Loop:
  3a: Initialize sum_even = 0, prod_odd = 1
  3b: Loop through each number:
       - If number %% 2 == 0, add to sum_even
       - Else, multiply into prod_odd
  3c: Print results
Step 4: METHOD 3 - Reusable function:
  4a: Define function even_odd_calc(vec)
  4b: Compute evens, odds, sum, product
  4c: Return as list
Step 5: METHOD 4 - Range-based function:
  5a: Define even_odd_range(start, end)
  5b: Create sequence, compute sum/product
Step 6: METHOD 5 - While loop alternative
Step 7: Verify results against expected values
Step 8: End
```

## Code

[code.R](code.R)

```r
# Vectorized
numbers <- 1:20
sum_even <- sum(numbers[numbers %% 2 == 0])
prod_odd <- prod(numbers[numbers %% 2 != 0])

# For loop
sum_e <- 0; prod_o <- 1
for (n in 1:20) {
  if (n %% 2 == 0) sum_e <- sum_e + n
  else prod_o <- prod_o * n
}

# Function
even_odd_calc <- function(vec) {
  list(sum_evens = sum(vec[vec %% 2 == 0]),
       prod_odds = prod(vec[vec %% 2 != 0]))
}
even_odd_calc(1:20)

# While loop
i <- 1; sum_w <- 0; prod_w <- 1
while (i <= 20) {
  if (i %% 2 == 0) sum_w <- sum_w + i
  else prod_w <- prod_w * i
  i <- i + 1
}
```

## Output

```
===== SUM OF EVEN & PRODUCT OF ODD NUMBERS =====

METHOD 1: Vectorized approach

Numbers: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20

Even numbers: 2 4 6 8 10 12 14 16 18 20
Sum of even numbers: 110

Odd numbers: 1 3 5 7 9 11 13 15 17 19
Product of odd numbers: 654729075

----------------------------------------
METHOD 2: Loop-based approach
Sum of evens (loop): 110
Product of odds (loop): 654729075

----------------------------------------
METHOD 3: Reusable function
Range 1:10
  Sum of evens: 30
  Product of odds: 945

Custom vector (2,5,8,11,14,17,20):
  Even numbers: 2 8 14 20
  Odd numbers: 5 11 17
  Sum of evens: 44
  Product of odds: 935

----------------------------------------
VERIFICATION
Expected sum of evens (1:20): 110
Expected product of odds (1:20): 654729075
Matches: TRUE
```

## Result

The sum of even numbers and product of odd numbers was successfully computed using five different approaches. The vectorized method (using %% with sum()/prod()) is most efficient in R. The for-loop and while-loop methods demonstrate traditional programming logic. The reusable function approach provides flexibility for different input ranges. All methods produced identical, verified results.
