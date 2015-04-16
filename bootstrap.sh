#!/usr/bin/env bash

apt-get update
apt-get install -y maven maven2 git default-jdk
git clone http://stash-projects.arin.net:7990/scm/rrr/code.git
cd code
mvn package -e
