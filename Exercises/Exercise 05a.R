# Dag 1 Opdracht 5 Zelfstandig werken met dataframes - Working with dataframes
# Exercise 5a -----------------------------------------------------------------------

# Import the following file : d:\\adventureworks.csv into a dataframe called df
df <- read.csv ("data/adventureworks.csv")

# Inspect first 10 and last 10 records from df
head(df, 10)
tail(df, 10)
# Inspect the structure of the dataframe
str(df)

# Create a summary of all variables
summary (df)

# Note the number of records
nrow(df)

# Create 2 separate dataframes called df.males and df.females based on gender
df.males <- df[df$Gender == "M",]
nrow(df.males)
df.females <- df[df$Gender == "F",]
nrow(df.females)

# Check whether combined record counts add up to the original number
nrow(df) == nrow(df.females) + nrow(df.males)

# Select the three Promotion related columns from the main dataframe in a new dataframe
promos <- c("Promotion",  "PromotionType", "PromotionCategory")
promos
dfp <- subset(df, select = promos)
head(dfp)


