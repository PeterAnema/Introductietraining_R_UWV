
# Uitwerkingen Dag 2 Opdracht 10 Zelfstandig werken met functies - (optional) Simple function exercises
# Exercise 10a (optional) -----------------------------------------------------------------------


#Write a function that adds two numbers, and divides the result by 3
addtwo <- function(num1, num2)
{
  (num1 + num2)/3
}

#call it with two numbers 
addtwo (41,31)


#2. Create a function called missAny() that checks if there are any missing (NA) values in a vector. 

# 
missAny <- function (x)
{
  return (any (is.na (x)))
}


v <- rnorm (100)
v[41] <- NA
v[31] <- NA
missAny (v)


#3.  Create a function called missWhich() that tells you which of the values are missing

missWhich <- function (x)
{
  return (which (is.na (x)))
}

missWhich (v)


# 4. Remember head and tail? 
# Now Write a function called middle that shows a number rows starting from the middle of a dataframe
#

x <- c (1,2,3,4,5, 6,7,8,9,10)
y <- c (12,23,34,56,78, 1,2,3,4,5)
df <- data.frame (x, y)


middle <- function (data, number)
{
  if (number > nrow (data))
    print ("Number too large for this frame")
  mid <-  floor ( nrow (data) / 2 )
  print (mid)
  print( df[mid : (mid + number - 1), ] )
}

print (df)
middle ( df, 5)
dfm <- middle ( df, 5)


