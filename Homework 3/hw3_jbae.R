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

# Standard Normal Distribution
# Problem 1 - threshold for the bottom 9%
qnorm(.09,mean=0,sd=1)
# -1.340755 ~ -1.34

# Problem 2 - threshold for the top 7%
qnorm(.93,mean=0,sd=1)
# 1.475791 ~ 1.47

# Problem 3 - threshold for the middle 94% around the mean
qnorm(.03,mean=0,sd=1)
# -1.880794 ~ -1.88

# Problem 4 - threshold for 8% on the two tails
qnorm(.04,mean=0,sd=1)
# -1.750686 ~ -1.75

# Problem 5 - area under the curve to the left of z=1.7
pnorm(1.7)
# 0.9554345 ~ 0.95

# Problem 6 - area under the curve to the right of z=2.1
1-pnorm(2.1)
# 0.01786442 ~ 0.01

# Problem 7 - area to the left of z= -1.7
pnorm(-1.7)
# 0.04456546 ~ 0.04

# Problem 8 - area outside the region between z= -1.3 and z= +1.3
2*pnorm(-1.3)
# 0.193601 ~ 0.19

# t distribution w/ df=15
# Problem 9 -  threshold for the bottom 9%
qt(.09,df=15)
# -1.406344 ~ -1.40


# Problem 10 - threshold for the top 7%
qt(.93,df=15)
# 1.558331 ~ 1.55

# Problem 11 - threshold for the middle 94% around the mean
qt(.03,df=15)
# -2.034289 ~ -2.03

# Problem 12 - threshold for 8% on the two tails
qt(.04,df=15)
# -1.877739 ~ -1.87

# Problem 13 - area under the curve to the left of t=1.7
pt(1.7,df=15)
# 0.9451169 ~ 0.94

# Problem 14 - area under the curve to the right of t=2.1
1 - pt(2.1,df=15)
# 0.02652763 ~ 0.02

# Problem 15 - area to the left of t= -1.7
pt(-1.7,df=15)
# 0.05488311 ~ 0.05

# Problem 16 - area outside the region between t=-1.3 and t=+1.3
2*pt(-1.3,df=15)
# 0.2132233 ~ 0.21

# t distribution w/ df=1500
# Problem 17 - threshold for the bottom 9%
qt(.09,df=1500)
# -1.34138 ~ -1.34

# Problem 18 - area under the curve to the right of t=2.1
1-pt(2.1,df=1500)
# 0.01794774 ~ 0.01

# dataset of car accidents
# Problem 19 - mean of the Temperature column
temps=myData$`Temperature(F)`
mean(temps)
# 62.60271 ~ 62.6

# first 20 rows
this_sample=temps[1:20]
# Problem 20 - sample mean
mean(this_sample)
# 54.53

# Problem 21 - 95% confidence interval for the mean
t.test(this_sample,conf.level = .95)$"conf.int"
# 43.87437 ~ 43.87 / 65.18563 ~ 65.18

# Problem 22 - 99% confidence interval
t.test(this_sample,conf.level = .99)$"conf.int"
# 39.96493 ~ 39.96 / 69.09507 ~ 69.09

# Problem 23 - 90% confidence interval
t.test(this_sample,conf.level = .9)$"conf.int"
# 45.72695 ~ 45.72 / 63.33305 ~ 63.33

# first 200 rows
this_sample=temps[1:200]
# Problem 24 - sample mean
mean(this_sample)
# 63.722 ~ 63.72

# Problem 25 - 95% confidence interval
t.test(this_sample,conf.level = .95)$"conf.int"
# 61.19364 ~ 61.19 / 66.25036 ~ 66.25

