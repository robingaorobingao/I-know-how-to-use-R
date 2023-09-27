##########################################
##### POLI 281: Varieties of Democracy Activity
##### In Class Summarizing Data Activity -- Week 3
##########################################

###################################### 
############## OVERVIEW ############## 
###################################### 

# In this activity, you will be working on summarizing data and using your subsetting skills - both using subset() and square brackets []

# For this activity, we will be using data from the Varieties of Democracy (or V Dem) project, which provides a dataset regarding democracy and a series of important background characteristics about countries across the globe.

# This data set has 7 variables you will be working with:

### country_name - the name of the country
### v2x_libdem - an index of liberal democracy - 0-1 where 1 is high on this index
### v2fsuffrage - percentage of female adults over the minimum voting age who have the right to vote
### e_migdppc - GDP per capita
### e_mipopula - population in thousands
### e_pt_coup - whether or not a coup d'etat occured that year in the country (0 is no, 1 is yes)


###################################### 
############### Part 1 ############### 
### Loading and Examining our Data ###
###################################### 

# Clear your global environment
rm(list=ls())

# 1) Set your working directory and load in the data. Call the dataframe "vdem"
setwd("/Users/robin/Documents/R")
vdem <- read.csv("vdem_activity.csv", stringsAsFactors = TRUE)

# 2A) Print a summary() of your data set and take a look at the different variables.
summary(vdem)

# 2B) Using the summary() function, summarize just the coups variable. Based on this information, what is the maximum amount of coups that a country experienced in a given year?
summary(vdem$e_pt_coup) # 2

# Now summarize the years variable. What years are covered in our data set?
summary(vdem$year) # 1981-2000

###################################### 
############### Part 2 ############### 
######## Summarizing our Data ########
###################################### 

# In this section, we are going to answer some substantive research questions by summarizing the dataset in different ways. 

# 1) To help us look at different points in time, start by creating two data sub sets - one for observations prior to 1990, and one for observations for the years 1990 and after. Use the subset() command, create these two data frames. Call the first early_years and the second late_years
early_years <- subset(vdem, year < 1990)
late_years <- subset(vdem, year >= 1990)

# 2) Great! The first variable we are interested in is is women's suffrage. Calculate the mean for this variable for our full dataset, early_years, and late years. Look at the results: does womens' suffrage go up over time?
mean(vdem$v2fsuffrage) # 86%
mean(early_years$v2fsuffrage) # 80%
mean(late_years$v2fsuffrage) # 89%

# 3) Now let's look at the minimum and maximum levels of womens' suffrage in the early vs. late years. 
# To do this, find the minimum and maximum values of the women's suffrage variable in early years & in late years.
summary(early_years$v2fsuffrage)
summary(late_years$v2fsuffrage)

# Take a look at what you find: is this information more or less useful than looking at the average values?
# less useful, doesn't show the change in women's suffrage rates

# 4) Let's compare different ways of summarizing data. 
# a) Use the summary() command to look at the e_pt_coup variable
# b) Use the table() command to look at the e_pt_coup variable.
# Which one do you feel like gives you a better sense for how many coups there are? Why?
summary(vdem$e_pt_coup)
table(vdem$e_pt_coup)
# the table has more info — lists how many countries have had x number of coups instead of just giving the maximum number with no country name

# 5) Now, make a "two-way" table where you look at the number of coups in each year. That is, your table() command will include two variables: "e_pt_coup" and "year". Based on your table, answer the following: a) Were there any years with no coups? b) What year had the most coups? 
table(vdem$e_pt_coup, vdem$year)

##### BONUS EXERCISES
# These are designed to help you practice taking a more general question, and figuring out what code you need to answer it. 
# You may also need to refer back to the codebook at the top of this R script. 

# I) What percent of rows in the dataset have at least 1 coup?


# II) What was the lowest GDP per capita in the years prior to 1990?



# III) What country had that lowest level of GDP? (Hint: write code to find & display that country in the console.)


# IV) What was Ghana's GDP per capita in 1981? 1990? 2000? (Make sure you write code to produce this -- don't just look at the dataframe!)




# V) What was Ghana's GDP growth rate (in percent terms) between 1981 and 1990? Between 1990 and 2000? ()


# VI) How many coups did Ghana have between 1981 and 2000? How many of these were prior to 1990? (Hint: you might want to start by making a dataset that just has Ghana)