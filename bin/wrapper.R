# R script to run author supplied code, typically used to install additional R packages
# contains placeholders which are inserted by the compile script
# NOTE: this script is executed in the chroot context; check paths!

# HACK normalizePath method, so that it works for /app symlink
oldnormalizePath <- base::normalizePath
newnormalizePath <- function(path, winslash="\\", mustWork=NA) {
  # override mustWork to FALSE
  return(oldnormalizePath(path, winslash, mustWork=FALSE))
}
assignInNamespace(x="normalizePath", value=newnormalizePath, ns="base")

r <- getOption("repos")
r["CRAN"] <- "CRAN_MIRROR"
options(repos=r)

# ======================================================================

INIT_FILE_CONTENT

# ======================================================================

# write a file to indicate success
fileConn<-file("/app/status")
writeLines(c("1"), fileConn)
close(fileConn)
