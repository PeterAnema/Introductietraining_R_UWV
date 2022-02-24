# Uitwerkingen Dag 1 Opdracht 3 Zelfstandig werken met vectoren - Working with vectors
# Exercise 3b -----------------------------------------------------------------------

vHeights <- c(180, 165, 160, 193)
vWeights <- c(87, 58, 65, 100)

vBMI <-  vWeights / (vHeights / 100) ^ 2
round(vBMI, 2)

vObese <- vWeights[vBMI > 25]
vObese
