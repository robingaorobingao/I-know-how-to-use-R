###########################################
##### POLI 281: Voter Registration Activity
##### In Class Vectors Activity -- Week 2
##### Last Modified: June 29, 2023
###########################################

############## <- I sometimes use prominent comment marks like this to
### delineate major sections of code

# I also often start my workspace by making sure my workspace is empty of
## anything I was working on before. An easy way to do this is:

rm(list=ls()) #this command clears your global environment


###################################### 
############## OVERVIEW ############## 
###################################### 

# ALL NUMBERS ARE HIGHLY FICTIONAL! This means that they bear no relation to the
# actual voter registration levels, party breakdown, etc. of these schools.

# You are working with a local (non-partisan!) voter registration organization that conducts voter registration on campus.  To track of your group's progress, you recorded how many students canvassers registered to on each campus
# last month

# In total, your group registered 157 new voters at Duke, 325 at UNC, 263 at NC State, 379 at NC Central, and 55 at Wake Forest.

# The number of Republican and Democrat registrations at each campus was (these numbers won't add up quite right, don't worry about it for now):
# DU: 32 D, 68 R
# UNC: 150 D, 100 R
# NCSU: 134 D, 120 R
# NCCU: 213 D, 137 R
# WF: 40 D, 10 R



###################################################
################ VECTORS PRACTICE #################
###################################################

##### PART 1: PRACTICE MAKING OBJECTS

# 1. Create a vector called "total_reg" that lists how many new voters were registered total at each campus, in the order they appear above. Write your code below.
total_reg <- c(157, 325, 263, 379, 55)

## NOTE: the c() command is used to combine elements into a vector. You always need commas in between each element! 

# 2. Create 2 vectors called "dem_reg" and "rep_reg": each should list how many of each party were registered at each campus. Write your code below.
dem_reg <- c(32, 150, 134, 213, 40)
rep_reg <- c(68, 100, 120, 137, 10)

#### PART 2: PRACTICE NAMING VECTOR ELEMENTS

# 3. Create a vector called school_vector with the names of the colleges (in the same order you entered the info in above). It's fine to use abbreviations if you prefer.
school_vector <- c("DU", "UNC", "NCSU", "NCCU", "WF")

# 4. Assign these names to each of your three voter registration vectors. Then, print out each vector to make sure this all worked.
names(total_reg) <- school_vector
names(dem_reg) <- school_vector
names(rep_reg) <- school_vector
total_reg
dem_reg
rep_reg

## PART 3: PRACTICE DESCRIPTIVE DATA ANALYSIS USING VECTORS

# 5. For each of the party vectors (dem_reg and rep_reg), use the sum() command to calculate the total number of each party registered across all schools. After the second command (on the same line), write a comment stating whether more Democrats or Republicans were registered total.
sum(dem_reg)
sum(rep_reg) # more registered Democrats in total

## PART 4: PRACTICE WITH VECTOR MATH


# 6. Create a new vector which shows the difference between registered Democrats and Republicans at each university (dems - reps)
# Call this new vector - diff_reg
diff_reg <- dem_reg - rep_reg
diff_reg

### PART 5: PRACTICE WITH BOOLEAN DATA

# 7. You just received new information about whether or not each school will have a voting booth on campus
# Duke - Yes
# UNC - Yes
# NC State - No
# NC Central - Yes
# Wake Forest - No

# Make a new BOOLEAN vector capturing whether or not these schools have a polling place on campus, where YES is TRUE and NO is FALSE. Call this vector "polling". Name this vector with the school names.
polling <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
names(polling) <- school_vector
polling

# 8. Calculate how many of the schools have a polling place on campus using the sum() command
sum(polling)

# 9. Calculate the PERCENTAGE of schools that have a polling place on campus
mean(polling) * 100
