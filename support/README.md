# Building R binaries for the buildpack

This directory contains the files necessary for building the R binaries to be used with the buildpack.  The binaries for the buildpack can be built using a Vagrant virtual machine.

## Steps for building R with Vagrant
### Set-up
* Download and install Vagrant, http://www.vagrantup.com/
* Update the build-r.config file.  This file is what determines the version and url of the source files that will be used by the build.  When the build starts, a "heroku-buildpack-r/support/sources/"" directory will be created and the source files will be downloaded to this directory.

### Build
* Start the Vagrant virtual machine.

```
$ vagrant up
```

* Run the build

```
$ vagrant ssh -c "cd /vagrant && ./build-r &> build-r.log"
```

* Alternatively the build can be run by SSH'ing into Vagrant

```
$ vagrant ssh
$ cd /vagrant/
$ ./build-r
```
### Post build steps
* The output of the build will placed in "heroku-buildpack-r/support/output/".  
* Upload the zip file in the "heroku-buildpack-r/support/output/" folder to S3.
* Set the S3 permissions on the uploaded zip file to Public.
* Update the R binaries URL and version information in the configuration settings section of the bin/compile file:

```
 ###################################################
 # >>> CONFIGURABLE SETTINGS, change as appropriate
 ###################################################
 R_BINARIES="https://s3.amazonaws.com/r-buildpack/R-3.1.0-binaries-20140625-1902.tar.gz"

 R_VERSION="3.1.0"
 GCC_VERSION="4.3"
 GLIBC_VERSION="2.7"
 ###################################################
 # <<< END CONFIGURABLE SETTINGS
 ###################################################
```

## Notes
If wanting to test the R build from within the Vagrant virtual machine, this can be done by SSH'ing into the virtual machine and setting a few environment variable, i.e.
```
$ vagrant ssh
$ cd /vagrant/
$ export PATH=/app/vendor/R/bin:/app/vendor/gcc-4.3/bin:$PATH
$ export LDFLAGS="-L/app/vendor/gcc-4.3/lib64/"
$ export CPPFLAGS="-I/app/vendor/glibc-2.7/string/ -I/app/vendor/glibc-2.7/time"
$ export R_HOME=/app/vendor/R/lib64/R
$ export R_INCLUDE=/app/vendor/R/lib64/R/include
```

Now the R build can be run and tested on the virtual machine, i.e.
```
$ R()
```

Once R has started, it can be used as normal from within the virtual machine, i.e.
```
install.packages('ggplot2')
library(ggplot2)
head(diamonds)
p <- ggplot(data = diamonds, aes(x = carat, y = price, colour = cut)) + layer(geom = "point")
p <- p + layer(geom = "point")
ggsave("plot.svg")
```

## Credits
Build script inspired by [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.
