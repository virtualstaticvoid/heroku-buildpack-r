# Heroku buildpack: R

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for applications which use
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides
a wide variety of statistical and graphical techniques: linear and nonlinear modelling, statistical tests, time
series analysis, classification, clustering, etc. Please consult
the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that
store identical, up-to-date, versions of code and documentation for R.

## Usage
Example usage:

```
$ ls
init.r prog1.r prog2.r ...

$ heroku create --stack cedar --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git

$ git push heroku master
...
-----> Heroku receiving push
-----> Fetching custom buildpack
-----> R app detected
-----> Vendoring R x.xx.x
       Executing init.r script
...
-----> R successfully installed
```

The buildpack will detect your app makes use of R if it has the `init.r` file in the root.
The R runtime is vendored into your slug.

To reference a specific version, add the Git branch or tag name to the end of the build packs URL.

```
$ heroku create --stack cedar --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git#master
```

## Installing R packages
During the slug compilation process, the `init.r` R file is executed. Put code in this file to install any packages you may require.
See the [Installing-packages](http://cran.r-project.org/doc/manuals/R-admin.html#Installing-packages) for details. The
list of available packages can be found at [http://cran.r-project.org](http://cran.r-project.org/web/packages/available_packages_by_date.html).

```
# Example `init.r` file

install.packages("nlme", dependencies = TRUE)

```

## R Console
You can also run the R console application as follows:

```
$ heroku run R
```

Type `q()` to exit the console when you are finished.

_Note that the Heroku slug is read-only, so any changes you make during the session will be discarded._

## Using in your applications
This buildpack can be used in conjunction with other supported language stacks on Heroku by
using the [heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) buildpack.

See the example [test applications](heroku-buildpack-r/tree/master/test) which show how to use R from the console and a simple Ruby application.

## R Binaries
The binaries used by the buildpack are for R 2.15.1, and are hosted
on [s3://heroku-buildpack-r/R-2.15.1-binaries.tar.gz](https://heroku-buildpack-r.s3.amazonaws.com/R-2.15.1-binaries.tar.gz)

See the [guide](heroku-buildpack-r/tree/master/support/README.md) for building the R binaries.

## Hacking
To use this buildpack, fork it on Github.  Push up changes to your fork, then create a test app
with `--buildpack <your-github-url>` and push to it.
