#' Author: Naga Vemprala 
#' Date Created: 08/25/2021 
#' This R Script demonstrates basic syntax of R such as comments, multiline comments, print function, 
#' Vectors, Checking the type of vectors
#' 

firstVector <- c(0.1, 0.5, 0.4) # This is a numeric vector of type double
secondVector <- c(1L, 2L, 3L) # Another numeric vector of type integer 
thirdVector <- c("One", "Two", "Three") # Third vector is a character vector 

print("Now I am displaying the data types of each of these vectors")

print(typeof(firstVector))
print(typeof(secondVector))
print(typeof(thirdVector))

# Values of a vector can be accessed individually with subscripts 
print(firstVector[2])

# Vectors can also be named 
names(firstVector) <- c("freshman", "sophomore", "junior")
print(firstVector)
# Indexing in R starts with 1 (Unlike Python, Java, and other programming languages. However, the "NA" is different)
print(firstVector[0])


