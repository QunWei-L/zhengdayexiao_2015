#!/usr/bin/env bash
# Run E2E tests

#install packages
# npm install

#clear log
rm -rf ss.log

#start selenium server
now=$(date +"%T")
echo "start time : $now"
./node_modules/.bin/selenium-standalone start > ss.log &
sleep 5
now=$(date +"%T")
echo "start time : $now"

#run  jasmine tests
./node_modules/.bin/wdio wdio.conf.js

#stop selenium server
ps -ef | grep node_modules/selenium-standalone | awk '{print $2}' | xargs kill -9

#stop bootRun server
ps -ef | grep 8_CI_With_Jenkins/ci-sample | awk '{print $2}' | xargs kill -9
