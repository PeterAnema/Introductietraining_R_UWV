# Uitwerkingen Dag 2 Opdracht 7a Zelfstandig werken met plots - Simple plots
# Exercise 7a -----------------------------------------------------------------------

#1 import the following file : d:\\adventureworks.csv into a dataframe called df
df <- read.csv ("Data/adventureworks.csv")

#Create a histogram based on YearlyIncome
hist (df$YearlyIncome)

#Create a histogram based on YearlyIncome
#but now based on incomes between 10000 and 100000

hist (df$YearlyIncome, xlim = c (10000, 100000))

options(scipen=999)

#Add titles and lables
hist (df$YearlyIncome, 
      xlim = c (10000, 100000),
      main = "overview of incomes",
      xlab = "Yearly Income",
      ylab = "Freq. Of Observations",
      col = "light seagreen")

# 6. 
# Use the par() function to store the current value
# Create two plots side by side showing histograms of UnitPrice and TotalProductCost

oldpar <- par ( mfrow = c(1,2))

hist (df$UnitPrice)
hist (df$TotalProductCost)

# 7. Reset par() to its previous value

par ( oldpar)

# 8. Create a scatterplot based on UnitPrice and TotalProductCost)
plot (df$UnitPrice, df$TotalProductCost)

# 9. Create a plot which shows min, max and median values for YearlyIncome
boxplot (df$YearlyIncome)

## 10. Create a plot which shows min, max and median values for YearlyIncome by Gender
df$Gender = as.factor(df$Gender)
plot ( df$Gender, df$SalesAmount)




