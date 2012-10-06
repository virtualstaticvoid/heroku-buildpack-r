# Building R binaries for buildpack

The binaries for the build pack can be built using Heroku's [vulcan](https://github.com/heroku/vulcan) build server.

## Steps for building R on vulcan
Create a build server using vulcan:

```
vulcan create vulcan-build-r
```

Where `vulcan-build-r` is the name of the Heroku application created.

Initiate the build by running the [`vulcan-build`](../../master/support/vulcan-build) executable script:

```
$ ./vulcan-build
```

The [build-r](../../master/support/build-r) script will be uploaded to the vulcan build server and executed.
The R sources and dependencies are downloaded and compiled, and the binary output downloaded.
During the build process, the outputs from `configure` and `make` will be displayed in the console.

## Notes
* To configure the R version to build, edit the `rversion` variable in the [vulcan-build](../../master/support/vulcan-build) file.
* The binaries output file must be uploaded to S3.
* Update the path in the [compile](../../master/bin/compile#L20) file for your S3 bucket name and path.

## Credits
Build script inspired by [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.
