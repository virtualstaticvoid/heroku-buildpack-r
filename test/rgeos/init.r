#
# Example R code to install packages
# See http://cran.r-project.org/doc/manuals/R-admin.html#Installing-packages for details
#

###########################################################
# Update this line with the R packages to install:

# gdal is tricky!
# first, `before_compile` script hacks gdal-config to correct the directory locations
# and then `proj` paths are overridden here via `configure.args`
install.packages(
  'rgdal',
  type="source",
  configure.args = c(
    '--with-proj-include=/app/.apt/usr/local/include',
    '--with-proj-lib=/app/.apt/usr/local/lib',
    '--with-proj-share=/app/.apt/usr/share/proj'
  )
)

my_packages = c("rgeos")

###########################################################

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", p, "\n"))
  }
}
invisible(sapply(my_packages, install_if_missing))
