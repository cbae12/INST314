#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

# Load packages
library(tidyselect)
library(readr)
library(dplyr)
library(ggplot2)

# Read in data
myData <- read_csv(file="hw1_dataset_for_Jason Bae.csv")

temps = myData$`Temperature(F)`

# Problem 1 - mean of the temperature column
mean(temps)
# 62.60271 ~ 62.60

# Problem 2 - median of the temperature column
median(temps)
# 64.9

# first 200 values
my_sample = temps[1:200]
# Problem 3 - sample mean
mean(my_sample)
# 63.722 ~ 63.72

# Problem 4 - sample median
median(my_sample)
# 66.2

# t.test function
# Problem 5 - 90% confidence interval for the mean temperature
t.test(my_sample, conf.level = .9)$"conf.int"
# 61.60317 ~ 61.60 / 65.84083 ~ 65.84

# bootstrap method w/ 10,000 resamples
# Problem 6 - 90% confidence interval for the mean temperature
B = 10000
bootstrap_means = rep(NA,B)
for (i in 1:B) {
  new_sample = sample(my_sample,replace = TRUE)
  bootstrap_means[i] = mean(new_sample)
}
quantile(bootstrap_means,.05)
quantile(bootstrap_means,.95)

# Problem 7 - 90% confidence interval for the median temperature
bootstrap_medians = rep(NA,B)
for (i in 1:B) {
  new_sample = sample(my_sample,replace = TRUE)
  bootstrap_medians[i] = median(new_sample)
}
quantile(bootstrap_medians,.05)
quantile(bootstrap_medians,.95)
