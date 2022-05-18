#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

# Load packages
library(readr)
library(dplyr)

# Read in data
myData <- read_csv(file="hw1_dataset_for_Jason Bae.csv")
temp = myData$`Temperature(F)`

#Problem 1 - Size of the dataset
num_temp = nrow(as.data.frame(temp))
num_temp
#20000

#Problem 2 - Mean
temp_mean = mean(temp)
round(temp_mean, digits = 2)
#62.60

#Problem 3 - Standard Deviation
temp_sd = sd(temp)
round(temp_sd, digits = 2)
#18.63

#Problem 4 - Maximum Value
round(max(temp), digits = 2)
#112

#Problem 5 - Minimum Value
round(min(temp), digits = 2)
#-20.9

#Problem 6 - Z-score of the largest value
z_score = (temp - temp_mean)/sd(temp)
round(max(z_score), digits = 2)
#2.65

#Problem 7 - Z-score of the smallest value
round(min(z_score), digits = 2)
#-4.48

#Problem 8 - Datapoints that are less than mean 
#+ sd and greater than mean - sd
one_sd = temp[(temp < temp_mean + temp_sd) & (temp > temp_mean - temp_sd)]
num_one_sd = nrow(as.data.frame(one_sd))
round(num_one_sd, digits = 2)
#13593

#Problem 9 - Proportion of datapoints that are within one standard
#deviation away from the mean
prop_temp = (num_one_sd/num_temp) * 100
round(prop_temp, digits = 2)
#67.97%

#Problem 10 - proportion of datapoints that are within two standard 
#deviations away from the mean
two_sd = temp[(temp < temp_mean + 2*temp_sd) | (temp > temp_mean - 2*temp_sd)]
num_two_sd = nrow(as.data.frame(two_sd))
prop_two_temp = (num_two_sd/num_temp) * 100
round(prop_two_temp, digits = 2)
#100%
