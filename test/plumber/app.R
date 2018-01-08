library(plumber)

port <- Sys.getenv('PORT')

r <- plumb("/app/myfile.R")

# default route
r$handle("GET", "/", function(req, res){
  paste(readLines("/app/index.html"), collapse = " ")
}, serializer=plumber::serializer_html())

r$run(host='0.0.0.0', port=strtoi(port))
