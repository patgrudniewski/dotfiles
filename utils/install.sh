#!/bin/sh
BASEDIR=$(dirname $0)

PLATFORM=$($BASEDIR/detectPlatform.py)
if [ $? != '0' ]; then
    exit 11
fi

for PART in $(echo $PLATFORM | tr ' ' "\n"); do
    PLATFORM_DIST=$PART
    break
done

INSTALLER=sudo

case $PLATFORM_DIST in
    fedora)
        INSTALLER="$INSTALLER dnf install -y"
        ;;
    Amazon)
        INSTALLER="$INSTALLER yum install -y"
        ;;
    alpine)
        INSTALLER="$INSTALLER apk add"
        ;;
    *)
        echo "Platform $PLATFORM_DIST is not supported by this script"
        exit 1
        ;;
esac

PACKAGES=
POST_INSTALL=
while [ $# -gt 0 ]; do
    PACKAGE_POST_INSTALL=$($BASEDIR/postInstallActionResolver.php $1)
    if [ -n "$PACKAGE_POST_INSTALL" ]; then
        POST_INSTALL="$POST_INSTALL $PACKAGE_POST_INSTALL; "
    fi

    PACKAGES="$PACKAGES $($BASEDIR/packageResolver.php $PLATFORM_DIST $1)"
    if [ $? != '0' ]; then
        exit 12
    fi

    shift
done

$INSTALLER $PACKAGES
eval "$POST_INSTALL"
