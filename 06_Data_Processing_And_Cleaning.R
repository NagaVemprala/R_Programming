#' Author: Naga Vemprala 
#' Date Created: 09/11/2021 
#' This R script demonstrates tools available to clean datasets, process data 
#' and additional tools to visualize the results 
#' Topics: 
#' 1. Ordering vectors and sorting dataframes 
#' 2. subsetting - Extracting rows from Dataframe in multiple ways 
#' 
#' Data comes in various formats and forms. 
#' One great example is: https://archive.ics.uci.edu/ml/datasets.php 
#' 

#' ------------------------------------------------------------------------- '#
#'             Subsetting, Data Manipulation, and Data Cleaning  
#' ------------------------------------------------------------------------- '#
#' 
#' Reading CSV files 
#' https://archive.ics.uci.edu/ml/datasets/Estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition+
#' 
paste0(getwd(),"/../Datasets/Obesity.csv") -> fileLocation 
fileLocation 
obesity <- read.csv(fileLocation)
dim(obesity)

randomNumbers <- round(100*runif(10, 2.0, 7),0)
randomNumbers
head(obesity[randomNumbers,], 10) 

# sorting vectors and ordering dataframes 
randomNumbers <- sort(randomNumbers, decreasing = FALSE)
obesityAge <- sort(obesity$Age, na.last = TRUE)
tail(obesityAge)

# The difference between order and sort
a<-c(10, 7, 13, 5, 0, 9, 2)
w<-1:7


#sort returns a new vector in the sorted sequence
sort(a)
sort(w)

# order returns a set of "indexes" you can use to retrieve the values in sequence
ordidx<-order(a)
a[ordidx]
w[ordidx]

# we can use order to create a sorted data frame if we want
# in this first example, we create have an unsorted data frame (unsorted) which we
# then sort
unsorted<-data.frame(a,w)
sorteddf<-unsorted[ordidx,]
sorteddf

# alternatively, we can construct a SORTED dataframe
sorteddf<-data.frame(a[ordidx], w[ordidx])
sorteddf

# what happense if we have more indexes than values?
# as long as there's a value corresponding to the index, it works.
# in this case, we retrieve all seven values twice, first in order
# then in reverse order. We had twice the indexes as values, but
# values existed for every index.
a[c(1:7,7:1)]

# in this example, since there are only 7 values in the vector, 
# values 8-14 do not exist. R won't blow up, but it will return
# NA (missing value) for every index without a corresponding value.
a[1:14]

#' ------------------------------------------------------------------------- '#
#'             Accessing columns of dataframes (Attach and Detach)  
#' ------------------------------------------------------------------------- '#

# To access the column names of a dataframe, we need to provide the dataframe the 
# column belongs to.
# R looks for a variable using the search path. search() provides a list of 
# environments in the order in which the variables are looked for. 
# If we attach the list then explicitly specifying the column names is not 
# required. 

attach(obesity)
detach(obesity)
obesity <- obesity[order(Age,family_history_with_overweight),]

head(obesity)
obesity[order(Age,family_history_with_overweight),]

#' If we do not assign the output of the operation to a data structure, then 
#' the output will not be saved, but only displayed to the terminal 


library(dplyr)
arrange(obesity, Height)
head(obesity)

obesity <- arrange(obesity, Height)
head(obesity)

#' -------------------------------------------------------------------------- '#
#'                                 merge dataframes
#' -------------------------------------------------------------------------- '#

set.seed(61)

employee_id <- 1:10
employee_name <- c("Andrew", "Susan", "John", "Joe", "Jack",
                   "Jacob", "Mary", "Kate", "Jacqueline", "Ivy")
employee_salary <- round(rnorm(10, mean = 1500, sd = 200))
employee_age <- round(rnorm(10, mean = 50, sd = 8))
employee_position <- c("CTO", "CFO", "Administrative", rep("Technician", 7))


df_1 <- data.frame(id = employee_id[1:8], name = employee_name[1:8],
                   month_salary = employee_salary[1:8])
df_2 <- data.frame(id = employee_id[-5], name = employee_name[-5],
                   age = employee_age[-5], position = employee_position[-5])

df_1
df_2

merge(x= df_1, y= df_2, by = c("name"))

#' -------------------------------------------------------------------------- '#
#' Revisit the function we created to calculate discounted price of diamonds 
#' -------------------------------------------------------------------------- '#
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

#' -------------------------------------------------------------------------- '#
#' Row-wise operations require calling the function inside a loop. 
#' -------------------------------------------------------------------------- '#
diamonds1 <- diamonds[1:10,]

