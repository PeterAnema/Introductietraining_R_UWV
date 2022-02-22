# Uitwerkingen Dag 1 Opdracht 3  Zelfstandig werken met vectoren - Working with vectors
# Exercise 3a

# . Create a vector called vec1 containing the numbers 2,5,8,12 and 16
# . Make a second vector called vec2 containing the numbers 5 to 9
# . Subtract vec2 from vec1 and explain the result
# . Use seq() to make a vector of 100 values starting at 2 and increasing by 3 each time
# . Extract the values at positions 5,10,15 and 20 in the vector of 100 values you made
# . Extract the values at positions 10 to 30 in the vector of 100 values you made

vec1 <- c(2, 5, 8, 12, 16, 17)
vec2 <- c(5, 9)
vec3 <- vec2 - vec1
vec4 <- seq(2, 100, 3) 
vec5 <- vec4[c(5, 10, 15, 20)]
vec6 <- vec4[c(10:20)]


