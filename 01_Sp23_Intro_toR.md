
## 

<style>
div.explanation {
  background-color: lightgrey;
  border: 15px;
  border-color: rgb(0, 144, 255);
  border-style: solid; 
  padding: 50px;
  margin: 20px;
}

div.bullets {
  font-size: 18px;
  #background-color: lightgrey;
  font-family: 'georgia';
  color: rgb(30, 22, 86);
  font-weight: bold;
  text-align: left;
}

div.centered {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

</style>

<div class="bullets">

This markdown file summarizes the building blocks of “R programming”
language,

-   R interpreter and RStudio IDE  
-   R Packages and getting help about the packages
-   Global environment: Variables and functions
-   Write your own R functions and scripts
-   Dataframes and lists; Subsetting data from dataframes and lists
-   Datasets package
-   R Markdown files

</div>

The required textbook for this class is [R Cookbook](https://rc2e.com/)
textbook by J.D. Long and Paul Teetor, that is available for free
online. Some of the contents written in this markdown file are also
taken from [“Hands-On Programming with R: Write Your Own Functions and
Simulations”](https://rstudio-education.github.io/hopr) textbook by
Garrett Grolemund

<br>

## R interpreter and RStudio IDE

<p>

R interpreter is required in order to run R code on a computer. It
functions similarly to a command line in Mac OS or Windows operating
systems and can execute any R command without the need to compile it
first.

The interpreter looks like below image: ![R
Interpreter](Images/R%20Interpreter.png)

Once the user enters a valid sentence in its entirety and hits “Enter,”
the statements entered at the prompt “\>” are executed immediately. R
will wait for the user to finish entering the sentence before prompting
with the symbol “+” to finish the sentence.

## R Packages and getting help about the packages

Typing help.start() takes you to the rich documentation support of R.
You would get the below message.

> help.start() starting httpd help server … done  
> If nothing happens, you should open  
> ‘<http://127.0.0.1:15394/doc/html/index.html>’ yourself

R offers a wide range of applications, including numerous
domain-specific statistical tests. Most of these applications call for a
particular set of functions designed for the task at hand (such as mean
for averaging data, and max for finding the maximum value across a range
of numbers). These features are a part of the program known as package.
For instance, R’s ggplot2 package offers a lot of support for data
visualization through numeric functions.

R has an inbuilt help facility similar to the man facility of UNIX. To
get more information on any specific named function, for example solve,
the command is

> help(solve) \# Or equivalent to ?solve()  
> help(mean) \# Or equivalent to ?mean()  
> help(print) \# Or equivalent to ?print()

RStudio is a free, open source IDE (integrated development environment)
for R. (You must install R before you can install RStudio.) Its
interface is organized so that the user can clearly view graphs, data
tables, R code, and output all at the same time. It also offers an
Import-Wizard-like feature that allows users to import CSV, Excel, SAS
(*.sas7bdat), SPSS (*.sav), and Stata (\*.dta) files into R without
having to write the code to do so.

All the basic functions required to start working on R are preloaded
through various default packages such as datasets, graphics, stats, and
utils come with the default base installation.

Other required packages can be installed from the R console using the
commands such as the ones shown in below examples:

> install.packages(“dplyr”, dependencies=TRUE) \# Check the default
> value for the install.packages() function.  
> install.packages(“ggplot2”)  
> install.packages(“rmarkdown”)

If you are not sure of which package to use or which function to use
from 10,000+ functions, it is always better to search in rseek.org,
stackoverflow.com, or search for cran project views.

-   Some important functions related to packages and libraries
    \>search() - Returns all the packages in the order of loading
    \>library() - Returns a list of all the installed packages
    \>installed.packages() - Provides additional details about the
    package including the version and history \>Use
    library(package_to_load) to load the package for usage into the R
    session. Installing a package doesn’t place its functions at your
    fingertips just yet: it simply places them in your hard drive.  
    \>Using :: such as <package_name>::<function_name> helps in letting
    use the function without loading the package specifically into the
    memory

</p>

## Global environment: Variables and functions

**Creating variables in R**

``` r
#' There are two types of variables in R 
#' 1. Atomic variables 2. Lists 
#' Atomic variables are the integers, double, logical, character, and complex type 
#' 
variable1 <- c(1L, 2L, 3L) # This is an integer type 
variable2 <- c(1,2,3) # This is of double type 
variable3 <- c("1", "2", "3") # This is of character type 
variable4 <- c(TRUE, FALSE, T, F) # This is of logical type 
variable5 <- c(0+1i, 1+2i, 2+3i) # This is of complex type 
```

-   Once you create the above variables, they are created in your
    “Global Environment”.
-   This is what you see on the right side of your default RStudio panel
    under “Environment” tab.
-   There are other types of variables that are created in the other
    environments of a different packages, such as variable osVersion
    from utils package.

``` r
# ls() helps you to list the variables of a environment and if no arguments are passed, ls() by default returns the variables of golbal environment 
ls("package:utils")[1:5] # Added the lst subset [1:5] operation to display only first five elements. -- To save space. 
```

    ## [1] "?"        "adist"    "alarm"    "apropos"  "aregexec"

To delete a variable from the environment (generally the global
environment, by default), use rm(variable_name)

**Creating objects in R.**

> You can name an object in R almost anything you want, but there are a
> few rules. First, a name cannot start with a number. Second, a name
> cannot use some special symbols, like ^, !, $, @, +, -, /, or \*:

**Creating sequences**

``` r
# Generally, everything is R is designed to handle multiple elements at once using vectors. 
# sequence is a special function that helps in creating numeric vector of equal lengths quickly. 
seq1 <- seq(1:5) # Creates a integer vector 
seq2 <- seq(1,5, 0.5) # creates a double/numeric vector 
```

**Logical expressions**

``` r
variable1 <- c(12, 14, 9, 16, 8, 32, 33, 39, 7)
variable2 <- variable1[(variable1 > 9) & (variable1 < 30)]
print(variable2)
```

    ## [1] 12 14 16

``` r
# Use only a single & for operations on a vector 
# You would get undesirable results with the &&
variable2 <- variable1[(variable1 > 9) && (variable1 < 30)] # Gives undesirable result 
print(variable2)
```

    ## [1] 12 14  9 16  8 32 33 39  7

``` r
# Use the && condition in if-else and while flow of control operations to make sure that the expression evaluates a single element at a time 
function1 <- function(x){
  x <- if ((x > 9) && (x<30)) {
    x
  } else { 
    x <- NULL 
  }
  x
}
variable2 <- NULL 
i <- 1 
while(i <= length(variable1)) {
  x <- function1(variable1[i])
  variable2 <- append(variable2, x)
  i <- i + 1 
}
variable2 
```

    ## [1] 12 14 16

## Write your own R functions and scripts

**Writing functions in R**  
\>Every function in R has three basic parts: a name, a body of code, and
a set of arguments. To make your own function, you need to replicate
these parts and store them in an R object, which you can do with the
function function. To do this, call function() and follow it with a pair
of braces, {}:

``` r
odd_even <- function(take_this_number = 0) { 
  # Is this number even, great, return "Even"
  if(take_this_number %% 2 == 0) {
    "Even"
  } else { 
    "Odd"
  }
}
just_a_number <- 15
odd_even(just_a_number)
```

    ## [1] "Odd"

<div class="explanation">

odd_even is the function’s name. odd_even is, at the end of the day,
just another variable in R that is stored in the global environment, but
it can do some extra things than regular variables, such as behave
differently in different instances based on the input number (The
“take_this_number” variable). However, the take_this_number variable is
not part of the global environment; it is only accessible within the
odd_even function. In addition, the just_a\_number variable is passed to
the function odd_even and is referred to as take_this_number inside the
function, as seen in the preceding code snippet. take_this_number is a
replica or copy of the just_a\_number and if one of the variable is
changed, then the other one is not impacted.

</div>

> The created functions are generally stored in a single R script, that
> has a .R extension. If the functions are to be used in another
> program, then the script has to be referred into the place where the
> functions are required using source(“My_main_functions.R”)

-   For example, the main functions are written in the
    helper_functions.R, and these functions are needed in
    “hey_I\_use_function_mars.R”, then you should use
    source(“helper_functions.R”) inside “hey_I\_use_function_mars.R”

**Dataframes and lists; Subsetting data from dataframes and lists** A
data frame is a table or a two-dimensional array-like structure in which
each column contains values of one variable and each row contains one
set of values from each column.

Following are the characteristics of a data frame.

-   The column names should be non-empty.
-   The row names should be unique.
-   The data stored in a data frame can be of numeric, factor or
    character type.
-   Each column should contain same number of data items.

Let’s create a data.frame for our class with 3
columns/variables/vectors. First column contains student_id, second
column contains student_name, and the third column contains
student_score

``` r
students <- data.frame(student_id = c(101, 202, 303), 
                       student_name = c("Taylor Swift", "LeBron James", "Warren Buffett"),
                       student_scores = c(95, 85, 75))
print(students)
```

    ##   student_id   student_name student_scores
    ## 1        101   Taylor Swift             95
    ## 2        202   LeBron James             85
    ## 3        303 Warren Buffett             75

-   Certain objects/data structures in R have some attributes
-   For example, the attributes for a data.frame are the column names,
    row names, dimension (row x column) etc. It can be accessed using
    the attributes function e.g: attributes(mtcars)

``` r
attributes(students)
```

    ## $names
    ## [1] "student_id"     "student_name"   "student_scores"
    ## 
    ## $class
    ## [1] "data.frame"
    ## 
    ## $row.names
    ## [1] 1 2 3

-   As can be seen, the “row.names” property of the data frame we
    created contains numeric values by default. Therefore, these row
    names (default numeric values in this case) permit access to the
    rows of the data frame. students\[2,\] provides access to the second
    row of the data frame. **Please note that the “,” following the
    number 2 indicates that all columns of row 2 are being accessed.
    This is the subscript notation for data frame access**

-   The row.names can be updated with other meaningful names such as
    c(“student1”, “student2”, “student2”) and the row can be accessed as
    shown below:

``` r
rownames(students) <- c("student1", "student2", "student3")
students["student2", ]
```

    ##          student_id student_name student_scores
    ## student2        202 LeBron James             85

-   Other means to access the data from dataframe using subset
    operations:
    -   Access only the third column of the dataframe (3 different
        approaches)
    -   Accessing the rows using the logical vector is also similar to
        the way columns are accessed using a logical vector

``` r
students[3]
```

    ##          student_scores
    ## student1             95
    ## student2             85
    ## student3             75

``` r
students[, 3]
```

    ## [1] 95 85 75

``` r
students[, "student_scores"]
```

    ## [1] 95 85 75

``` r
students[, c(FALSE, FALSE, TRUE)]
```

    ## [1] 95 85 75

**class function/attribute to check the type of an object** - data.frame
has a class attribute and it says that the type is a “data.frame”.
However, any object in the R ecosystem has a class type. Atomic vectors
are of types character, integer, double, logical, and complex. Integer
and double comes under numeric class.

**Dates and Times** \>The attribute system lets R represent more types
of data than just doubles, integers, characters, logicals, complexes,
and raws. The time looks like a character string when you display it,
but its data type is actually “double”, and its class is “POSIXct”
“POSIXt” (it has two classes):

``` r
now <- Sys.time()
print(now) # Prints current date time 
```

    ## [1] "2023-02-13 15:47:02 PST"

``` r
print(typeof(now)) # Prints "double"
```

    ## [1] "double"

``` r
print(class(now)) # Should display "POSIXct" "POSIXt" 
```

    ## [1] "POSIXct" "POSIXt"

``` r
# Remove the class of "now" and print it, then the real number internally stored can be seen
now <- unclass(now)
print(now)
```

    ## [1] 1676332022

**Factors**

> Factors are R’s way of storing categorical information, like ethnicity
> or eye color. Think of a factor as something like a gender; it can
> only have certain values (male or female), and these values may have
> their own idiosyncratic order (ladies first).

``` r
gender <- factor(c("male", "female", "female", "male"))

print(typeof(gender)) # Should print "integer"
```

    ## [1] "integer"

``` r
print(attributes(gender))
```

    ## $levels
    ## [1] "female" "male"  
    ## 
    ## $class
    ## [1] "factor"

``` r
gender <- unclass(gender)
print(gender) # Internal numeric values are revealed 
```

    ## [1] 2 1 1 2
    ## attr(,"levels")
    ## [1] "female" "male"

**Lists**

> Lists are like atomic vectors because they group data into a
> one-dimensional set. However, lists do not group together individual
> values; lists group together R objects, such as atomic vectors and
> other lists. For example, you can make a list that contains a numeric
> vector of length 31 in its first element, a character vector of length
> 1 in its second element, and a new list of length 2 in its third
> element. To do this, use the list function.

``` r
list1 <- list(100:130, "R", list(TRUE, FALSE))
list1
```

    ## [[1]]
    ##  [1] 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118
    ## [20] 119 120 121 122 123 124 125 126 127 128 129 130
    ## 
    ## [[2]]
    ## [1] "R"
    ## 
    ## [[3]]
    ## [[3]][[1]]
    ## [1] TRUE
    ## 
    ## [[3]][[2]]
    ## [1] FALSE

**Saving data in R for processing** You can save data in R with five
different objects, which let you store different types of values in
different types of relationships. Of these objects, data frames are by
far the most useful for data science. Data frames store one of the most
common forms of data used in data science, tabular data.
![data_types_summary](Images/Data_Types_Summary.png)

**Dollar Signs and Double Brackets**

> Two types of object in R obey an optional second system of notation.
> You can extract values from data frames and lists with the $ syntax.
> You will encounter the $ syntax again and again as an R programmer, so
> let’s examine how it works.

``` r
lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst
```

    ## $numbers
    ## [1] 1 2
    ## 
    ## $logical
    ## [1] TRUE
    ## 
    ## $strings
    ## [1] "a" "b" "c"

``` r
lst[1] # Returns the object of same type as original object which is a list 
```

    ## $numbers
    ## [1] 1 2

``` r
lst[[1]] # Returns an atomic object. 
```

    ## [1] 1 2

``` r
lst$numbers # Same as [[1]]
```

    ## [1] 1 2

## Datasets package

> Once you start your R program, there are example data sets available
> within R along with loaded packages. You can list the data sets by
> their names and then load a data set into memory to be used in your
> statistical analysis.

-   Make sure to use help to look for the available datasets
    help(package=“datasets”)

-   Other useful package that provides helpful datasets to test
    regression models is “Modern Applied Statistics with S”.

-   Command library loads the package MASS (for Modern Applied
    Statistics with S) into memory. - Command data() will list all the
    datasets in loaded packages.

-   library(MASS)

-   If you are planning to use the phone calls dataset (phones), then
    type the command data(phones) will load the data set phones into
    memory.

## R Markdown files

-   R Markdown documents are fully reproducible. Use a productive
    notebook interface to weave together narrative text and code to
    produce elegantly formatted output. R Markdown supports dozens of
    static and dynamic output formats including HTML, PDF, MS Word,
    Beamer, HTML5 slides, Tufte-style handouts, books, dashboards, shiny
    applications, scientific articles, websites, and more.

[R Markdown Help](https://rmarkdown.rstudio.com/index.html)

<br>

<div class="centered">

![Test](Images/Cheers.gif)

</div>
