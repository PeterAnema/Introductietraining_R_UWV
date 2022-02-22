# required libraries
library(ggplot2)

# Set the initial plot area dimensions
options(repr.plot.width=4, repr.plot.height=3) 
dev.off()

# Set working directory to directory containing this script
dir <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(dir)

# Read the data AdvWorksCusts.csv
df_Customers <- read.csv('Data/AdvWorksCusts.csv')
names(df_Customers)
dim(df_Customers)
head(df_Customers)

# Read data from AW_AveMonthSpend.csv
df_AveMonthSpend <- read.csv('Data/AW_AveMonthSpend.csv')
names(df_AveMonthSpend)
dim(df_AveMonthSpend)
head(df_AveMonthSpend)

# Read data from AW_BikeBuyer.csv
df_BikeBuyer <- read.csv('Data/AW_BikeBuyer.csv')
names(df_BikeBuyer)
dim(df_BikeBuyer)
head(df_BikeBuyer)

# Remove duplicates
df_Customers <- df_Customers[!duplicated(df_Customers$CustomerID, fromLast=TRUE),]
dim(df_Customers)

df_AveMonthSpend <- df_AveMonthSpend[!duplicated(df_AveMonthSpend$CustomerID, fromLast=TRUE),]
dim(df_AveMonthSpend)

df_BikeBuyer <- df_BikeBuyer[!duplicated(df_BikeBuyer$CustomerID, fromLast=TRUE),]
dim(df_BikeBuyer)

# Merge with BikeBuyer
df_Customers_BikeBuyer <- merge(df_Customers, df_BikeBuyer, by="CustomerID")
dim(df_Customers_BikeBuyer)

# Explore df_AveMonthSpend
summary(df_AveMonthSpend$AveMonthSpend)

formatted_summary <- function(x){
  cat(sprintf('Minimum            : %8.2f\n', min(x)))
  cat(sprintf('1st Quartile       : %8.2f\n', quantile(x, 0.25)))
  cat(sprintf('Median             : %8.2f\n', median(x)))
  cat(sprintf('3rd Quartile       : %8.2f\n', quantile(x, 0.75)))
  cat(sprintf('Maximum            : %8.2f\n', max(x)))
  cat(sprintf('Mean               : %8.2f\n', mean(x)))
  cat(sprintf('Standard deviation : %8.2f\n', sd(x)))
}

formatted_summary(df_AveMonthSpend$AveMonthSpend)

# Explore df_BikeBuyer
counts <- table(df_BikeBuyer$BikeBuyer)
counts

# Draw barplot of 'Not a Buyer' versus 'Buyer'
par(pin=c(4,3))
bp <- barplot(counts, 
              main = "Bike Buyers",
              names.arg = c("0 - Not a Buyer", "1 - Buyer"),
              col = "darkblue",
              border = FALSE, 
              ylab = "count",
              ylim = c(0, 12000))
text(bp, counts, counts, cex=0.8, pos=3) 


# Explore Yearly income per Occupation 
grouped <- aggregate(df_Customers_BikeBuyer$YearlyIncome, 
                     by=list(Occupation = df_Customers_BikeBuyer$Occupation), 
                     FUN="median")
names(t) <- c('Occupation','MedianOfYearlyIncome')
grouped[order(grouped$MedianOfYearlyIncome),]

# Calculate Age and add as new column
age <- function(from, to) {
  from_lt = as.POSIXlt(from)
  to_lt = as.POSIXlt(to)
  age = to_lt$year - from_lt$year
  ifelse(to_lt$mon < from_lt$mon | (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
         age - 1,
         age)
}

to <- as.Date("01/01/1998", format="%m/%d/%Y")
df_Customers$Age <- age(df_Customers$BirthDate, to)

# Calculate AgeCategory and add as new column
df_Customers$AgeCategory <- cut(df_Customers$Age, 
                                breaks = c(0,25,45,55,100))

# Merge with AveMonthSpend
df_Customers_AveMonthSpend = merge(df_Customers, 
                                   df_AveMonthSpend, 
                                   by="CustomerID")
head(df_Customers_AveMonthSpend)

# Explore AveMonthSpend per AgeCategory and per Gender
grouped <- aggregate(x = df_Customers_AveMonthSpend$AveMonthSpend, 
                     by = list(df_Customers_AveMonthSpend$AgeCategory, 
                               df_Customers_AveMonthSpend$Gender), 
                     FUN = mean)
grouped <- grouped[order(grouped[, 1], grouped[, 2]),]
names(grouped) <- c('AgeCategory', 'Gender', 'mean_AveMonthSpend')
grouped

# or alternatively using dplyr
library(dplyr)
grouped <- df_Customers_AveMonthSpend %>% group_by(AgeCategory, Gender)
summarise(grouped, mean_AveMonthSpend = mean(AveMonthSpend))

# Explore AveMonthSpend versus MaritalStatus
grouped <- aggregate(df_Customers_AveMonthSpend$AveMonthSpend, 
                     by=list(MaritalStatus = df_Customers_AveMonthSpend$MaritalStatus), 
                     FUN="median")
names(grouped) <- c('MaritalStatus','MedianOfAveMonthSpend')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_AveMonthSpend, 
                   MaritalStatus), 
          MedianOfAveMonthSpend = median(AveMonthSpend))

# Explore AveMonthSpend versus NumberCarsOwned
grouped <- aggregate(df_Customers_AveMonthSpend$AveMonthSpend, 
                     by = list(NumberCarsOwned = df_Customers_AveMonthSpend$NumberCarsOwned), 
                     FUN = "median")
