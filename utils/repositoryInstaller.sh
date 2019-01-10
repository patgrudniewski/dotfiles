#! /bin/sh
BASEDIR=$(realpath $(dirname $0))

PLATFORM=$($BASEDIR/detectPlatform.py)
IFS=' ' read -ra PLATFORM <<<"$PLATFORM"

PLATFORM_DIST=$(echo ${PLATFORM[0]} | perl -ne 'print lc')
PLATFORM_VER=${PLATFORM[1]}

make -C $BASEDIR/../$1/$PLATFORM_DIST repository
