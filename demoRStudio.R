#' Author: Naga Vemprala 
#' Date Created: 08/25/2021 
#' This R Script demonstrates how RStudio displays great visualizations in the Plots tab of "Navigation Window"
#' The R built in datasets are used in this code 

library(tidyverse) 

# Check the size of the dataset 
dim(diamonds)

# If you want to know the structure of the table .. go for it!
str(diamonds)

# View the first 6 records of a built in dataset "diamonds"
head(diamonds)

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + geom_point()

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)
