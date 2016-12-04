library(shiny)

# HACK normalizePath method, so that it works for /app symlink
oldnormalizePath <- base::normalizePath
newnormalizePath <- function(path, winslash="\\", mustWork=NA) {
	# override mustWork to FALSE
	return(oldnormalizePath(path, winslash, mustWork=FALSE))
}
assignInNamespace(x="normalizePath", value=newnormalizePath, ns="base")

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = as.numeric(port)
)
