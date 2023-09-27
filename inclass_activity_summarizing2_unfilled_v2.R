##########################################
##### POLI 281: 
##### In Class Summarizing Data Activity -- Week 4
##########################################


# Clear your global environment
rm(list=ls())


###################################### 
############## OVERVIEW ############## 
###################################### 

# In this activity, we will be working with the ANES data once again. Now it will be important for you to use the codebook posted on Sakai/Canvas to complete the following tasks.

# We will work on summarizing data that is less than perfect - before we start to summarize data we will need to recode some values to NA.  

# Let's get started!

# First, set your working directory and load in your data!

setwd("/Users/robin/Documents/R")

data <- read.csv("anes2020_selectedvars.csv", stringsAsFactors = FALSE)

###################################### 
############### Part 1 ############### 
####### Recoding Missing Values ######
###################################### 

# 1) We have seven variables we are working with. Take a look at the codebook, and for each variable figure out which values need to be recoded as NA. The most common will be any answer option described as "refused", "don't know", or "inapplicable". But there may be others for some variables.

# For each variable, write code to change those values to NA. After you do so, run the summary command on each variable to make sure it worked. 

# i) Recode NAs in the age variable (if needed) 
data$age[data$age == -9] <- NA
summary(data$age) # fixed!

# ii) Recode NAs in the campaign_interest variable (if needed)
data$campaign_interest[data$campaign_interest < 1 & data$campaign_interest > 3] <- NA
summary(data$campaign_interest) # fixed!

# iii) Recode NAs in the vote_primary variable (if needed)
data$vote_primary[data$vote_primary < 1] <- NA
summary(data$vote_primary) # fixed!

# iv) Recode NAs in the vote_pres variable (if needed)
data$vote_pres[data$vote_pres < 1] <- NA
summary(data$vote_pres) # fixed!

# v) Recode NAs in the right_track variable (if needed)
data$right_track[data$right_track < 1] <- NA
summary(data$right_track) # fixed!

# vi) Recode NAs in the ideology variable (if needed)
data$ideology[data$ideology < 1 | data$ideology > 7] <- NA
summary(data$ideology) # fixed!

# vii) Recode NAs in the govt_corrupt variable (if needed)
data$govt_corrupt[data$govt_corrupt < 1] <- NA
summary(data$govt_corrupt) # fixed!

# 3) Now, let's summarize the variables we just cleaned up.

# i) First, what's the average age in the dataset?
mean(data$age, na.rm = TRUE)

# ii) What's the average ideology in the dataset? Looking at the codebook, how would you interpret this number?
mean(data$ideology, na.rm = TRUE)

# 4) You're interested in how ideology varies by age. Calculate the average ideology for people age 18-29, and compare it to average ideology for people who are over the age of 50. Based on those numbers, are older people more or less liberal than younger people?
mean(data$ideology[data$age <= 29 & data$age >= 18], na.rm = TRUE) < mean(data$ideology[data$age >= 50], na.rm = TRUE)
# this means older people are more conservative as given by higher ideology rank
