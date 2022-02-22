# Uitwerkingen Dag 1 Opdracht 3 Zelfstandig werken met vectoren - Working with vectors
# Exercise 3b -----------------------------------------------------------------------

vHeights <- c(180, 165, 160, 193)
vWeights <- c(97, 78, 60, 100)
vBMI <-  vWeights / (vHeights * vHeights/10000)
vObese <- vBMI[vBMI > 25]
