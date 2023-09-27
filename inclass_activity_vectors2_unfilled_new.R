#################################################
##### POLI 281: Voter Registration Activity
##### In Class Vectors Activity -- Week 2, Part 2
#################################################


#clear global environment
rm(list=ls()) 

######################################
############## OVERVIEW ##############
######################################

# In this activity, we will build on the voter registration activity from last class, but incorporate some new skills 

# remember: all of this data is fictional!

# We're going to start by working with the  registration data from last class. For your convenience, we will recreate those vectors here

total_reg <- c(157, 325, 263, 379, 55) #total registration
dem_reg <- c(32, 150, 134, 213, 40) #registered Democrats
rep_reg <- c(68, 100, 120, 137, 10) #registered Republicans

school_vector <- c("Duke", "UNC", "NC State", "NC Central", "Wake Forest") #school names

#naming vectors
names(total_reg) <- school_vector
names(dem_reg) <- school_vector
names(rep_reg) <- school_vector


###################################################
############## VECTORS & SELECTION ################
###################################################

# 1. Below, write a command that selects the observation for NC State from total reg
total_reg["NC State"]

# 2. Below, write a command that calculates how many voters were registered total at public universities (so, not Duke or Wake Forest).  Do this by selecting parts of the total_reg vector via the names of the university. Store the number in an object called public_reg_total.
public_reg_total <- total_reg["NC State"] + total_reg["UNC"] + total_reg["NC Central"]

# 3. Now, do the same thing but select each element *numerically*. Store the number in an object called public_reg_total2.
public_reg_total2 <- sum(total_reg[3], total_reg[2], total_reg[4])

# 4. Now, create a new vector called pub_dems which stores the data only for Democrats registered at public universities. In this, make sure to use the c() command!
pub_dems <- c(dem_reg["UNC"], dem_reg["NC State"], dem_reg["NC Central"])
# pub_dems <- dem_reg[c("UNC", "NC State", "NC Central")]

# 5. Repeat #4, but this time use logic (T vs F statements) within your c() command. For guidance, see Part 1 example 1 in the inclass_examples_vectors2.R document
pub_dems <- dem_reg[c(F, T, T, T, F)]
pub_dems

###################################################
########### SELECTION & CONDITIONALS ##############
###################################################

# We will now practice selecting elements of vectors using conditional statements such as less than (<) greater than (>) and equals to (==). Be sure to refer to the activity to recall all of the different conditional statements here. 

# 6. Using conditional statements create a new vector with information for Republican registered voters, but only in schools with MORE than 100. Call this new vector rep_reg2
rep_reg2 <- rep_reg[rep_reg > 100]

# 8. You are asked which school has exactly 325 total registered voters. Write code to find out. 
total_reg[total_reg = 325]

# 9. Now, determine all of the schools which do NOT have 325 total registered voters
total_reg[total_reg != 325]

###################################################
############## RECODING ELEMENTS  #################
###################################################

# Now we are going to practice with recoding some vectors!

# 10 BONUS EXERCISE IF YOU HAVE FINISHED THE ABOVE ACTIVITES!
# We just found out that Duke messed up with its data :( They under-reported Republican registered voters by 5, and under-reported democrat registered voters by 3. This also will affect their total registered voters. Update Duke's information across all three vectors

#Republican
rep_reg[rep_reg = "Duke"] <- rep_reg[rep_reg = "Duke"] + 5

#Democrat
dem_reg[dem_reg = "Duke"] <- dem_reg[dem_reg = "Duke"] + 3

#total
total_reg[total_reg = "Duke"] <- total_reg[total_reg = "Duke"] + 5 + 3

# 11. Now we found out that NC State misreported its registered Republicans. There are actually 135. Recode this within the rep_reg vector
rep_reg[rep_reg = "NC State"] <- 135
