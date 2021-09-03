#' Author: Naga Vemprala 
#' Date Created: 09/02/2021 
#' This R Script demonstrates:
#' 1) Data structures date & datetime. How they are internally stored in R 
#' 2) Demonstrates the usage of Factor, creating factors from numeric data 
#' 3) Introduces the syntax of functions, explains about the arguments, 
#'    initializing function arguments with default values, returning values.
#' 4) Function's Lazy evaluation 
#' 5) Variable scoping (Lexical scoping)
#' 5) Loop functions (apply class functions - lappy,sapply,mapply,tapply,split)
#' 6) Reading files into R 
#' 7) Control structures (Sample code is provided here)
#' 

someDay <- as.Date("1970-01-02")
someDay
unclass(someDay)

?strptime()

someTime <- Sys.time()
someTime <- as.POSIXlt(someTime)
someTime
unclass(someTime)

# %c Date and time. Locale-specific on output, "%a %b %e %H:%M:%S %Y" on input.
someTime <- "Sun Sep 05 21:34:26 2021"
someTime <- strptime(someTime, format="%c")
unclass(someTime)

weekdays(someTime)
months(someTime)

someTimeAsList <- unclass(someTime)
someTimeAsList$yday

#' --------------------------------------------------------------------- '#
#'                                  Factor 
#' --------------------------------------------------------------------- '#

#' Categorical factos 
#' Factors come in handy when we need to split the data by category or treat 
#' a portion of data specific to a certain categorical label
#' In this R script, three key applications of factors are demonstrated. 
#' 1. While generating graphs, 2. working on grouping data, 3. tapply/split  

?factor()
# factor(x = character(), levels, labels = levels,
# exclude = NA, ordered = is.ordered(x), nmax = NA)

marketSentiment <- factor(c("bearish","bullish"))
levels(marketSentiment)

# Ordinal 
# Create a vector of numeric values to represent the current status of 
# customer portfolio. (negative, neutral, or positive)
customerPortfolios <- c(-1, -1, 1, 1, 1, 0, 0, 0, -1, 1, -1, 0)
length(customerPortfolios)

#' Important arguments of a factor function are: 
#' the levels in the data, labels for these levels, ordering of labels, 
#' Exclusion criteria (NA or missing values to be ignored or not)
customerPortfolios <- factor(customerPortfolios, levels = c(-1, 0, 1), 
                        labels = c("negative", "neutral", "positive"),
                        ordered = T)
# After assigning factor labels the original vector should show ordinal scale 
str(customerPortfolios)

# Converting factors to numerical (Original values will be lost)
# However, the ordering of values can be still useful 
portfolioLevelsNumeric <- as.numeric(customerPortfolios)
portfolioLevelsNumeric

# str(diamonds)
# 1. Application of factor variable in graphs 
# Advantage of using factor variable 
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
    geom_point() +
    facet_wrap(~cut)

# gl() function generates multiple levels of factor variables
# ?gl()
randomCol <- gl(2,5) # Generates two levels of factors 5 each 

# Table a sample of first 10 rows of diamonds dataset 1:10. If specific columns 
# are not mentioned after comma e.g. [1:10, ] all the columns are extracted 
diamonds1 <- diamonds[1:10,]
head(diamonds1,11)

# cbind is column bind to add a new column to a dataframe 
diamonds1 <- cbind(diamonds1, randomCol) 
diamonds1$randomCol <- factor(diamonds1$randomCol, 
                              levels = c(1,2), 
                              labels = c("first5", "next5"))
head(diamonds1)

# 2. Applying the new factor variable to generate group mean  
tapply(diamonds1$price, diamonds1$randomCol, mean)

#' --------------------------------------------------------------------- '#
#'                                  Functions  
#' --------------------------------------------------------------------- '#

#' R comes with a number of built-in datasets. 
#' These datasets can be used to put your understanding of functions to test.
# library(help = "datasets")

# The source function can be used to import code from other R scripts, files, 
# or URLs into the current working script.
?source()
source("01_Datastructures.R")

# Take a sample of the original dataset 
diamonds1 <- diamonds[1:10,]

#' The below function takes the category and price and returns an updated
#' price of 0.85*price if the diamond is "Good" category (cut), else price 
#' for all other diamond categories 
#' However, the entire dataframe or the entire columns of the dataframe such as
#' cut and price cannot be passed to the dataframe as is usually done in other 
#' interpretive programming langugages such as Python. First the code shows the 
#' issue and then provide a loop over dataframe method to address the issue 
#' Other efficient logic can be performed using lapply, purrr 
#' 
discountedPrice <- function (category, price) {
    if (category == "Good") {
        price <- price - 0.15*price 
        as.double(price)
    } else { 
        price <- price - 0.25*price 
        as.double(price)
    }
}

