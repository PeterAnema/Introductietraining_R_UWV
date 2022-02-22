# Uitwerkingen Dag 1 Opdracht 4b Zelfstandig werken met matrices - Working with matrices
# Exercise 4b -----------------------------------------------------------------------

set.seed(41)
v <- round (runif (16, 0, 10), 0)
mat <- matrix(v, ncol=4)
rTotal = rowSums(mat)
cTotal = colSums(mat)
mat = cbind(mat, rTotal)
colnames(mat) <- c ("c1", "c2", "c3", "c4", "total" )
rownames(mat) <- c ("r1", "r2", "r3", "r4" )
mat


