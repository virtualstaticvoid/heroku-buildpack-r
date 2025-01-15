#!/bin/bash

set -e # fail fast

heroku addons:create heroku-postgresql:essential-0
