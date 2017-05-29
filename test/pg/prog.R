#
# Example R program
#

library("httr")
library("RPostgreSQL")

db_uri <- Sys.getenv('DATABASE_URL')
parts <- parse_url(db_uri)

drv <- dbDriver("PostgreSQL")

con <- dbConnect(
	drv,
	host = parts$hostname,
	port = parts$port,
	user = parts$user,
	password = parts$password,
	dbname = parts$path
)

dbListTables(con)

dbDisconnect(con)
