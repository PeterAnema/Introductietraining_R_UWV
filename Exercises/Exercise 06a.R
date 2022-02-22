# Uitwerkingen Dag 1 Opdracht 6 Zelfstandig werken met dataframes en factoren - Dataframes and factors
# Exercise 6a -----------------------------------------------------------------------

#1. import the following file : d:\\adventureworks.csv into a dataframe called df
df <- read.csv ("data/adventureworks.csv")

# 2 What is the average YearlyIncome for both Gender types
mean (df.males$YearlyIncome)
mean (df.females$YearlyIncome)

# 3. What is the average YearlyIncome for females without children at home
df.femnokids <- subset (df.females, NumberChildrenAtHome == 0 )
mean (df.femnokids$YearlyIncome)

#4. What is the average YearlyIncome for females with 4 children at home
df.fem4kids <- subset (df.females, NumberChildrenAtHome > 4 )
mean (df.fem4kids$YearlyIncome)
mean ( subset (df.females, NumberChildrenAtHome > 4 )$YearlyIncome)

#factors
# 5. Show the number of married and single females in a table
table(df$MaritalStatus, df$Gender)

# 6. create a table based on TotalChildren and Education
table(df$TotalChildren, df$Education)

#7. Which education level scores the highest number without children
#8. Which education level scores the highest number with 5 children

#9. Using the table() function,compare the number of married people with those who are single 
table (df$MaritalStatus)

# 10 . calculate the Male / Female percentages 
m <- (nrow (df.males) )/ (nrow (df)) * 100
f <- (nrow (df.females) )/ (nrow (df)) * 100

#round these numbers with round ()
m <- round (m, 2)
f <- round (f, 2)
m
f


