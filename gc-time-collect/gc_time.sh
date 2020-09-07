#! /bin/bash

target=$1

cur=`pwd`

echo "pause time"
${cur}/spark-gc-time-collect-pause.py ${target}

echo "real time"
 ${cur}/spark-gc-time-collect-real.py ${target}

