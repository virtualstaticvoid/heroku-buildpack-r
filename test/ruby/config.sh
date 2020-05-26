#!/bin/bash

set -e # fail fast

heroku buildpacks:add https://github.com/heroku/heroku-buildpack-ruby.git
