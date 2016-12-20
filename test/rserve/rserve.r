require('Rserve')

# get the port allowed
port <- Sys.getenv('PORT')

# run Rserve in process
# needed for non-daemon mode!
run.Rserve(
	debug = TRUE,
	port,
	args = "--no-save",
	config.file = "/app/rserve.conf"
)
