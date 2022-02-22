# Uitwerkingen Dag 1 Opdracht 4 Zelfstandig werken met matrices - Working with matrices
# Exercise 4a

f <-  seq(from=80, to=100, by=1)
c <-   round ((f-32) * 5/9, 1)
mat <- cbind(round (f, 1), c)
colnames (mat) <- c ("fahrenheit", "celsius") 
rownames(mat) <- paste("Observation " , 1 : nrow(mat) )
mat
