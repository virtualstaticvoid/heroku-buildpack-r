#
# Run package tests
#

# run from the temp directory, as tests output a bunch of files...
testdir <- tempdir()

setwd(testdir)

sapply(installed.packages()[,"Package"], tools::testInstalledPackage)

list.files()

cat("\nSuccess\n")
