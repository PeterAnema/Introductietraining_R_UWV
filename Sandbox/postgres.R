# https://www.datacareer.de/blog/connect-to-postgresql-with-r-a-step-by-step-example/

# install.packages('RPostgres')

library(RPostgreSQL)

con <- dbConnect(RPostgres::Postgres(), 
                 dbname = 'demo', 
                 host = 'localhost', 
                 port = 5432, 
                 user = 'demo', 
                 password = 'demo')  

dbListTables(con)

dbGetQuery(con, 'SELECT * FROM klanten') 

dbDisconnect(con) 
