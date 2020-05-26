#!/bin/bash

set -e # fail fast

heroku addons:create heroku-postgresql:hobby-dev