diamonds1$discountPrice <- discountedPrice(cut, price)
head(diamonds)
for (i in nrow(diamonds1)) {
    diamonds1[i,c("discountPrice")] <- discountedPrice(diamonds1[1,c("cut")], 
                                                       diamonds1[1,c("price")])
}

#' After executing the function what we are expecting is 0.85*price for good 
#' diamonds and 0.25*price for rest of the diamonds. Looking at the 5th row 
#' the original price is 335 for a good diamond. The discountedPrice should be 
#' 0.85*335 = 285. However, the value is 251 (which is 25% discounted value).

#' -------------------------------------------------------------------------- '#
#' dplyr provides an easy approach to perform the task 
#' -------------------------------------------------------------------------- '#
# Using dplyr %>% operation 
diamonds1 <- diamonds1 %>%
    rowwise %>% 
    mutate(discountPrice = discountedPrice(cut, price))
head(diamonds1)

# mutate() also provides a if_else operation 
diamonds1 <- diamonds1 %>%
    mutate(discountPrice = if_else(cut == "Good", 
                                   0.85*price, 
                                   0.75*price))
head(diamonds1)

# What if there are more than 2 categories: Such as "Good", "Fair", and something else 
diamonds1 <- diamonds1 %>%
    mutate(discountPrice = if_else(cut == "Good", 
                                   0.85*price, 
                                   if_else(cut == "Fair", 
                                           0.90*price, 
                                           0.75*price)
                                   ))
head(diamonds1)

# mutate() also provides a case_when operation 
# if "Fair" - price*.90, if "Good" - price*.85, if "Very Good" - price*.80
# if "Premium" - price*.75, if "Ideal" - price*.75,

diamonds1 <- diamonds1 %>%
    mutate(discountPrice = case_when(cut == "Fair" ~ 0.9*price,
                                     cut == "Good" ~ 0.85*price,
                                     cut == "Very Good" ~ 0.8*price,
                                     cut == "Premium" ~ 0.75*price,
                                     cut == "Ideal" ~ 0.75*price))
head(diamonds1)

# However, you can leave the default case as TRUE 
diamonds1 <- diamonds1 %>%
    mutate(discountPrice = case_when(cut == "Fair" ~ 0.9*price,
                                     cut == "Good" ~ 0.85*price,
                                     cut == "Very Good" ~ 0.8*price,
                                     TRUE ~ 0.75*price 
                                     ))
head(diamonds1)

# Row-wise operations can be run efficiently using dplyr pipe operations 
# The fifth row value of discounted price for a good diamond is correctly 285.

# Another solution is to use a pmap function. 
# pmap always returns a list. Hence, we need to convert it to the appropriate 
# vector to use it further 


diamonds$discountPrice <- as.double(
    pmap(list(diamonds$cut, diamonds$price), discountedPrice)
    )
head(diamonds)

# unlist also could convert the list into an atomic vector
diamonds$discountPrice <- unlist(
    pmap(list(diamonds$cut, diamonds$price), discountedPrice)
)
head(diamonds)
format(round(diamonds$discountPrice, 2), nsmall = 2)

#' -------------------------------------------------------------------------- '#
# pmap is an extended version of map. So, why cant we use map function instead?
#' -------------------------------------------------------------------------- '#
map(list(diamonds1$cut, diamonds1$price), discountedPrice)

myList <- list(c("Course1", 6), c("Course2", 7), c("Course3", 9))
map(myList, function(x) if(x[2] > 7) {
    paste("Course ", x[1], " is difficult") 
} else {
    paste("Course ", x[1], " is manageable") 
})

#' -------------------------------------------------------------------------- '#
#'                 Other common functions of dplyr    
#' -------------------------------------------------------------------------- '#
# dplyr is essentially used for data.frame 
# Each observation should be represented by one row 
# Each column should represent only one variable 
# The primary functions are: 
#' select: return a subset of the columns of a data.frame 
#' filter: extract a subset of rows from a dataframe based on logical conditions
#' arrange: reorder rows of a dataframe 
#' mutate: add new variables/columns or transform existing variables
#' summarise/summarize: generate summary statistics of different variables in the 
#' dataframe 

mtcars %>%
    # group_by(cyl) %>%
    summarise(qs = quantile(disp, c(0.25, 0.75)), prob = c(0.25, 0.75))

head( 
    diamonds %>% 
    select(cut, price)
)


