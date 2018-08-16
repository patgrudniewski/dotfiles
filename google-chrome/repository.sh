#! /bin/sh
BASEDIR=$(realpath $(dirname $0))

PLATFORM=$($BASEDIR/../utils/detectPlatform.py)
IFS=' ' read -ra PLATFORM <<<"$PLATFORM"

PLATFORM_DIST=$(echo ${PLATFORM[0]} | perl -ne 'print lc')
PLATFORM_VER=${PLATFORM[1]}

make -C $BASEDIR/$PLATFORM_DIST repository
