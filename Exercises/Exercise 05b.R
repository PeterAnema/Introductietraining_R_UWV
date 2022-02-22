# Uitwerkingen Dag 1 Opdracht 5b Zelfstandig werken met dataframes - Working with dataframes
# Exercise 5b -----------------------------------------------------------------------

sex <- c("male", "male", "female", "male") 
age <- c(20,23,28, 21)
weight <- c(80, 82, 78, 88)

#What is the average weight of male patients, 21 years of age or older?

df <- as.data.frame(sex)
df$age = age
df$weight = weight

males <- subset (df, sex=="male", select= c("sex","weight", "age") )
males
adultmales <- subset (males, age > 20, select= colnames(df)  ) 
adultmales
mean (adultmales$weight)

adultmales <- df[(df$sex =="male" & df$age > 20), ]
mean (adultmales$weight)


