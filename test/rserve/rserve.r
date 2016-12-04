require('Rserve')

# get the port allowed
port <- Sys.getenv('PORT')

# run Rserve in process
run.Rserve(debug = FALSE, port, args = NULL, config.file = "./rserve.conf")
