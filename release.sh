#!/bin/bash
# Copyright 2017 Seth Kenlon

## GPLv3
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or (at
#your option) any later version.
#
#This program is distributed in the hope that it will be useful, but
#WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

ARG="${1}"
VERBOSE=false
RELEASE=false
BUILD=false
CLEAN=false

function help() {
    echo "Increment version and release:" 
    echo " "
    echo "-h, --help     Print this help and exit."
    echo "-r, --release  Git tag, build, and release."
    echo "-n, --no-build Do not build."
    echo "-c, --clean    Do not build or release. Remove temp files."
}

function release() {
    COM=`git rev-list --tags --max-count=1`
    FUL=`git describe --tags $COM`
    MIN=`echo $FUL | rev | cut -b1`
    ADD=`echo $MIN + 1 | bc`
    MAX=`echo $FUL | cut -f -2 -d"."`
    REL=`echo "$MAX"."$ADD"`
    
    git add dist
    git commit -m "release ${REL}"
    git tag -a "${REL}" -m "release ${REL}" || exit 1
    echo "Check things over. If everything is OK, push to git repo:"
    echo "  $ git push origin HEAD"
    echo "  $ git push --tag"
}

function clean() {
    /usr/bin/rm -rf tmp
    echo "Clean."
}

function main() {
    publican build --publish --langs=en-US --formats=pdf --pub_dir=dist
}


if [ -z "${1}" ]; then
    help
    exit
elif [ "${1}" == "-h" -o "${1}" == "--help" ]; then
    help
    exit
fi

while [ True ]; do
if [ "${1}" == "-v" -o "${1}" == "--verbose" ]; then
    VERBOSE=true
    shift 1
elif [ "${1}" == "-r" -o "${1}" == "--release" ]; then
    BUILD=true
    RELEASE=true
    shift 1
elif [ "${1}" == "-b" -o "${1}" == "--build-only" ]; then
    BUILD=true
    RELEASE=false
    shift 1
elif [ "${1}" == "-c" -o "${1}" == "--clean" ]; then
    CLEAN=true
    shift 1
else
    break
fi
done

if [ $BUILD == true ]; then
    main
fi

if [ $RELEASE == true ]; then
    release
fi

if [ $CLEAN == true ]; then
    clean
fi

#echo "you chose ${ARG}"
