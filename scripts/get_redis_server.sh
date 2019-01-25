#!/bin/bash

# Script to get latest version of redis-server

file="unstable.zip"
folder="redis-unstable"

wget "https://github.com/antirez/redis/archive/unstable.zip"

unzip $file
cd $folder
make

cd "../"
mv $folder/src/redis-server .
rm -rf $folder $file
