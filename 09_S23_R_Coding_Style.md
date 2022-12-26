RCodingStyle
================
Naga Vemprala
2022-12-23

## R naming conventions, variables, and functions

This markdown file demonstrates how to use naming conventions when
working with R, variables, pre-defined functions, and user-defined
functions.

-   Naming conventions are important because they help others understand
    and improve existing functionality, increasing code reusability.

**Stick to the right conventions when:**

-   naming files and variables
-   consistently spacing the code
-   open curly braces should never be placed on a new line at the
    beginning
-   line length should be limited to 80 characters (This is the standard
    coming from ages because if you go beyond 80 characters, you need to
    use your mouse to scroll through the IDE to read the code)
-   Indentation - Use a consistent indentation of two spaces, four
    spaces, or eight spaces (4 is preferable)
-   It is critical to comment your code so that someone can quickly go
    through it without having to go line by line.

Variable Names: There are some reserved variable names that are quite
commonly followed in data analytics programs.

1.  w is the vector or matrix names for weights
2.  i, j are used for indices
3.  df is used for naming a temporary dataframe
4.  n is used for length, or number of rows
5.  p is for the number of columns
6.  x, y, z, are used for temporary vectors

**General syntax of a function. We will see some common function naming
conventions.**

``` r
function_name <- function(argument_1, argument_2, ... ) {
    function_body
}
```

``` r
print("hello where am I?")
```

    ## [1] "hello where am I?"

``` r
# Hey look, paste could come handy to print multiple values to console 
print(paste("message 1", "message 2"))
```

    ## [1] "message 1 message 2"

If you do not know the purpose of a function or how to use a function,
better get some help. ?print()

General form of if - else block

``` r
if (condition) {
  # code executed when condition is TRUE
} else {
  # code executed when condition is FALSE
}
```

**A simple function to check positive and negative values in a vector.
If the value is positive convert the value to 1 and convert the value to
-1 if the value is negative**

``` r
test_vector <- rnorm(10,0,1)
print("Before calling the function: ") 
```

    ## [1] "Before calling the function: "

``` r
print(test_vector)
```

    ##  [1]  0.51615699 -0.81307064  0.32996657  1.92144393 -2.45780984  0.09158516
    ##  [7] -1.00391149  2.59516699 -0.39796460 -1.12661418

``` r
binary_pos_neg <- function(x) { 
  if (x > 0) { 
    1
  } else { 
    -1 
  }
}


for (i in seq(1,length(test_vector))) { 
  test_vector[i] <- binary_pos_neg(test_vector[i])
} 

print("After calling the function: ") 
```

    ## [1] "After calling the function: "

``` r
print(test_vector)
```

    ##  [1]  1 -1  1  1 -1  1 -1  1 -1 -1

There are multiple variations to loop over a vector. Anyway, looping
over vector is inefficient coding. It has to be avoided at all costs.
When it is inevitable, the above method is one approach where each
element of a vector can be easily accessible.

The other approaches are:

``` r
for (i in seq_along(test_vector)) { 
  do something ... # Here, we are not updating the individual element of the vector 
}
```

``` r
for (i in test_vector) { 
  do something ... # Here, we are not updating the individual element of the vector
}
```

There are two important functions within function for performing dynamic
code validations. The below logic halts the execution and hence is
marked as error = TRUE

``` r
test_vector <- c(-0.89003794, 0.0718589, "0.06638294", -0.77696417, -0.99994674, -0.73938280,  0.28216709, 0.70345809, -0.39638626, 0.64133973)
print("Before calling the function: ") 
```

    ## [1] "Before calling the function: "

``` r
print(test_vector)
```

    ##  [1] "-0.89003794" "0.0718589"   "0.06638294"  "-0.77696417" "-0.99994674"
    ##  [6] "-0.7393828"  "0.28216709"  "0.70345809"  "-0.39638626" "0.64133973"

``` r
binary_pos_neg <- function(x) { 
  stopifnot(is.numeric(x));
  if (x > 0) { 
    1
  } else { 
    -1 
  }
}


for (i in seq(1,length(test_vector))) { 
  test_vector[i] <- binary_pos_neg(test_vector[i])
} 
```

    ## Error in binary_pos_neg(test_vector[i]): is.numeric(x) is not TRUE

``` r
print("After calling the function: ") 
```

    ## [1] "After calling the function: "

``` r
print(test_vector)  
```

    ##  [1] "-0.89003794" "0.0718589"   "0.06638294"  "-0.77696417" "-0.99994674"
    ##  [6] "-0.7393828"  "0.28216709"  "0.70345809"  "-0.39638626" "0.64133973"

## Exercises.

### Exercise \# 1.

1.  Make a vector of “n” random numbers.
2.  Apply min-max normalization to the vector values between 0 and 1
    min-max normalization: (value - min(of all vector values i.e.,
    V)/(max(V) - min(V))
3.  In a function, implement the logic of creating a vector of size n
    and normalization. The “n” argument is passed to the function.
4.  Print the vector both before and after normalization.
5.  Provide two test cases in which the function is called with two
    different “n” values. (n = 10 and n = 15)

### Exercise \# 2.

Complete the same exercise in a new way this time. Create a function
that first computes the vector’s min and max values before calling the
second function and passing the random numbers vector, min, and max
values to the second function to generate the normalized vector. The
first function takes the argument “n” and returns a numeric vector of
size “n.” The first function accepts only one argument. The second
function takes three arguments, which is called from the first function.
The random vector with size “n”, minimum and maximum values.

### Exercise \# 3.

Read the student scores file. Use the cut method to label a letter grade
based on the student’s final numeric score in the class. e.g., if the
student score is 94, then the letter grade is “A”, if the student score
is 91, then the letter grade is “A-” etc.
