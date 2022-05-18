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

#Problem 1 - Top 2 counties that occur most frequently

temp = sort(table(myData$County),decreasing=TRUE)
temp[1:2]

#Problem 2 - In State of MD, Top 2 counties that occur most frequently
myData %>%
  group_by(County) %>%
  filter(State=="MD") %>%
  summarize(freq=sort(table(County),decreasing = TRUE)) %>%
  arrange(-freq) %>%
  print(n=2)

#Problem 3 - Top 2 States that occur most frequently
myData %>%
  group_by(State) %>%
  summarize(freq=sort(table(State))) %>%
  arrange(-freq) %>%
  print(n=2)

#Problem 4 - Top 3 States in terms of proportion of severity = 4
D1=myData %>%
  group_by(State) %>%
  filter(Severity==4) %>%
  summarize(Severity=sum(table(State)*4))

D2=D1 %>%
  group_by(State) %>%
  mutate(perc=100*Severity/sum(D1$Severity)) %>%
  arrange(-perc) %>%
  print(n=3)

#Problem 5 - Bottom 4 in terms of avg. temp.
D3=myData %>%
  group_by(State) %>%
  mutate(num=1) %>%
  summarize_at(c("Temperature(F)","num"),sum)

D4=D3 %>%
  group_by(State) %>%
  summarize(avg_temp=sum(`Temperature(F)`/num)) %>%
  arrange(avg_temp)%>%
  print(n=4)
