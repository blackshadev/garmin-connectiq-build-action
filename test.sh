#!/bin/sh

PROJECT=$1
DEVICE=$2
DEVELOPER_KEY=$3
OUTPUT=$4
TYPE_CHECK=$5
EXTRA_ARGS=$6

mkdir -p "$(dirname "$OUTPUT")"

set -- \
    -jar /connectiq/bin/monkeybrains.jar \
    -d "$DEVICE" \
    -o "$OUTPUT" \
    -f "$PROJECT" \
    -y "$DEVELOPER_KEY" \
    -w -l "$TYPE_CHECK"

if [ -n "$EXTRA_ARGS" ]; then
    set -- "$@" $EXTRA_ARGS
fi

java "$@"