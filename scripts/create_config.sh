#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pwd=`pwd`

cd $DIR
cd ".." # work from the root directory
redisCount=$1
basePort=6379
configName="redis.conf"
bashConfig="configs/"$configName
dir="bin/cluster_specs/"

rm -rf $dir
mkdir $dir

for index in `seq 0 $(( $redisCount - 1 ))`;
do
	port=$(( $basePort + $index ))
	mkdir $dir$port
	fileName=$dir$port"/"$configName
	echo "port "$port > $fileName
	cat $bashConfig >> $fileName
done

cd $pwd