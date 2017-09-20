#!/bin/sh
BASEDIR=$(dirname $0)

PLATFORM=$($BASEDIR/../utils/detectPlatform.py)
IFS=' ' read -ra PLATFORM <<<"$PLATFORM"

PLATFORM_DIST=${PLATFORM[0]}
PLATFORM_VER=${PLATFORM[1]}

make -C $BASEDIR/$PLATFORM_DIST repository
