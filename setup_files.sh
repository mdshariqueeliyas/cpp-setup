#!/bin/bash

# create directory and corresponding files inside that
# if template file path is passed, then copy contents to .cpp files
# else copy default contents
# name of directory is compulsory parameter
NAME=$1
setup_files() {
    if [ -z "$NAME" ]
    then
        echo "File name must be passed."
        return 1
    else
        # create directory with given name and change directory.
        mkdir -p $NAME
        cd $NAME
        touch $NAME.cpp
        touch $NAME.in
        # copy content of template file contents to cpp file
        cat <<  EOT > $NAME.cpp
/*
*/
#include <bits/stdc++.h>
using namespace std;

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(0);
    // int t;
    // cin >> t;
    // while(t--)
    // {

    // }
    return 0;
}
EOT
    fi
}
setup_files
