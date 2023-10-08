##########################################
##### POLI 281: 
##### In Class Tidyverse Activity -- Week 5
##########################################


###################################### 
############## OVERVIEW ############## 
###################################### 

# In this class, we are going to be working with some data from a research  project conducted by Frank Baumgartner, Derek Epp, and Kelsey Shoub.  (Baumgartner is on the faculty here at UNC. Maybe some of you took a class  with him. Epp and Shoub were graduate students here.) 

#These researchers  examined a dataset that had information on traffic stops in Raleigh, North  Carolina. One thing they were interested in was racial disparities in terms of who gets searched, once they have been pulled over for a traffic violation.

# The unit of observation in this dataset is a single traffic stop

# The variables in this data set are as follows:
### 1) stopid -- a unique identifier for each traffic stop
### 2) agency -- what police force conducted the stop (It's always Raleigh)
### 3) purpose -- purpose for the stop. There are 9 purposes, like speeding violations, running a stop sign, etc.
### 4) race -- race of the individual being pulled over
### 5) age -- age of the person being pulled over
### 6) searchoccur -- did a search occur? (0 == No, 1 == Yes)
### 7-9) Month, day, and year -- timing of the stop
### 10) "In Figure 3" - don't worry about this for now


# In this activity, we are going to be summarizing this data using the tidyverse.  In a few days, we'll end up revisiting this activity and the code you write to make some nice data visualizations


##############################################
########## Part 1: Some Set Up ##############
##############################################

# 0) Write code to 1) clear the decks, and 2) load the dplyr package into your active R library so that you can use dplyr commands. 
rm(list=ls())
library(tidyverse)

# 1) Set your working directory and read in the data. Save the data in an object called "stops"

# set working directory
setwd("/Users/robin/Documents/R")

# read in data
stops <- read.csv("stops-1.csv")

# 2) Currently, the variable "searchoccur" is an integer type variable. Make this variable into a numeric variable (look at the sample code from Q9 of Assignment 1.)
stops$searchoccur <- as.numeric(stops$searchoccur)

##################################################################
############ Part 2: Summarizing Stop Types by Race #############
##################################################################

# 3) Let's begin by looking at whether the probability a driver is searched varies depending on the race of the driver.  Our goal: create two new data frames called "white_stops" and "black_stops". Each of these dataframes should, for each type of stop that could occur (i.e. the stop's purpose), how likely it was that a driver was searched.  We'll do this separately for white drivers and black drivers.

# Step 1 -- create a new object called white_stops which takes the stops data and filters only for "White" drivers. Do the same for Black drivers, and called this black_stops.
white_stops <- filter(stops, race == "White")
black_stops <- filter(stops, race == "Black")

# Step 2 -- building off that code, now add a line which groups the data by the purpose of the stop. Do this for each of those two objects -- copy-paste your code from Step 1, then write the new line.
white_stops <- stops %>%
  filter(race == "White") %>%
  group_by(purpose)
black_stops <- stops %>%
  filter(race == "Black") %>%
  group_by(purpose)

# Step 3 -- using the summarize() command, create a new variable that shows the probability a driver was searched. Call this variable white_pct in your white_stops dataset, and black_pct in the black_stops dataset.  
#Hint: When writing you summarize() command, you'll want to keep in mind what happens when you take the mean of a bunch of 0s and 1s (similar to a Boolean). 
white_stops <- stops %>%
  filter(race == "White") %>%
  group_by(purpose) %>%
  summarise(white_pct = mean(searchoccur, na.rm = T))
black_stops <- stops %>%
  filter(race == "Black") %>%
  group_by(purpose) %>%
  summarise(black_pct = mean(searchoccur, na.rm = T))

# Check out these two new dataframes that you created. How do they look?
View(white_stops)
View(black_stops)

# 4) Great. Now, run the line of code below. Take a look at the result, and see if you can figure out: what did it do? (try looking at the help file for cbind if you get stuck)
combined <- cbind(white_stops, black_stops[,2])

