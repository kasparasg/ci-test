#!/bin/bash

set -ex

# Ensure that all the dependencies are there
npm install

# Ensure that the chromeDriver is installed
npm run update-webdriver

# Start up the web server
node_modules/.bin/http-server ./app -a localhost -p 8000 -c-1 --silent &
WEBSERVER_PID=$!

node_modules/.bin/karma start karma.conf.js --single-run
node_modules/.bin/protractor e2e-tests/protractor.conf.js --directConnect
