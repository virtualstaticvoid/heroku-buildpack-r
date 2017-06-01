# Heroku buildpack: R

**NOTE: This version is DEPRECATED. Please use the [heroku-16](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16) branch.**

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for applications which use
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides
a wide variety of statistical and graphical techniques: linear and nonlinear modelling, statistical tests, time
series analysis, classification, clustering, etc. Please consult
the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that
store identical, up-to-date, versions of code and documentation for R.

## NOTE - Heroku `cedar-14`

For the Heroku `cedar-14` stack, please use the [cedar-14](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/cedar-14) branch.

You can specify `cedar-14` branch in the buildpack url as follows:

```
$ heroku create --stack cedar-14 --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git#cedar-14
```

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
The R runtime is vendored into your slug, and includes the gcc compiler for fortran support.

To reference a specific version of the build pack, add the Git branch or tag name to the end of the build pack URL.

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

R packages can also be included in your project source and installed when the `init.r` file is executed.

```
install.packages("optional-path-to-packages/local-r-package-file.tar.gz", repos=NULL, type="source")
```

## R Console
You can also run the R console application as follows:

```
$ heroku run R
```

Type `q()` to exit the console when you are finished.

_Note that the Heroku slug is read-only, so any changes you make during the session will be discarded._

## Scheduling a recurring job
You can use the [Heroku scheduler](https://addons.heroku.com/scheduler) to schedule a recurring R process.

The following command would run `prog.r`:

`R -f ./prog.r --gui-none --no-save`

## Using in your applications
This buildpack can be used in conjunction with other supported language stacks on Heroku by
using the [heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) buildpack.

See the example [test applications](test) which show how to use R from the console and various other examples.

## R Binaries
The binaries used by the buildpack are hosted on AWS S3 at [s3://heroku-buildpack-r](https://heroku-buildpack-r.s3.amazonaws.com).

See the [building guide](support/README.md) for building the R binaries yourself.

## R Versions
Optionally, the R version and buildpack version can be configured by providing a `.r-version` and `.r-buildpack-version` file in the root directory.
These files should contain 1 line of text containing the respective version. See [alternate-versions](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/cedar-14/test/alternate-versions) for an example.

The following versions are available:

### Cedar 10

| R Version | Buildpack Version | Binary |
|-----------|-------------------|--------|
| 2.15.1    | 20131211-0028     | [R-2.15.1-binaries-20131211-0028.tar.gz](https://heroku-buildpack-r.s3.amazonaws.com/cedar/R-2.15.1-binaries-20131211-0028.tar.gz) |
| 3.0.2     | 20140218-0019     | [R-3.0.2-binaries-20140218-0019.tar.gz](https://heroku-buildpack-r.s3.amazonaws.com/cedar/R-3.0.2-binaries-20140218-0019.tar.gz ) |
| 3.1.0     | 20141127-0021     | [R-3.1.0-binaries-20141127-0021.tar.gz](https://heroku-buildpack-r.s3.amazonaws.com/cedar/R-3.1.0-binaries-20141127-0021.tar.gz ) |
| 3.1.2     | 20150301-1046     | [R-3.1.2-binaries-20150301-1046.tar.gz](https://heroku-buildpack-r.s3.amazonaws.com/cedar/R-3.1.2-binaries-20150301-1046.tar.gz ) |

## Caveats
Due to the size of the R runtime, the slug size on Heroku, without any additional packages or program code, is approximately 90Mb.
If additional R packages are installed by the `init.r` script then the slug size will increase.

## Credits
Original inspiration from [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.

## License
MIT License. Copyright (c) 2013 Chris Stefano. See MIT_LICENSE for details.
