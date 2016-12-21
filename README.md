# Heroku buildpack: R

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for applications which use
[R](http://www.r-project.org/) for statistical computing and [CRAN](http://cran.r-project.org/) for R packages.

R is ‘GNU S’, a freely available language and environment for statistical computing and graphics which provides
a wide variety of statistical and graphical techniques: linear and nonlinear modelling, statistical tests, time
series analysis, classification, clustering, etc. Please consult
the [R project homepage](http://www.r-project.org/) for further information.

[CRAN](http://cran.r-project.org/) is a network of ftp and web servers around the world that
store identical, up-to-date, versions of code and documentation for R.

It also includes support for the [Shiny](https://shiny.rstudio.com/) web application framework.

To use this version, the buildpack URL is `http://github.com/virtualstaticvoid/heroku-buildpack-r.git#cedar-14-chroot`.

_NOTE: This is the `chroot` version._

## Usage

The buildpack will detect your app makes use of R if it has an `init.R` or `run.R` file in the root directory.

If only a `run.R` file is found, then the buildpack will be configured as a Shiny application.

The R runtime is vendored into your slug, and the `init.R` program is executed in order to install any additional R packages.

### Process Types

The buildpack includes the following default process types:

* R: Executes `R` in the chroot context
* web: Executes `run.R` to run Shiny in the chroot context
* console: Executes `bash` in the chroot context, if needed for debugging.

### Fake Chroot

This version of the buildpack uses a fake chroot in order to properly support R on Heroku. This is because R presents some unique challenges when used on Heroku. Checkout the comments in [`bin/compile`] for more details.

The directory layout of the buildpack places the chroot in `/app/.root` and symlinks `/app` into `/app/.root/app` so that file paths are unaffected.

*NB*: If your application provides a `Procfile` or provides it's own process types, you will need to include the `fakechroot fakeroot chroot` command with the chroot path `/app/.root`, to execute R correctly. See [rserve](test/rserve/Procfile) for an example.

For example, this command runs R within the chroot context:

`fakechroot fakeroot chroot /app/.root /usr/bin/R --no-save`

*NOTE:* During tests of the buildpack, the `normalizePath` R function failed for the symlinked `/app` path within the chroot context, so it is overridden in the [Rprofile.site](bin/Rprofile.site) file in order to work correctly, however YMMV if you use additional symlinks within `/app` of your application.

### Installing R Packages

The `init.R` file is executed during slug compilation, so it can be used to install R packages if required.

The following file can be used to install packages if they aren't already installed. Add the package names you want to install to the `my_packages` list:

```
# init.R
#
# Example R code to install packages if not already installed
#

my_packages = c("package_name_1", "package_name_2", ...)

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))
```

R packages can also be installed, by providing a `tar.gz` package archive file, if a specific version is required, or it is not a published package. See [local-packages](test/local-packages) for an example.

```
# init.R
#
# Example R program to installed package from local path
#

install.packages("/app/PackageName-Version.tar.gz", repos=NULL, type="source")
```

*NOTE:* The path to the package archive needs to be an absolute path, based off the `/app` root path, which is the location of your applications files on Heroku.

### Installing Package Dependencies

If the R packages have binary dependencies, they can be specified by providing an `Aptfile` which contains the Ubuntu package names to install.

Examples include [gmp](test/gmp/Aptfile), [rgeos](test/rgeos/Aptfile) and [topicmodels](test/topicmodels/Aptfile) where Ubuntu packages are installed during slug compilation.

This is based on the same technique as used by the [heroku-buildpack-apt](https://elements.heroku.com/buildpacks/heroku/heroku-buildpack-apt) buildpack.

### Shiny Applications

Shiny applications must provide the `run.R` file, but can also include an `init.R` in order to install additional R packages. The Shiny package does not need to be installed, as it is included in the buildpack already.

The `run.R` file should contain at least the following code, in order to run the web application. The `PORT` environment variable, provided by Heroku, is used to configure Shiny accordingly, and the host should be `0.0.0.0`.

```
library(shiny)

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = as.numeric(port)
)
```

## R Console

You can run the R console application as follows:

```
$ heroku run R
```

Type `q()` to exit the console when you are finished.

_Note that the Heroku slug is read-only, so any changes you make during the session will be discarded._

## Scheduling a Recurring Job

You can use the [Heroku scheduler](https://addons.heroku.com/scheduler) to schedule a recurring R process.

The following command would run `prog.r`:

`fakechroot fakeroot chroot /app/.root /usr/bin/R -f ./prog.r --gui-none --no-save`

## Multiple Buildpacks

This buildpack can be used in conjunction with other supported language stacks on Heroku by using multiple buildpacks. See [Using Multiple Buildpacks for an App](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app).

See the [ruby](test/ruby) application which shows how to use R together with a Ruby Sinatra web application and the [`rinruby`](https://rubygems.org/gems/rinruby) gem.

## R Versions

The buildpack uses R 3.3.2 by default, however it is possible to use a different version if required. This is done by providing a `.r-version` file in the root directory, which contains the R version to use.

The following R versions are supported:

* 3.1.3
* 3.2.5
* 3.3.2

## Buildpack Versions

To reference a specific version of the buildpack, add the Git branch or tag name to the end of the build pack URL when creating or configuring your Heroku application.

E.g. Replace `branch_or_tag_name` with the desired branch or tag name:

```
$ heroku create --stack cedar-14 \
    --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git#branch_or_tag_name
```

*NOTE:* The `.buildpack-version` file is no longer supported and will be ignored.

## Buildpack Binaries

The binaries used by the buildpack are hosted on AWS S3 at [https://heroku-buildpack-r.s3.amazonaws.com](https://heroku-buildpack-r.s3.amazonaws.com).

See the [heroku-buildpack-r-build](https://github.com/virtualstaticvoid/heroku-buildpack-r-build) repository for building the R binaries yourself.

## Caveats

Due to the size of the R runtime, the slug size on Heroku, without any additional packages or program code, is approximately 106Mb.
If additional R packages are installed then the slug size will increase.

## Credits

* Original inspiration from [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.
* [heroku-buildpack-apt](https://elements.heroku.com/buildpacks/heroku/heroku-buildpack-apt) buildpack.
* [heroku-buildpack-fakesu](https://github.com/fabiokung/heroku-buildpack-fakesu) buildpack.
* [fakechroot](https://github.com/dex4er/fakechroot)

## License

MIT License. Copyright (c) 2013 Chris Stefano. See MIT_LICENSE for details.
