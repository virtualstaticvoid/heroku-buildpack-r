# Buildpack tests

This directory contains various tests that can be run against the buildpack.

## Set-up
* Update the test.config file to point to the buildpack url that you wish the tests to run against.
* Update ruby/.buildpacks file to point to the buildpack url that you wish the test to run against.  This test uses the multi buildpack (https://github.com/ddollar/heroku-buildpack-multi) to install both R and Ruby, as a result the test.config file cannot be used to specify the R buildpack url.

## Running the tests
* Navigate to the test directory and run the install file, i.e.

```
$ cd heroku-buildpack-r/test/console
$ ./install
```

## Description of tests
* Console - creates a new Heroku app, installs the nlme R package (as specified in the init.r file) and launches the R console on Heroku.
* ggplot - creates a new Heroku app, installs the ggplot package (as specified in the init.r file) and launches the R console on Heroku.  To test that ggplot has been installed correctly and can save images, type the following at the R prompt:

```
library(ggplot2)
head(diamonds)
p <- ggplot(data = diamonds, aes(x = carat, y = price, colour = cut)) + layer(geom = "point")
p <- p + layer(geom = "point")
ggsave("plot.svg")
```
* rcpp - creates a new Heroku app, installs the rcpp R package (as specified in the init.r file) and launches the R console on Heroku.  To ensure Rcpp has been installed correctly type library('Rcpp') at the R prompt.
* rserve - creates a new Heroku app, installs [Rserve](http://rforge.net/Rserve/) (as specified in the init.r file) and launches an Rserve server on Heroku.
* ruby - creates a new Heroku app installing both R and Ruby.  To check that Ruby and R have been installed, run:

```
$ heroku run bash
$ ruby --version
$ R --version
```