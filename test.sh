#!/bin/sh

PROJECT=$1
DEVICE=$2
DEVELOPER_KEY=$3
OUTPUT=$4
TYPE_CHECK=$5

mkdir -p $(dirname $OUTPUT)

java \
    -jar /connectiq/bin/monkeybrains.jar \
    -d $DEVICE \
    -o $OUTPUT \
    -f $PROJECT \
    -y $DEVELOPER_KEY \
    -w -l $TYPE_CHECK