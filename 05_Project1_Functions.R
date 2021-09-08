#' Author: Naga Vemprala 
#' Date Created: 09/06/2021 
#' Project 01 - Tests knowledge about creating functions in R 
#' Due on: 09/21/2021 
#' Maximum points: 100 
#' 10 points corresponds to 1% of course grade 
#' 

#' 1. Provide the steps to load the dataset into R and display the 
#' first 6 rows. Also, display the columns and their descriptions (10 points)
#' File name: bank-full.csv


# Q1. Develop a flow chart to strategize the customer contacts you make could 
# bring in more number of customers subscribing to a term deposit 
# The flow chart should include a threshold value of number of customers who 
# could take certain threshold of term deposits based on your intuition.
# Create a alternate strategy of flow, if the threshold is not met. 
# Submit this flow chart as a separate word document with the honors pledge on 
# first page (30 points)

#' Q2. Develop a strategy in combination of three columns to identify prospective 
#' customers. Return the customers dataframe that meets minimum threshold. 
#' If a customer is contacted twice in the prior campaigns then campaigns hold 
#' a value of 2. (if the minimum threshold you are selecting for this scenario 
#' is 3, then this record with campaign = 2 should not be returned). Also, 
#' return the rows that shows the customer is not having any "term-deposit" yet. 
#' (Variable y should be "no"). (30 points)

# For simplicity first part assumes the strategy is to choose a fixed criteria 
# such as job, marital, and education, minThreshold = 4
# There are multiple possible selection criteria other than these three. In the 
# next question, make the selection criteria more generalizable. 

targetCustomers <- function(df, job, marital, education, minThreshold=4) {
    # Include your logic here. 
}

df1 <- targetCustomers(bankFull, "management", "married", "secondary", 2)

#' Q3. The output of question 3 should be similar to the output of question 2. 
#' However, this time, the criteria passed as input can be generalizable in any 
#' order and upto a maximum of 3 possible selections. e.g. If the criteria1 is 
#' passed as job with a value of "management", education with a value of "secondary"
#' and marital with a value of "married" are passed, the output should be exactly 
#' same as running targetCustomers(<input dataframe>, "management", "married", 
#' "secondary", 2) (Variable y should be "no"). (25 points)
#' Hint: You can pass a list for each criteria name. The list hold the column 
#' name of the dataset and the value that you want to check against with. 
#' If you pass less than 3 arguments as criteria, still the function should be 
#' able to handle (5 points)
#' 
targetCustomersV1 <- function(df, 
                              criteria1, 
                              criteria2, 
                              criteria3,
                              minThreshold=4) {
    # Include your logic 
}

df1 <- targetCustomersV1(bankFull, criteria1 = list(param1 = "job", param2 = "management"), 
                         criteria2 = list(param1 = "marital", param2 = "married"), 
                         criteria3 = list(param1 = "education", param2 = "secondary")
                         , 2)




