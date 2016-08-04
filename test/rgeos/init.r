#
# Example R code to install packages
# See http://cran.r-project.org/doc/manuals/R-admin.html#Installing-packages for details
#

###########################################################
# Update this line with the R packages to install:

# gdal is tricky!

# first, `before_compile` script hacks gdal-config to correct the directory locations
# and then `proj` paths are overridden here via `configure.args` to install.packages

install.packages(
  "rgdal",
  type="source",
  configure.args = c(
    "--with-gdal-config=/app/.apt/usr/bin/gdal-config",
    "--with-proj-lib=/app/.apt/usr/lib",
    "--with-proj-include=/app/.apt/usr/include",
    "--with-proj-share=/app/.apt/usr/share/proj",
    "--with-proj-data=/app/.apt/usr/share/doc/proj-data"
  ),
  verbose=TRUE
)

# install.packages("rgeos")
