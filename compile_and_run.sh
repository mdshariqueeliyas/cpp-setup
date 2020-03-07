#!/bin/bash

CURDIR=$PWD
CPPFILE=$1
compile_and_run() {
    if [ -z "$CPPFILE" ]
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
            CPPFILE=$(basename -- $CPPFILE)
        fi
    fi

    CPPFILENAME=$(echo $CPPFILE | cut -d'.' -f1)

    if [ ! -f $CPPFILENAME".in" ]
    then
        # if input file doesn't exists create empty input file.
        echo "Creating empty input file " $CPPFILENAME".in"
        touch $CPPFILENAME".in"
    fi

    echo "Compiling "$CPPFILE" ..." &&

    g++ $CPPFILE -o $CPPFILENAME".exe" &&
    echo "Running " $CPPFILENAME".exe ..." &&
    ./$CPPFILENAME".exe" < $CPPFILENAME".in" > $CPPFILENAME".out" &&
    echo "OUTPUT :\n" &&
    cat $CPPFILENAME".out"
}
compile_and_run
