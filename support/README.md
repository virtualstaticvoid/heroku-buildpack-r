# Building the R binaries for buildpack

The binaries for the build pack can be built using a regular Heroku application as the build server.
Testing and debugging of the build process can also be performed using a Vagrant instance similar to the cedar stack of Heroku.

## Steps for building R on Heroku

_TBD_

## Steps for building R on Vagrant

_TBD_

## Notes
* To configure the R version to build, edit the `rversion` variable in the [vulcan-build](../../master/support/vulcan-build) file.
* The binaries output file must be uploaded to S3.
* Update the path in the [compile](../../master/bin/compile#L20) file for your S3 bucket name and path.

## Credits
Build script inspired by [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.
