install.packages('carData')

library(carData)

data("Prestige")

View(Prestige)

print(Prestige$income)

Prestige$income_category <- cut(
  Prestige$income, 
  breaks = seq(from = 0, to = 30000, by = 5000),
  labels = c('A','B','C','D','E','F'),
)