col1 <- match("color", names(diamonds))
col1
col2 <- match("cut", names(diamonds))
col2

head(diamonds[, -c(col1,col2)])

select(diamonds, -c("color", "cut"))


head(
    filter(diamonds, cut == "Good") 
    %>%
        select(price)
)

# group by and summarize 
diamonds %>% 
    group_by(cut) %>% 
    summarize(mean_price = mean(price), count_records = length(cut))
#' -------------------------------------------------------------------------- '#
#' mutate is a powerful function from dplyr. We could create a new column from 
#' mutate function taking row-by-row values of a dataframe. Also, mutate has 
#' access to the complete vector to perform group operations from column vector 
#' -------------------------------------------------------------------------- '#

yearsOfExperience <- c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7, 3.9, 
                       4.0, 4.0, 4.1, 4.5, 4.9, 5.1, 5.3, 5.9, 6.0, 6.8, 7.1, 
                       7.9, 8.2, 8.7, 9.0, 9.5, 9.6, 10.3, 10.5)
annualSalary <- c(39343, 46205, 37731, 43525, 39891, 56642, 60150, 54445, 64445, 
                  57189, 63218, 55794, 56957, 57081, 61111, 67938, 66029, 83088, 
                  81363, 93940, 91738, 98273, 101302, 113812, 109431, 105582,
                  116969, 112635, 122391, 121872)

employees <- data.frame(yearsOfExperience = yearsOfExperience, 
                        annualSalary = annualSalary)
employees <- mutate(employees, perYearSalary = annualSalary/yearsofExperience)
employees <- mutate(employees, perYearMeanSalary = annualSalary/mean(yearsofExperience))
head(employees)

#' -------------------------------------------------------------------------- '#
#'                 Summarizing data - Exploratory Data Analysis 
#' -------------------------------------------------------------------------- '#

summary(employees)
# If we want to see a specific column summary 
quantile(employees$annualSalary)
# We can also change the quantile values 
quantile(employees$annualSalary, probs=c(0.1,0.3,0.5,0.7,0.9,1.0))
table(employees$yearsOfExperience)
table(diamonds$cut)
table(diamonds$cut, diamonds$color)
# Create a contingency table - cross-tab tables showing relationship between 
# two tables. (chi-square analysis - a test of relationship existence between them)
?xtabs()

## This is already a contingency table in array form.
DF <- as.data.frame(UCBAdmissions)
## Now 'DF' is a data frame with a grid of the factors and the counts
## in variable 'Freq'.
head(DF,10)
## Nice for taking margins ...
xtabs(Freq ~ Gender + Admit, DF)

# Additional usage of frequency tables 
## Create a nice display for the warp break data.
?warpbreaks
head(warpbreaks, 20)
warpbreaks$replicate <- rep_len(1:9, 54)
ftable(xtabs(breaks ~ wool + tension + replicate, data = warpbreaks))

#' -------------------------------------------------------------------------- '#
#'                 EDA - Handling NA values  
#' -------------------------------------------------------------------------- '#

randomNumbers <- round(100*runif(10, 2.0, 7),0)
randomNumbers
head(obesity[randomNumbers,], 10) 

for (i in 1:10) {
    j <- 1 
    k <- 0
    while (j < round(17*runif(1,k,1), 0)) {
        obesity[randomNumbers[i], j] <- NA
        j <- i + j 
        if (k < 0.9) {
            k <- k + 0.1 
        }
    }
}

# Check if we have created any NA values 
head(obesity[randomNumbers,], 10) 

# IF we have NA values in a column, we cannot perform column operations. 
mean(obesity$Age)

# We can check if there are any NA values in the column
any(is.na(obesity$Age))
any(is.na(obesity$NObeyesdad))

# We have to remove the na records to perform the sum
mean(obesity$Age, na.rm = TRUE)

# How many NA values are there in the column? 
sum(is.na(obesity$SMOKE))

#' -------------------------------------------------------------------------- '#
#'                 Some common data transformation functions   
#' -------------------------------------------------------------------------- '#
x <- -5 # scalar
x <- abs(x) # absolute value 
x
x <- sqrt(x) # square root 
x
ceiling(x) # Rounding to the next closest integer value  
floor(x) # Rounding to the previous closest integer value  
round(x, digits = 2) # Rounding to the closest 2nd decimal 
signif(x, digits = 3)
cos(x) # cosine value of x 
sin(x) # sine value of x 
log(x) # natural logarithm 
log10(x) # log base 10
exp(x)




