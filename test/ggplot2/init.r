#
# Example R code to install packages
# See http://cran.r-project.org/doc/manuals/R-admin.html#Installing-packages for details
#

###########################################################
# Update this line with the R packages to install:

# install older version of colorspace package
install.packages("http://cran.r-project.org/src/contrib/Archive/colorspace/colorspace_1.2-4.tar.gz", repos=NULL, type="source")

my_packages = c("ggplot2")

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