diamonds1$discountedPrice <- discountedPrice(diamonds1$cut, diamonds1$price)

#' Warning message:
#' In if (category == "Good") { :
#' the condition has length > 1 and only the first element will be used
#' Basically a row by row operation cannot be performed
#' write the code by looping over the dataframe to make it work 
#' 
for (i in 1:10) { 
    diamonds1[i,"discountedPrice"] <- discountedPrice(diamonds1[i,2], diamonds1[i,7])
} 

# using lapply or sapply to perform the loop (Also, make sure that the return
# type is consistent. Otherwise sapply would not simplify result)
sapply(1:nrow(diamonds1), function(rowNum) { 
    discountedPrice(diamonds1[rowNum,2], diamonds1[rowNum,7]) 
    })

#' --------------------------------------------------------------------- '#
#'                Lazy evaluation (on the go evaluation)
#' --------------------------------------------------------------------- '#
# R evaluates the variables on a call-by-need basis 
# If 3 arguments are passed to a function, and if third argument is not 
# required before returning a value from the function, then it is not required 
# to be passed. Even though it is not a good standard to code, it is better to 
# know that call-by-need evaluation is possible with R 

conditionalFunction <- function(type, n=1, dummy) {
    if (type == "A") {
        n 
    } else { 
        n * dummy 
    }
}
# The below call is perfectly legal and executes fine. Argument n is used but
# not passed while calling the function. It is still not an issue as the function
# is still receiving n through the initialization of arguments (default values)
conditionalFunction("A")
# We can pass n without giving its argument name, just like the way we passed type
conditionalFunction("A", 10)
# The below code fails if we do not pass dummy as the function is expecting the 
# variable dummy to be passed 
conditionalFunction("B", n=10)
# If dummy is passed, then the function runs fine without issues
conditionalFunction("B", n=10, dummy=10)

#' --------------------------------------------------------------------- '#
#'                    Passing functions as arguments 
#' --------------------------------------------------------------------- '#

#' Other classic programming languages, such as C, C++, and Java, do not allow 
#' functions to be provided as parameters to other functions. Two functions, 
#' myFunctionMean and myFunctionSD, are constructed in the code snippet below, 
#' which return the mean and standard deviation for random numbers generated 
#' using a rnrom distribution, respectively. The length of random numbers to be 
#' generated is determined by the input argument n. Either of these two 
#' functions is called in the next function, displayMeanOrSD, based on a 
#' conditional assessment. This function receives a type parameter, which is 
#' evaluated inside the displayMeanOrSD function and calls myFunctionMean or 
#' myFunctionMean. The displayMeanOrSD function accepts the input required (n) 
#' for these two functions.

myFunctionMean <- function(n=0){
    myList <- rnorm(n)
    mean(myList)
}

myFunctionMean(10)
myFunctionSD <- function(n=0){
    myList <- rnorm(n)
    sd(myList)
}

myFunctionSD(10)

displayMeanOrSD <- function(type, n, function1, function2) {
    if (type == "M") {
        function1(n)
    } else { 
        function2(n)
    }
}
displayMeanOrSD("M", 20, myFunctionMean, myFunctionSD)

#' --------------------------------------------------------------------- '#
#'    Lexical scoping and scoping rules of variables and function 
#' 
#' R uses Lexical scoping to resolve the variables used inside a function
#' Before knowing about Lexical scoping it is important to know about how 
#' scoping works in R. 
#' All the user defined variables that a user creates in R script reside 
#' in Global environment. If a variable is used in a scriot but is not 
#' declared in the Global environment then it will be searched in other 
#' environments that the script has access to. The accessible environments 
#' can be found using the search() function. The last environment that is 
#' checked always is package:base. If the variable is not found in the last
#' environment, then an error is thrown to the console/R terminal. 
#' package: base is the highest parent environment. 
#' Lexical scoping: 
#' Functions access variables that are created at their level or from their 
#' parent environments. 
#' --------------------------------------------------------------------- '#

# Functions within functions. And function returning a function 
# shapeSquared is declared within a function area. Area return shapeSquared
# function. 
area <- function(side) { 
    shapeSquared <- function(constant=1) {
        constant * side^2
    }
    shapeSquared
}

