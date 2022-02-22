# Uitwerkingen Dag 1 Opdracht 6 Zelfstandig werken met dataframes en factoren - Dataframes and factors
# Exercise 6b -----------------------------------------------------------------------

#1 import the following file : d:\\adventureworks.csv into a dataframe called df
df <- read.csv ("data/adventureworks.csv")


#2.  Create a table based on CommuteDistance and HouseOwnerFlag
table (df$CommuteDistance, df$HouseOwnerFlag)


#3. Create a dataframe in which records are sorted on CommuteDistance
dfo <- df[order ( df$CommuteDistance), ]
head (dfo)


#4. create a new column called Proximity as a class factor containing two levels Far and Near
#Divide the commuters in two groups "Far" and "Near"
df$Proximity[ df$CommuteDistance == "10+ Miles"] <- "Far"
df$Proximity[ df$CommuteDistance != "10+ Miles"] <- "Near"
#or
ifelse (df$CommuteDistance == "10+ Miles", df$Proximity <- "Far", df$Proximity <- "Near")


# Create a table based on Proximity and HouseOwnerFlag
table (df$HouseOwnerFlag, df$Proximity)


