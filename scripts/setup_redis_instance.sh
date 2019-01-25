#!/bin/bash

redisCount=$1
basePort=6379
configName="redis.conf"
bashConfig="../../../configs/"$configName
dir="cluster_specs"

rm -rf $dir; mkdir $dir
cd $dir

for index in `seq 0 $(( $redisCount - 1 ))`;
do
	port=$(( $basePort + $index ))
	mkdir $port
	cd $port
	echo "port "$port > $configName
	cat $bashConfig >> $configName
	cd "../"
done