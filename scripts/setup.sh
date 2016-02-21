#!/bin/bash 

set -e

if [ `whoami` != 'root' ]; then
  echo $0 must be run as root.
  exit 1
fi

cd `dirname $0`/..

if [ ! `which puppet` ]; then
  apt-get -y install puppet
fi

puppet apply config.pp

npm install