# 5) Now, let's stop and make sure you understand what you just did. Take a look at the dataset called "combined" and answer the following questions -- you won't be writing code here, just look at the data:

# a) What percent of white drivers were searched when they were pulled over for a seatbelt violation?
# 1%

# b) Who was more likely to be searched when they were stopped for a seatbelt violation: white or black drivers?
# black drivers at 5%

# c) What type of traffic stop was most likely to result in a search? Did this differ by the driver's race?
# driving impaired; search more likely for black drivers

# 6) Now, let's create a new variable that shows how much more (or less) frequently black drivers (compared to white) were searched for each type of stop. To do this, make a new variable called "ratio" that shows the ratio of the probability of stops of Black vs. white drivers in each stop category.
# Hint: You need to divide black_pct by white_pct.
# You can use dplyr commands to do this, but the easiest way is probably using normal base R.
ratio <- combined$black_pct / combined$white_pct

# You're done! 

##################################################################
############ Part 3: Summarizing Stop by Year & Race #############
##################################################################

# 7) Now we are going to summarize our stops data by year. Instead of being guided step-by-step, you will now need to think about the steps on your own.
# Goal: Create a new data frame called by_year. Each of the following should suggest a line of code you will need to write to create by_year:
# i) by_year should only include data from drivers who are identified as Black or White, not Other. 
# ii) by_year should show the probability that a search occurred, similar to the previous part. 
# iii) But, instead of breaking down the probability of a search by the purpose of the stop (like in the previous part), we want to break it down by race and by year at the same time. 
by_year <- stops %>%
  filter(race == "Black" | race == "White") %>%
  group_by(year, race) %>%
  summarise(searchprob = mean(searchoccur, na.rm = T))

# 8) What are the dimensions of this new tibble? (remember, tibbles are tidyverse's version of the data frame)
dim(by_year)

##################################################################
############ Part 3: Summarizing Stops by Officer #################
##################################################################

# 9) Now we are interested in identifying if any specific officers  exhibit patterns in who they decide to stop, based on driver race. First, let's summarize our data:

# Step 1: Create an object called by_officer_w. To do this, you will need to:
# i) filter to just get rows where InFigure3  == TRUE and race=="White"
# ii) find the probability a search occurred, broken down by the ID number of the officer. (hint: this will take 2 lines of code)
by_officer_w <- stops %>%
  filter(InFigure3 == TRUE & race == "White") %>%
  group_by(officerid) %>%
  summarise(pct_w = mean(searchoccur, na.rm = T))

# Step 2: Now make an object called by_officer_b that does the same but looks at Black drivers instead of white drivers. 
by_officer_b <- stops %>%
  filter(InFigure3 == TRUE & race == "Black") %>%
  group_by(officerid) %>%
  summarise(pct_b = mean(searchoccur, na.rm = T))

# 10) Now, let's once again combine these two data frames, similar to how we proceeded in Part 1. We want to create a new dataframe called
# combined2, which has three variables: officerid, pct_w, and pct_b
# Hint: use cbind()
combined2 <- cbind(by_officer_b, by_officer_w[,2])

# 12) Change combined2 so that you ONLY have observations where
# either pct_w OR pct_b DOES NOT equal zero. Resave this as combined3
combined3 <- filter(combined2, pct_w != 0 | pct_b != 0)

# 13) Finally, add a new variable to your combined3 dataset (note - this would no longer be summarize because you are ADDING a new variable) called "discrepant". This will be a Boolean variable. It should:
# i) Be set to TRUE if the percentage of stops of white drivers divided by the percentage of black drivers is greater than 2 
# ii) should == TRUE if the percentage of stops of black drivers divided by the percentage of stops of white drivers is > 2.



# Take a look at your data. What is this discrepant variable capturing?




#it is a logical variable that is TRUE whenever it seems the officer arrests white OR Black drivers far more than the other category
