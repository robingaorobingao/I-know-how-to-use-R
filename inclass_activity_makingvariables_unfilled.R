##########################################
##### POLI 281: 
##### In Class Data Activity -- Week 4, Day 2
##########################################


# Clear your global environment
rm(list=ls())


###################################### 
############## OVERVIEW ############## 
###################################### 

# In this activity, we will be working with the ANES data once again. Now it will be important for you to use the codebook posted on Sakai/Canvas to complete the following tasks.

# We will work on taking the data we got from the survey and creating new variables that allow us to do more interesting anlaysis.  

# Let's get started!

# First, set your working directory and load in your data!

setwd("/Users/robin/Documents/R")

data <- read.csv("anes2020_selectedvars.csv", stringsAsFactors = FALSE)


###################################### 
############### Part 1 ############### 
####### Recoding Missing Values ######
###################################### 

# 1) Next, open up your group work from last time, and paste below the code you wrote to recode all the odd-ball values to NA. Make sure to actually run the code!
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

# 2) Let's look at the vote_pres variable. 

# i) First, use the table() command to look at how many people voted for each candidate -- you'll need to look at the codebook to match each number to a candidate.  
table(data$vote_pres)

# ii) You can see that not many people actually voted for a third-party candidate. (You may also note that the variable is NA for most of the respondents -- that's because this variable was asked before the election, so it's only really capturing people who did early voting).

#  Now, make a new variable, called vote_pres2, that is equal to "Biden", "Trump", "Other", depending on who the respondent voted for. It should be NA for anyone who is NA in vote_pres2.
data$vote_pres2 <- NA
data$vote_pres2[data$vote_pres == 1] <- "Biden"
data$vote_pres2[data$vote_pres == 2] <- "Trump"
data$vote_pres2[data$vote_pres < 1] <- NA
data$vote_pres2[data$vote_pres > 2] <- "Other"
table(data$vote_pres2)

# iii) Now use the table and prop.table commands to summarize your variable. What percent of respondents voted for Trump? Biden? A third-party candidate?


# 3) Now let's look at the ideology variable. Right now it's a scale from 1 to 7 (see codebook for what each value means). 

# i) Make a new character variable called lib_con that can take three values: Liberal, Moderate, or Conservative. Liberals are those with ideology values 1, 2, or 3. Conservatives are those with ideology of 5, 6, or 7. Moderates are those with ideology of 4. 


# ii) Summarize the variable using table() and prop.table(). What fraction of the sample falls into each category?



#iii) Now make a two-way prop.table using both lib_con and vote_pres2. What does the table tell you?



# 4) Now let's practice making factor variables. 

# i) Run the summary command on your vote_pres2 variable. What data type is it? 



# ii) Next, take your vote_pres2 variable and make it into an unordered factor variable. 


# iii) Finally, run the summary command from i) again. How has the output changed?



# 5) Now, let's make an ordered factor variable using the govt_corrupt variable. This will have two steps:

# i) First, make a new character variable called corr_factor. For each respondent, their value of corr_factor should be the text associated with each numeric answer in the codebook. So, if govt_corrupt is equal to 1 for someone, their value of corr_factor should be "All". 



# ii) Next, turn corr_factor into an unordered factored variable. Run summary() on corr_factor. What order do the levels appear in? Does this make sense?



# iii) Finally, turn corr_factor into an ORDERED factor. The "lowest" category should be "None", and the highest category should be "All". Run summary() on corr_factor again. How is it different than part ii?






