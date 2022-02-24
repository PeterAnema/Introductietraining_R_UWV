# Uitwerkingen Dag 1 Opdracht 2 Zelfstandig werken met packages - Exploring a Package
# Excercise 2 -----------------------------------------------------------------------

#Clear your environment (remove all variables)
rm (list = ls() )

#install the classic package "car" 
install.packages("car") 

#load this package
library ( car )

#load the Help Pages for this package
help (package = "car")
#locate the Prestige dataset in the Help Pages and inspect the metadata
#Note the number of columns and rows

#Display the data of the Prestige dataset in a separate table or grid like window
View ( Prestige )

#Show the dimensions of the Prestige dataset
#Show the structure of the Prestige dataset
dim( Prestige )
str( Prestige )

#Display the data of the Prestige dataset in your Console window
Prestige

#Display the first 6 rows of the Prestige dataset in your Console window 
head (Prestige)

#create a vector containing the first 6 values of the income variable of this dataset
vec <- c(12351, 25879,  9271,  8865,  8403, 11030)
vec
vec <- Prestige$income[1:6]
vec

#use the summary() function on this vector
summary (vec)
is.na (vec)

rm (list = ls () )


