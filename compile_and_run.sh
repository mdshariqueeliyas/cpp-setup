#!/bin/bash

CURDIR=$PWD
CPPFILE=$1

echo "CURDIR = "$CURDIR
if [ -z "$1" ]
then
    # compile latest modified c++ file in current directory.
    CPPFILE=$(echo $(ls -alt | grep .cpp | sed -n 1p )| cut -d' ' -f9)
    # echo $CPPFILE
    if [[ ! "$CPPFILE" =~ .*\.cpp$ ]]
    then
        # check if its a c++ file
        echo "No C++ file found in directory to compile : "$CURDIR
        return 1
    fi
else
    # if filename is passed as argument
    if [[ ! "$CPPFILE" =~ .*\.cpp$ ]]
    then
        # check if its a c++ file
        echo "Only C++ files are supported. Please pass C++ file name. Filename passed : "$CPPFILE
        return 1
    else
        # change current directory to directory where c++ file is present
        cd $(dirname $CPPFILE)
    fi
fi

CPPFILENAME=$(echo $CPPFILE | cut -d'.' -f1)
g++ $CPPFILE -o $CPPFILENAME".exe" && ./$CPPFILENAME".exe"
