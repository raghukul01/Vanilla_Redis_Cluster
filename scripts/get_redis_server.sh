#!/bin/bash

# Script to get latest version of redis-server
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pwd=`pwd`

cd $DIR
cd ".." # work from the root directory
file="unstable.zip"
folder="redis-unstable"

wget "https://github.com/antirez/redis/archive/unstable.zip"

unzip $file
cd $folder
make

cd "../"
mv $folder/src/redis-server "bin/"
rm -rf $folder $file

cd $pwd
