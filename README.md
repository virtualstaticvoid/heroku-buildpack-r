Heroku buildpack: R
===================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for Ruby applications which use 
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides 
a wide variety of statistical and graphical techniques: linear and nonlinear modelling, statistical tests, time 
series analysis, classification, clustering, etc. Please consult the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that store identical, up-to-date, versions of code and 
documentation for R. A list of available packages can be found [here](http://cran.r-project.org/web/packages/available_packages_by_date.html).

Usage
-----

Example usage:

    $ ls
    Procfile  r_packages  config.ru

    $ heroku create --stack cedar --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git

    $ git push heroku master
    ...
    -----> Heroku receiving push
    -----> Fetching custom buildpack
    -----> R app detected
    -----> Vendoring R 2.14.1
    -----> Installing dependencies from CRAN

The buildpack will detect your app makes use of R if it has the file `r-packages` in the root.  
It will parse the `r-packages` file for URL's of packages and install them via CRAN.
The R runtime and packages are vendored into your slug.  

Using in Ruby Applications
------------------------------

Use the [RSRuby](https://github.com/alexgutteridge/rsruby/) or [RinRuby](http://rubyforge.org/projects/rinruby/) gem 
to connect to the instance of the R runtime.

Hacking
-------

To use this buildpack, fork it on Github.  Push up changes to your fork, then create a test app 
with `--buildpack <your-github-url>` and push to it.

