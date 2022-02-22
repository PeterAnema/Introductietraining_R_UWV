# Uitwerkingen Dag 2 oefening 8 : working with ggplot ----------------------------------------
# Exercise 8  -----------------------------------------------------------------------

#1. Load ggplot2
library (ggplot2)

#2. Create a scatterplot with ggplot based on UnitPrice and TotalProductCost
p <- ggplot(data = df, 
            mapping = aes
            (
              x = UnitPrice, 
              y = TotalProductCost
            )) + geom_point()
p

#3. Create the same plot, but limit the dotsize to 2
p<-  ggplot(data = df, 
            mapping = aes
            (
              x = UnitPrice, 
              y = TotalProductCost
            )) + 
  geom_point(size = 2) 
p

#4. Next, add a smoothing layer with geom_smooth
#based on the "lm" method

ggplot(data = df, 
       mapping = aes
       (
         x = UnitPrice, 
         y = TotalProductCost
       )) + geom_point(size = 2) +
  geom_smooth(method = "lm")  
#or

p <- p +   geom_smooth(method = "lm")  
p

#Next, create the same plot
#split it in 3 subplots based on ProductCategory
#using facet_wrap

ggplot(data = df, 
       mapping = aes
       (
         x = UnitPrice, 
         y = TotalProductCost
       )) + geom_point(size = 1) +
  geom_smooth(method = "lm")  +
  facet_wrap(~ ProductCategory)