# shapeSquared function is returned to circle variable in the below function call
circle <- area(5)
# ls(environment()) --> Returns all the available variables and functions of the 
# current accessible environment 
# If we look at the single variable circle, it contains two other variables
# shapeSquared and side that it has access to 
ls(environment(circle))
# if we want to see what value a variable holds within a specific environment, 
# we can use a get() function and pass the corresponding environment 
get("side", environment(circle))
# The above command returns 5 as the side variable holds a value of 5

# circle is of type function 
class(circle)

# If we want to call the shapeSquared and obtain the area, we need to pass the 
# constant value to it. pi * side * side is the area of circle and 1 * side ^ 2
# is the area of a square 
circle(pi) # This returns area of a circle 

# We can create another variable to hold shapeSquared to obtain square area 
square <- area(8)
square(1)

# Lexical scoping demonstration 
#' a and b are declared at the same level where function f is defined. When f is
#' called, the variables a and b that the function f uses are always 1 and 2. 
#' If these variables are changed within another function, still they do not 
#' reflect here as the scoping is different 
#' 
a <- 1
b <- 2
f <- function(x) {
    a*x + b
}

g <- function(x) {
    a <- 2 
    b <- 1 
    f(x)
}

g(2) # Returns 4 

# Because of the multiple environments and the scoping rule issues, it is 
# advisable to remove the unncessary variables from the global environment using
# rm function as shown below 
rm(a)
# Use rm(list = ls()) cautiously as it will remove all the variables from the 
# global environment 


print <- function(x) { 
    2+3 
}
print(c(5,6))

pi
area <- function(r) {
    pi * r * r 
}

areaOfCirle <- area(3)


y <- 10 
f <- function (x) {
    y <- 2 
    y^2 + g(x)
}

g <- function(x) {
    x*y 
}

f(3)


area <- function(side) { 
    shapeSquared <- function(constant=1) {
        constant * side^2
    }
    shapeSquared
}

circle <- area(5)
circle(pi)
square <- area(8)
square()

ls(environment(square))
get("side", environment(circle))
get("side", environment(square))

constant <- pi 

a <- 1
b <- 2
f <- function(x) {
    a*x + b
}

g <- function(x) {
    a <- 2 
    b <- 1 
    f(x)
}

g(2)
?rm()
rm(f, circle)


#' --------------------------------------------------------------------- '#
#'                            Loop functions 
#' --------------------------------------------------------------------- '# 

# lapply always returns a list. It might or might not take the input as a list 
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
lapply(x, mean)

# compute the list mean for a vector 
lapply(1:10, mean)

# Generate a randorm uniform distribution 
lapply(1:10, runif)

# Anonymous function 
ranksOfAthletes <- sample.int(100, 50)
ranksOfAthletes
logRanksOfAthletes <- lapply(ranksOfAthletes, function(x) { log10(x) } )
logRanksOfAthletes

# sapply simplifies the output 
logRanksOfAthletes <- sapply(ranksOfAthletes, function(x) log10(x))
logRanksOfAthletes

# Create a matrix of 10 rows and 20 columns 
randomDist <- matrix( rnorm(200), nrow=10, ncol=20)
matrixMeanByRow <- apply(randomDist, 1, mean)
matrixMeanByRow

str(apply)
matrixMeanByCol <- apply(randomDist, 2, mean)
matrixMeanByCol

matrixQuantilesByCol <- apply(randomDist, 2, quantile, probs = c(0.25, 0.75))
matrixQuantilesByCol


noise <- function(n, mean, std) {
    rnorm(n, mean, std)
}

noise(5, 10, 2) #Simulate 5 randon numbers
noise(1:5, 1:5, 2) #This only simulates 1 set of numbers, not 5

mapply(noise, 1:5, 1:5, 2)

str(mapply)

tapply(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) 
averagePriceByCut <- tapply(diamonds$price, diamonds$cut, mean)


#' --------------------------------------------------------------------- '#
#'                     Reading files from local machine 
#' --------------------------------------------------------------------- '# 

getwd() # To obtain the current working directory for R 

carSales <- read.csv("Car_sales1.csv")
carSales <- read.csv(fileLocation)

head(carSales)

fileLocation <- paste0(getwd(),"/../Car_sales1.csv")
fileLocation
head(carSales)

fileLocation <- paste0(getwd(),"/../Datasets/Airpollution/002.csv")
airPollution <- read.csv(fileLocation)

carSales <- rbind(carSales, airPollution)
dim(carSales)
head(carSales)

