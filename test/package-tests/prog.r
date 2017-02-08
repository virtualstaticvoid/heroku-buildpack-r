#
# Run package tests
#

# run from the temp directory, as tests output a bunch of files...
setwd("/var/tmp")

sapply(installed.packages()[,"Package"], tools::testInstalledPackage)

list.files()
