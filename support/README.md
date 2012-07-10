# Building R binaries for buildpack

The binaries for the build pack can be built using Heroku's [vulcan](https://github.com/heroku/vulcan) build server.

## Steps for building R on vulcan
Create a build server using vulcan:

```
vulcan create vulcan-build-r
```

Where `vulcan-build-r` is the name of the Heroku application created.

Add your AWS id and security token to the Heroku application configuration variables:

```
heroku config:add AWS_ID=XXXXXXXXXXXXXXXXXXXX AWS_SECRET=XXXXXXXXXXXXXXXXXXXX
```

Initiate the build by running the [`vulcan-build`](vulcan-build) executable script:

```
$ ./vulcan-build
```

The [build-r](build-r) script will be uploaded to the vulcan build server and executed. 
The R sources and dependencies are downloaded and compiled, and the binary output is uploaded to S3.
During the build process, the outputs from `configure` and `make` will be displayed.

## Notes
To configure the build prefix and S3 bucket used, edit the variables in the [vulcan-build](vulcan-build) file.

## Credit
Build script inspired by [Noah Lorang's Rook on Heroku](https://github.com/noahhl/rookonheroku) project.
