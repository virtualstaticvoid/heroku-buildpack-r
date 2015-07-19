#
# Run package tests
#

sapply(installed.packages()[,"Package"], tools::testInstalledPackage)
