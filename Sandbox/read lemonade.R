

filename <- 'Data/Lemonade.csv'

df <- read_csv(filename)

df$Date <- as.Date(df$Date, format='%d/%m/%Y')
df$Day <- as.factor(df$Day)

write.csv(df, 'Data/clean_lemonade.csv')

