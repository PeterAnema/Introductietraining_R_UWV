# Uitwerkingen Dag 2 Opdracht 7 Zelfstandig werken met plots - Simple plots
# Exercise 7b -----------------------------------------------------------------------

#1.Using the table() function,compare the number of married people with those who are single 
table (df$MaritalStatus)

#2. calculate the Male / Female percentages 
m <- (nrow (df.males) )/ (nrow (df)) * 100
f <- (nrow (df.females) )/ (nrow (df)) * 100

#3. round these numbers with round ()
m <- round (m, 2)
f <- round (f, 2)
m
f

#Convert
#4. Using the paste() function, create 2 character vectors (M, F) containing the percentages with the 
# percentage sign (%) as suffix
m <- paste (as.character (m), "%")
f <- paste (as.character (f), "%")
m
f

#5. Look up the barplot() function, specifically	ylim, ylab, main, names.arg

#6. Draw a barplot comparing these two groups
#7. The height of the y axis should be limited to the total of these two groups
#8. Make sure the title and the labels below the bars clarify the graph
#9. Show the percentages between each bar (no need to show decimal precision) and the total of observations

barplot (table (df$Gender), 
         ylim=c(0, nrow (df)), 
         ylab="Count", 
         main= "Married / Single (n=60K)", 
         names.arg = c(m, f)  
)


