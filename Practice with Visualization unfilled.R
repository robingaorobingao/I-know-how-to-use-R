#########################################
##### POLI 281: Data Visualization Part 3 - Week 7
##### In Class Activity
##########################################


# In this activity, you'll use the stops.csv dataset to make graphs as described 
# below. Some of these will be more challenge than figures we have created
# in the past. Don't forget to reference online resources and the ggplot2
# cheat sheet on Sakai if you have questions! 

# For information on what each variable means, please revisit the stops 
# activity from last class


################################### QUESTIONS ###################################


# Q0: Write code to A) clear the decks, B) import the stops dataset programmatically, and C) load the dplyr and ggplot2 packages.

rm(list=ls())
library(tidyverse)
setwd("/Users/robin/Documents/R")
stops <- read.csv("stops-1.csv")

# Q1: First, make a histogram of the age variable. Save it as an object called age_hist. What does it tell you?

age_hist <- ggplot(stops, aes(x = age)) + geom_histogram()

# Q2: We want to make a scatterplot that shows the mean likelihood of a search, broken down the driver's age. Don't make the graph yet: instead, I want you to 1) sketch what the graph will look like, and 2) discuss whether you can make this graph with the raw data, or whether you'll need to make a new summary dataset first. Check with a ULA or Prof. Martin before you move on to Q3.

# Q3. Write the code to make the scatterplot described in Q2 -- including making a summary dataset if needed. Save the figure as an objected called graph1. 

base <- stops %>%
  group_by(age) %>%
  summarise(searchperage = mean(searchoccur, na.rm = T))
graph1 <- ggplot(base, aes(x = age, y = searchperage)) + geom_point()

# Q4: Now make a new object called fancygraph that takes graph1 and does the following:
# 1. Make the color scheme black & white
# 2. Make the x axis go in 10-year intervals from 0 to 110
# 3. Change the x axis label so age is capitalized
# 4. Change the y axis to be "Probability of a Search"
# 5. Make the axis text font size 8

fancygraph <- graph1 +
  theme_bw() +
  scale_x_continuous(breaks = seq(0,110, by = 10)) +
  xlab("Age") +
  ylab("Probability of a Search") +
  theme(axis.text.y = element_text(size = 8), axis.text.x = element_text(size = 8))

# Q5. Now, let's think about what you found. 

# a) What does the graph tell you about the relationship between age and likelihood of being searched?

# Younger people are more likely than older people to get searched if they're pulled over

# b) Are there any outliers? If so, what do you think is causing those?

# Outlier at ages 110 and ~14, maybe caused by a mistake in reporting for 110 but 14-year-olds are not supposed to be driving to begin with.

# c) Do you think the relationship you found is causal? That is, are certain age groups *causing* higher searches, or are there potential confounders we should worry about?

# d) Are there ways you could do the graph differently to see if any potential confounders matter?

### IF YOU FINISH THE ABOVE, HERE'S A BONUS EXERCISE.

#In the exercise above, we treated every age as its own unit. That may not make sense if we only have a few people who are a particular age. Another way of approaching this question is to group drivers by broader age ranges. 

#Q6.  Make a new variable in the original dataset that categorizes people by decade. The categories should be as follows:
# below 15: NA. These are either kids driving or data entry errors. Neither helps us much with understanding "normal" patterns
# Anyone 19 or younger: teenager
# 20-29: twenties, 30-39: thirties, etc. up through sixties.
# 70-99: "Over Seventy"
# 100+ : NA because these may be data entry errors

stops$agerange <- NA
stops$agerange[stops$age < 15 | stops$age >= 100] <- NA
stops$agerange[stops$age > 15 & stops$age <= 19] <- "Teenager"
stops$agerange[stops$age >= 20 & stops$age <= 29] <- "Twenties"
stops$agerange[stops$age >= 30 & stops$age <= 39] <- "Thirties"
stops$agerange[stops$age >= 40 & stops$age <= 49] <- "Forties"
stops$agerange[stops$age >= 50 & stops$age <= 59] <- "Fifties"
stops$agerange[stops$age >= 60 & stops$age <= 69] <- "Sixties"
stops$agerange[stops$age >= 70 & stops$age <= 99] <- "Over Seventy"

# Q7. Before you make the summary dataset, you'll need to make agerange into a factor variable according to the order you want. To do this, run the following code:
stops$agerange <- factor(stops$agerange, levels = c("Teenager", "Twenties", "Thirties", "Forties", "Fifties", "Sixties", "Over Seventy"))

# Q8. Now, make a summary dataset that tells you the average likelihood of a search (conditional on being stopped) for each value of agerange.  When you do so, filter the data so that it drops any row where agerange=="NA"

newsummary <- stops %>%
  group_by(agerange) %>%
  filter(agerange != "NA") %>%
  summarise(searchperagerange = mean(searchoccur, na.rm = T))

# Q9. Then, make a bar graph that shows the probability of a stop for each decade. Choose a few options to add to make it pretty!


# Q10. Does this graph change your understanding of how age affects searches? Why or why not?


# Q11. Of the two graphs we've made, which do you think does a better job of presenting the information? That is, which would you choose if you were including it in a presentation?
