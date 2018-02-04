#!/bin/sh
BASEDIR=$(dirname $0)

PLATFORM=$($BASEDIR/detectPlatform.py)
if [ $? != '0' ]; then
    exit 11
fi

IFS=' ' read -ra PLATFORM <<<"$PLATFORM"

PLATFORM_DIST=${PLATFORM[0]}

INSTALLER=sudo

case $PLATFORM_DIST in
    fedora|Fedora)
        INSTALLER+=" dnf install -y"
        ;;
    Amazon)
        INSTALLER+=" yum install -y"
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
        POST_INSTALL+="$PACKAGE_POST_INSTALL; "
    fi

    PACKAGES+=" $($BASEDIR/packageResolver.php $PLATFORM_DIST $1)"
    if [ $? != '0' ]; then
        exit 12
    fi

    shift
done

$INSTALLER $PACKAGES
eval "$POST_INSTALL"
