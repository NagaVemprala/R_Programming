#' Author: Naga Vemprala 
#' Date Created: 08/25/2021 
#' This R Script demonstrates basic syntax of R such as comments, multiline comments, print function, 
#' Vectors, Checking the type of vectors, creating names vectors, creating lists 
#' Working with date and datetimes 
#' Working with dataframes and matrices 
#' Operators and Calculations 
#' Conditional statements 

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

# Individual elements can be accessed with their names now
print(firstVector["junior"])
# Indexing in R starts with 1 (Unlike Python, Java, and other programming languages. However, the "NA" is different)
print(firstVector[0])

# Creating lists 
firstList <- list("freshman count" = 10L, "sophomore count" = 15L, "junior %" = 0.5) # A quick note below
# Even though name with a space is okay in R, it is not recommended, as accessing it poses difficulties. 
print(firstList$`junior %`)

# install.packages("tidyverse")
library(tidyverse)
library(lubridate)

today() # Provides current day in yyyy-mm-dd format 
now() # Provides time in PDT (R binaries try to pick up the local timezone)

# Converting date/datetime from strings 
yesterdaysDate <- ymd("2021-08-24")
print(yesterdaysDate)

# R is super cool to understand the format in many ways!
dayBeforeYesterday <- mdy("August 23rd, 2021")
print(dayBeforeYesterday)

dayBeforeYesterday <- dmy("23-August-2021")
print(dayBeforeYesterday)

dayBeforeYesterday <- dmy("23082021")
print(dayBeforeYesterday)

# Working with Datetimes 
tomorrowClassTime <- ymd_hms("2021-08-26 19:15:00")
print(tomorrowClassTime)

tomorrowClassTime <- mdy_hm("08/26/2021 19:15")
print(tomorrowClassTime)

# How to make the function recognize my local timezone? 
# ?ymd_hms
tomorrowClassTime <- ymd_hms("2021-08-26 19:15:00", tz="America/Los_Angeles")
print(tomorrowClassTime)
# tz above should be what the OS format. Please check the format for the specific OS you are working on
# Saying that to make the program/code generalizable for any OS, additional functions should be explored 

# Convert a datetime to date object 
firstRClassDay <- as_date(tomorrowClassTime)
print(firstRClassDay)

#' In R, the dataframe is the most versatile data structure. R dataframes are analogous to Excel sheets.
#' Each column represents data structure of one similar type only, the same way as excel column if you 
#' select and format it.
gradeRClass <- data.frame(name=c("LeBron James", "Serena Williams", "John Cena"), score=c(85, 90, 70))
print(gradeRClass)

# You can use str function to display the structure 
str(gradeRClass)

#' Matrices 
#' A matrix is a two-dimensional collection of data elements.(rows x columns)
#' To create a matrix in R, you can use the matrix() function
#' 
?matrix()

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C.1", "C.2", "C.3")))
mdat

scoresRClass <- matrix(c(90, 78, 84, 88, 78, 91, 72, 74, 76), nrow=3, ncol=3, 
                       dimnames = list(c("LeBron James", "Serena Williams", "John Cena"),
                       c("sub1", "sub2", "sub3")))
print(scoresRClass)

#' Operators (+, -, *, /)
scoresRClass <- c(88,90,93)
scoresRClass <- 1.05 * scoresRClass
scoresRClass

# Adding vectors 
scoresRClassCourse1 <- c(88,90,93)
scoresRClassCourse2 <- c(70,60,50)
scoresRClass <- scoresRClassCourse1 + scoresRClassCourse2
scoresRClass

# What if one of the course grade is missing? (Coercion)
scoresRClassCourse1 <- c(88,90,93)
scoresRClassCourse2 <- c(70,60)
scoresRClass <- scoresRClassCourse1 + scoresRClassCourse2
scoresRClass

# Logical operators and conditional statements
scoresRClassCourse1 <- c(88,90,93)
scoresRClassCourse2 <- c(70,60,50)

(scoresRClassCourse1 - scoresRClassCourse2) < 31
(scoresRClassCourse1 - scoresRClassCourse2) < 20
((scoresRClassCourse1 - scoresRClassCourse2) < 31) & (scoresRClassCourse2 >= 70)
((scoresRClassCourse1 - scoresRClassCourse2) < 31) | (scoresRClassCourse2 >= 70)
!(((scoresRClassCourse1 - scoresRClassCourse2) < 31) | (scoresRClassCourse2 >= 70))

# Conditional statements
studentGrade <- 91
if (studentGrade > 93) {
  print("You are a pro!")
} else { # Remember that the else should start immediately after closing the brace of if statement }
  print("Do you want to be a pro?")
}