names(grouped) <- c('NumberCarsOwned','MedianOfAveMonthSpend')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_AveMonthSpend, 
                   NumberCarsOwned), 
          MedianOfAveMonthSpend = median(AveMonthSpend))


# Explore AveMonthSpend versus Gender
grouped <- aggregate(df_Customers_AveMonthSpend$AveMonthSpend, 
                     by = list(Gender = df_Customers_AveMonthSpend$Gender), 
                     FUN = "median")
names(grouped) <- c('Gender','MedianOfAveMonthSpend')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_AveMonthSpend, 
                   Gender), 
          MedianOfAveMonthSpend = median(AveMonthSpend))

# Explore range of AveMonthSpend versus Gender
value_range <- function(a) {
  return(max(a) - min(a))
}

grouped <- aggregate(df_Customers_AveMonthSpend$AveMonthSpend, 
                     by = list(Gender = df_Customers_AveMonthSpend$Gender), 
                     FUN = function(x) cbind(min(x), max(x), value_range(x)),
                     simplify = TRUE)
grouped <- do.call(data.frame, grouped)
names(grouped) <- c('Gender','MinimumOfAveMonthSpend','MaximumOfAveMonthSpend','RangeOfAveMonthSpend')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_AveMonthSpend, 
                   Gender), 
          MinimumOfAveMonthSpend = min(AveMonthSpend), 
          MaximumOfAveMonthSpend = max(AveMonthSpend), 
          RangeOfAveMonthSpend = value_range(AveMonthSpend))


# Explore AveMonthSpend versus NumberOfChildrenAtHome
grouped <- aggregate(df_Customers_AveMonthSpend$AveMonthSpend, 
                     by = list(NumberChildrenAtHome = df_Customers_AveMonthSpend$NumberChildrenAtHome), 
                     FUN = median)
names(grouped) <- c('NumberChildrenAtHome','MedianOfAveMonthSpend')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_AveMonthSpend, 
                   NumberChildrenAtHome), 
          MedianOfAveMonthSpend = median(AveMonthSpend))

# Explore BikeBuyer versus YearlyIncome
grouped <- aggregate(df_Customers_BikeBuyer$YearlyIncome, 
                     by = list(BikeBuyer = df_Customers_BikeBuyer$BikeBuyer), 
                     FUN = median)
names(grouped) <- c('BikeBuyer','MedianOfYearlyIncome')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_BikeBuyer, 
                   BikeBuyer), 
          MedianOfYearlyIncome = median(YearlyIncome))


# Explore BikeBuyer versus NumberCarsOwned
grouped <- aggregate(df_Customers_BikeBuyer$NumberCarsOwned, 
                     by = list(BikeBuyer = df_Customers_BikeBuyer$BikeBuyer), 
                     FUN = median)
names(grouped) <- c('BikeBuyer','MedianOfNumberCarsOwned')
grouped[order(grouped[,1]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_BikeBuyer, 
                   BikeBuyer), 
          MedianOfNumberCarsOwned = median(NumberCarsOwned))


# Explore BikeBuyer versus Occupation
grouped <- aggregate(df_Customers_BikeBuyer$Occupation, 
                     by = list(BikeBuyer = df_Customers_BikeBuyer$BikeBuyer,
                               Occupation = df_Customers_BikeBuyer$Occupation), 
                     FUN = length)
names(grouped) <- c('BikeBuyer','Occupation','N')
grouped[order(grouped[,1], grouped[,2]),]

# or alternatively using dplyr
#
summarise(group_by(df_Customers_BikeBuyer, 
                   BikeBuyer, 
                   Occupation), 
          N = n())



# Explore BikeBuyer versus Gender
grouped <- aggregate(df_Customers_BikeBuyer$Gender, 
                     by = list(BikeBuyer = df_Customers_BikeBuyer$BikeBuyer,
                               Gender = df_Customers_BikeBuyer$Gender), 
                     FUN = length)
names(grouped) <- c('BikeBuyer','Gender','N')
grouped[order(grouped[,1], grouped[,2]),]

grouped <- reshape(grouped, 
                   direction="wide", 
                   v.names="N", 
                   timevar="BikeBuyer", 
                   idvar="Gender")
grouped$PercentageBuyers = grouped$N.1 / (grouped$N.0 + grouped$N.1)

grouped

# or alternatively using dplyr
#
summarise(group_by(df_Customers_BikeBuyer, 
                   BikeBuyer, 
                   Gender), 
          N = n())


# Explore BikeBuyer versus MaritalStatus
grouped <- aggregate(df_Customers_BikeBuyer$MaritalStatus, 
                     by = list(BikeBuyer = df_Customers_BikeBuyer$BikeBuyer,
                               MaritalStatus = df_Customers_BikeBuyer$MaritalStatus), 
                     FUN = length)
names(grouped) <- c('BikeBuyer', 'MaritalStatus', 'N')
grouped <- grouped[order(grouped[,1], grouped[,2]),]
rownames(grouped) <- NULL
grouped

grouped <- reshape(grouped, 
                   direction="wide", 
                   v.names="N", 
                   timevar="BikeBuyer", 
                   idvar="MaritalStatus")
grouped$PercentageBuyers = grouped$N.1 / (grouped$N.0 + grouped$N.1)
grouped

# or alternatively using dplyr
#
summarise(group_by(df_Customers_BikeBuyer, 
                   BikeBuyer, 
                   MaritalStatus), 
          N = n())
