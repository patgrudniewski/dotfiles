#! /bin/sh

which chsh &> /dev/null
if [ "$?" == '0' ]; then
    DEPS="chsh $DEPS"
fi

if [ -z "$DEPS" ]; then
    ../utils/install.sh $DEPS
fi
