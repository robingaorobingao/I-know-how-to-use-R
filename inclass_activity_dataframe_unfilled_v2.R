##########################################
##### POLI 281: Voter Registration Activity
##### In Class Data Frames Activity -- Week 3, DAY 1
##########################################


# Clear your global environment
rm(list=ls())


###################################### 
############## OVERVIEW ############## 
###################################### 

# In this activity, you will practice working with datasets, using the AfroBarometer data we saw in class. 


###################################################
############## AFROBAROMETER DATA #################
###################################################


# 1) First, programatically load in the afrobarometer data. Don't forget to set your working directory! Call the data "afbarom_data"
setwd("/Users/robin/Documents/R")
afbarom_data <- read.csv("afbarom_data.csv", stringsAsFactors = TRUE)

# 2) Create a new data set called "ab" which ONLY contains three variables -- COUNTRY, URBRUR, and age.
# In this data set, each observation (row) is a survey respondent. COUNTRY  represents the country they are from, and URBRUR represents the type of place they live - peri urban, rural, etc. "age" is...age. Here, the first two variables are saved as "factors" - this is a different data type, don't worry about it too much for now!
ab <- afbarom_data[, c("COUNTRY", "URBRUR", "age")]

# 3) What age is the oldest person in the dataset? (Hint: max())
max(ab$age)

# 4) Write code to tell you: what country is the 1500th respondent from?
ab[1500, "COUNTRY"]

# 5) You are asked to isolate all of the data only for "Rural" respondents who are from Uganda. Save this in a new dataframe called uganda_rural

# Hint - you are going to need to put multiple conditions together inside the [] here using the "&" symbol. 
uganda_rural <- ab[ab$COUNTRY == "Uganda" & ab$URBRUR == "Rural",]

# 6) Write code to figure out the answer to the following: on average, are rural or urban respondents in Afrobarometer older?
mean(ab$age[ab$URBRUR == "Urban"]) < mean(ab$age[ab$URBRUR == "Rural"])

# 7) Now, figure out the same thing, but just for respondents in Zambia: 
mean(ab$age[ab$COUNTRY == "Zambia" & ab$URBRUR == "Urban"]) < mean(ab$age[ab$COUNTRY == "Zambia" & ab$URBRUR == "Rural"])

# 8) You just found out that all respondents in Morocco who reported being "Rural" were miscoded. Really, they should be listed as "Peri-Urban". Fix this in the ab dataset.
# ab$COUNTRY[ab$COUNTRY == "Morocco" & ab$URBRUR == "Rural"] <- "Peri-Urban"

#### BONUS ACTIVITY ###

# 9) In the original afbarom_data object you imported, there are a bunch of additional variables. Let's focus on the variable called Q4A. 
#From looking at a list of questions the survey asked (called a CODEBOOK), I know that Question 4A was:
# Question 4A: In general, how would you describe the present economic condition of this country?
# If you look at the variable, you'll see it is NUMERIC. Here, the codebook tells us what each numeric answer means:
#  1=Very bad, 2=Fairly bad, 3=Neither good nor bad, 4=Fairly good, 5=Very good. "8" and "9" are oddballs -- ignore them for now, and we'll talk about them next week. 

# Your task is to write code to figure out answers to the following questions:

# a) On average, what percent of survey respondents said they thought the present economic condition was either "Fairly good" or "Very good"?
mean(afbarom_data$Q4A == 4 | afbarom_data$Q4A == 5)

# b) Is this percentage higher or lower if we just look at Uganda? Kenya? Zimbabwe?


# HINTS: You'll want to use conditional statements here. You'll also want to review Booleans, focusing on what it means to take the mean of a Boolean vector. 

