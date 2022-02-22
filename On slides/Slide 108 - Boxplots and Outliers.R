dfmpg <- df[, c(7:8, 12) ]
with( dfmpg, boxplot 
      (MPG.city, 
        MPG.highway, 
        xlab="MPG.city and MPG.highway", 
        ylab="Miles per gallon"))






Quantile (mtcars$qsec)
# Make a boxplot of qsecboxplot (mtcars$qsec)
# Calculate the interquartile range of qsec
IQR(mtcars$qsec)
2.0075 and you have also visualised that in your plot!
  
  quantile (mtcars$qsec) 
0% 	25% 	50% 	75% 	100% 
14.5000 	16.8925 	17.7100 	18.9000 	22.9000 > 
  
  = min   	1st quartile    2nd	3rd	max

# Make a boxplot of qsecboxplot (mtcars$qsec) 
boxplot (mtcars$qsec) > 
  
  # Calculate the interquartile range of qsec 
  > IQR(mtcars$qsec) [1] 2.0075


# What is the threshold value for an outlier below the first quartile?#IQR (mtcars$qsec)
#quantile(mtcars$qsec)
#16.8925 - 1.5 * 2.007513.88123
# What is the threshold value for an outlier above the third quartile?
#18.900 + 1.5 * 2.007521.91125


# What is the threshold value for an outlier below the first quartile?IQR (mtcars$qsec)quantile(mtcars$qsec)16.8925 - 1.5 * 2.0075# What is the threshold value for an outlier above the third quartile?18.900 + 1.5 * 2.0075
