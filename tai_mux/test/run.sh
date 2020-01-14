#!/bin/sh

TAI_MUX_TEST_DIR=$(dirname $1)

if [[ -d $TAI_MUX_TEST_DIR ]]
then
    cd $TAI_MUX_TEST_DIR
fi
LD_LIBRARY_PATH=.
TAI_MUX_PLATFORM_ADAPTER=static TAI_MUX_STATIC_CONFIG_FILE=./$(basename $1) \
./test
