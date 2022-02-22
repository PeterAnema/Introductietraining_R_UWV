# Uitwerkingen Dag 2 Opdracht 10b Zelfstandig werken met functies - working with apply
# Exercise 10b -----------------------------------------------------------------------

#1. set a seed with 41
set.seed (41)

#2. create a matrix with 10 random numbers (use sample() ) < 1000 in 5 rows
mat = matrix(data = sample (1:1000, 10), nrow = 5)
mat

#3. Get the mean of each row
apply (mat, 1, mean)
#4. Get the mean of each column
apply (mat, 2, mean)
#5 sort each individual column
apply (mat, 2, sort)

#6. convert this matrix to a dataframe
df <- as.data.frame (mat)

df
# 7.  Add a column with 5 letters
df <- cbind (df, c(letters[1:5]))


# 8. Add simple column names
colnames (df) <- c ("col1", "col2", "col3") 


# 9. use sapply to check which columns are numeric
sapply (df, FUN =  is.numeric)
which ( sapply (df, FUN =  is.numeric) )

df <- read.csv ("data/adventureworks.csv")
oldpar <- par (mfrow = c (1,2))
hist (df$YearlyIncome)
boxplot (df$YearlyIncome)
par (oldpar)
