# # Dag 2 Oefening 9: branching and looping 
# Exercise 9 -----------------------------------------------------------------------

#1. open "adventureworks.csv" in a dataframe called data
data <- read.csv ("data/adventureworks.csv")

#2. Set the seed at 41, 
set.seed (41)

#3. then using a for-loop take a random sample of 5 YearlyIncomes for 1000 times. 
#4. Save these averages in a vector called v of appropriate size. 
v <- numeric (1000)
v

for (i in c(1:1000) )
{
  s <- sample (data$YearlyIncome, 100)    #take 5 rows
  v[i]  <- mean (s)       #place mean in vector
}


# 5. Calculate the differences between the values of the vector and the average YearlyIncome
diffs <- v - mean (data$YearlyIncome)

#6.  Create a dataframe called df containing
# 1. mean YearlyIncome
# 2. the vector  values
# 3. the differences (use abs() )

df <- data.frame ( round ( mean(data$YearlyIncome)), v, round (abs (diffs), 0)  )
head (df)

#7. Add clear and easy to understand column names
colnames (df) <- c("mean Income", "sample mean", "difference" )

# 8 create a column called five.percent which shows 5% from average of  YearlyIncome?
df$five.percent <- round ( df[, 1] * 0.05, 0)

#9 create a boolean column displaying whether more than 5% away from the average of  YearlyIncome?
df$more.than.5percent <- ifelse (df$difference > df$five.percent, TRUE, FALSE )

#show structure and first 6 rows
str(df); head (df)

# 10. What proportion of these 1,000 averages are more than 5% away from the average of  YearlyIncome?
(nrow ( subset (df, df$more.than.5percent == TRUE) ) / nrow (df) ) * 100   #85.1



