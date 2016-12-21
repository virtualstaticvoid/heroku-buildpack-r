require('Rserve')

# get the port allowed
port <- Sys.getenv('PORT')

# run Rserve in process
# debug=TRUE needed for non-daemon mode!
Rserve(
	debug=TRUE,
	port,
	args="--RS-conf /app/rserve.conf --no-save"
)
