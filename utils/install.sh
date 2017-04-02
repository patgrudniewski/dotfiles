#!/bin/sh
BASEDIR=$(dirname $0)

PLATFORM=$($BASEDIR/detectPlatform.py)
IFS=' ' read -ra PLATFORM <<<"$PLATFORM"

PLATFORM_DIST=${PLATFORM[0]}
PLATFORM_VER=${PLATFORM[1]}

INSTALLER=sudo

case $PLATFORM_DIST in
    fedora)
        INSTALLER+=" dnf install -y"
        ;;
esac

$INSTALLER $@
