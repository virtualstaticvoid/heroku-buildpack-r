#!/bin/bash

set -e
set +u
# set -x # debug

HEROKU_STACK=${1:-18}
BUILDPACK_VERSION=${2:-latest}
BRANCH=${BUILDPACK_BRANCH:-$(git rev-parse --abbrev-ref HEAD)}

topic() {
  echo "-----> $*"
}

indent() {
  sed -u 's/^/       /'
}

run_tests() {

  # R test?
  if [ -f "test.R" ]; then
    topic "Running 'test.R'..."
    heroku run R --no-save --file=test.R 2>&1 | indent
  fi

  # shell test?
  if [ -f "test.sh" ]; then
    topic "Running 'test.sh'..."
    bash test.sh 2>&1 | indent
  fi

}

#----------------------------------------------------------------------

topic "Running $(basename $(pwd)) test..."

# create a temporary directory and copy the test application
dir=$(mktemp -d)

# copy test sources
cp -r . $dir > /dev/null
pushd $dir > /dev/null

echo $(pwd) | indent

# commit to git for push to heroku
git init -b main -- > /dev/null
git config user.name "Test"
git config user.email "test@example.com"
echo "*.log" >> .gitignore
git add --all
git commit -m "initial" --no-gpg-sign > /dev/null

# create the app with shell buildpack
heroku create --stack heroku-${HEROKU_STACK} \
              --buildpack https://github.com/virtualstaticvoid/heroku-buildpack-r.git#${BRANCH} 2>&1 | indent

# set the version to use
if [ ! "$BUILDPACK_VERSION" == "latest" ]; then
  heroku config:set BUILDPACK_VERSION="$BUILDPACK_VERSION"
fi

# set debug on?
if [ "$BUILDPACK_DEBUG" == "1" ]; then
  heroku config:set BUILDPACK_DEBUG=1
fi

# package installation?
if [ "$PACKAGE_INSTALL_VERBOSE" == "1" ]; then
  heroku config:set PACKAGE_INSTALL_VERBOSE=1
fi

# get app name (so it can be destroyed)
app=$(heroku apps:info -j | jq -r '.app.name')

# uncomment for debugging
# heroku config:set BUILDPACK_DEBUG=1

# config script?
if [ -f "config.sh" ]; then
  topic "Running 'config.sh'..."
  bash config.sh 2>&1 | indent
fi

#----------------------------------------------------------------------
# test the deployment

topic "Deploying test"
git push heroku main 2>&1 | indent

# wait for release to complete
heroku ps:wait --wait-interval=20 2>&1 | indent

run_tests

#----------------------------------------------------------------------
# deploy again

topic "Deploying test update"

# fake an update
git commit -m "update" --allow-empty --no-gpg-sign > /dev/null

git push heroku main 2>&1 | indent

# wait for release to complete
heroku ps:wait --wait-interval=20 2>&1 | indent

run_tests

#----------------------------------------------------------------------

topic "Test completed. Check outputs for any errors."

# clean up
heroku destroy $app --confirm $app > /dev/null

popd &> /dev/null
rm -rf $dir
