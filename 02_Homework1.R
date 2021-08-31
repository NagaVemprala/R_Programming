#' Author: Naga Vemprala 
#' Date Created: 08/30/2021 
#' Homework 01 - Tests R datastructures knowledge 
#' Due on: 09/06/2021 

#' Q1. Create two vectors yearsOfExperience	and annualSalary, using the below values: 

#' 1.1	39343.00
#' 1.3	46205.00
#' 1.5	37731.00
#' 2.0	43525.00
#' 2.2	39891.00
#' 2.9	56642.00
#' 3.0	60150.00
#' 3.2	54445.00
#' 3.2	64445.00
#' 3.7	57189.00
#' 3.9	63218.00
#' 4.0	55794.00
#' 4.0	56957.00
#' 4.1	57081.00
#' 4.5	61111.00
#' 4.9	67938.00
#' 5.1	66029.00
#' 5.3	83088.00
#' 5.9	81363.00
#' 6.0	93940.00
#' 6.8	91738.00
#' 7.1	98273.00
#' 7.9	101302.00
#' 8.2	113812.00
#' 8.7	109431.00
#' 9.0	105582.00
#' 9.5	116969.00
#' 9.6	112635.00
#' 10.3	122391.00
#' 10.5	121872.00

#' Q2. Take a screenshot of the environment variables created.
#' (Include the screenshot in the word document you upload to moodle)
#' Please describe what is the view in which you can see these variables. 
#' 

#' Q3. Print type of each vector
#' 
#' Q4. Create a dataframe as employees using the same two vectors created in Q1 and 
#' name the columns of the dataframe as yearsOfExperience	and annualSalary

#' Q5. Create a new column perYearExperience to the dataframe. 
#' The value for this column should be annualSalary/yearsOfExperience
#' 

#' Q6. Create a logical vector extractRows of five elements with all the element values as TRUE 
#' 

#' Q7. Extract first five rows of employees dataframe using the logical vector extractRows
#' Compare and validate the output using head function. Provide a screenshot in the word document. 

#' Q8. Create an integer vector of values 1 to 30 using a sequence operator and name it as filterCriteria
#' 

#' Q9. Create a logical vector of 30 elements with every 5th element as TRUE value and rest of the elements as FALSE. 
#' Name the vector the same as filterCriteria 
#' (Hint) filterCriteria can be created with a logical operation such as filterCriteria <- filterCriteria < 8 
#' With the above command, first seven elements are TRUE and rest all are FALSE. Use such an arithmatic operation 
#' to create filterCriteria. 
#' e.g: First 6 elements of the newly created filterCriteria vector should look like 
#' filterCriteria : FALSE FALSE FALSE FALSE TRUE FALSE 
#' 

#' Q10. Create a new dataframe filteredEmployees from the original dataframe employees using the logical vector
#' filterCriteria created in Q9. 

#' Q11. Display the first 6 records of the dataframe filteredEmployees using head function 
#' 
#' 
#' Q12. Validate that the first record of filteredEmployees dataframe should be the fifth record of the original 
#' dataframe employees. It should be same as the record extracted using the filter criteria 
#' filteredEmployees[filteredEmployees$yearsOfExperience == 2.2,]
#' 

#' Q13. Display the structure of the prebuilt dataset diamonds 
#' 

#' Q14. Display the first 10 records of the diamonds dataset using head() function and override the parameters 
#' Provide explanation for what do I mean by overriding default parameters. 
#' Hint: Look for online help provided by RStudio 
#'  

#' Q15. Create dataframe goodDiamonds from diamonds dataframe with each diamond cut being "Good"
#' 

#' Q16. display unique values of cut colums of diamonds dataframe 
#'

#' Q17. Assume that diamonds is a sales dataset. You would like to give discount as follow: 
#' 10%, 15%, 20% discount on price of Fair, Good, Very Good diamonds and 25% on Premium & Ideal diamonds 
#' Create a new dataframe column with the updated price 

#' Q18. Group by diamonds cut and display the count. Output should look like below: 
#' cut       countDiamonds
#' 
#' 1 Fair               1610
#' 2 Good               4906
#' 3 Very Good         12082
#' 4 Premium           13791
#' 5 Ideal             21551 
 
#' Q19. Only display data from diamonds that have a cut value of Fair or Good and a price at or under $600
#' 

#' Q20. Display the dimensions of preloaded mtcars dataset 
#' 

#' Q21. Use preloaded mtcars dataset and create a character vector of cars whose mileage is 21.0
#' 

#' Q22. Create a factor variable factorCyl using the cyl column of mtcars 
#' with labels as "Four-Cyl", "Six-Cyl", "Eight-Cyl"
#' 

#' Q23. Create a factor variable factorCyl using the cyl column of mtcars 
#' with labels as "Four-Cyl", "Six-Cyl", "Eight-Cyl". Make the factor of order type 

#' Q24. Display unique values of new column factorCyl and write what you observe 
#' 

#' Q25. Use subset function to extract automatic cars into autoCars and manual cars into manualCars dataframe
#' Use the am column of mtcars dataset to separate the records  
#' 

