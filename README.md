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

    $ ls
    Procfile  r_packages  config.ru

    $ heroku create --stack cedar --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git

    $ git push heroku master
    ...
    -----> Heroku receiving push
    -----> Fetching custom buildpack
    -----> R app detected
    -----> Vendoring R x.xx.x
    -----> Installing dependencies from CRAN

The buildpack will detect your app makes use of R if it has the file `r_packages` in the root.  
The R runtime is vendored into your slug.  

## Additional R packages 
During the slug compilation process, the `r_packages` file is parsed for URL's to R package sources, which are
downloaded, built and installed as R libraries. A list of available packages can be found at [http://cran.r-project.org](http://cran.r-project.org/web/packages/available_packages_by_date.html).

Example `r_packages` file:

```
# supply urls for R package sources
http://cran.r-project.org/src/contrib/neldermead_1.0-7.tar.gz
```

## R Binaries
The binaries used by the buildpack are for R 2.15.1, and are hosted 
on [s3://heroku-buildpack-r/R-2.15.1-binaries.tar.gz]()

See the [guide](support/README.md) for building the R binaries.

## Using in your applications
This buildpack can be used in conjunction with other supported language stacks on Heroku by 
using the [heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) buildpack.

See the example [test application](test) application, which shows how to use R from a Ruby Sinatra application.

## Hacking
To use this buildpack, fork it on Github.  Push up changes to your fork, then create a test app 
with `--buildpack <your-github-url>` and push to it.
