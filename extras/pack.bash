#!/bin/bash -ex

#  pack.*.bash - Bash script to help packaging samd core releases.
#  Copyright (c) 2015 Arduino LLC.  All right reserved.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# BUILD_NUMBER=$1
CURR_TIME=`date "+%Y-%m-%d %H:%M"`
CURR_TIME_SED=`date "+%Y\\-%m\\-%d %H:%M"`
VERSION=`grep version= platform.txt | sed 's/version=//g'`

PWD=`pwd`
FOLDERNAME=`basename $PWD`
THIS_SCRIPT_NAME=`basename $0`
FILENAME=package_l.raumschiffbau-${VERSION}.tar.bz2

rm -f $FILENAME

# Change name in platform.txt
# sed -i "s/name=.*/name=Telemetry-PCB (${CURR_TIME})/" platform.txt

cd ..
tar --transform "s|$FOLDERNAME|telemetry-${VERSION}|g"  --exclude=extras/** --exclude=publish/** --exclude=.git* --exclude=.idea -cjf $FILENAME $FOLDERNAME
cd -

mv ../$FILENAME publish

CHKSUM=`sha256sum publish/$FILENAME | awk '{ print $1 }'`
SIZE=`wc -c publish/$FILENAME | awk '{ print $1 }'`

cat extras/package_index.json.template |
sed "s/%%CURR_TIME%%/${CURR_TIME_SED}/" |
sed "s/%%VERSION%%/${VERSION}/" |
sed "s/%%FILENAME%%/${FILENAME}/" |
sed "s/%%CHECKSUM%%/${CHKSUM}/" |
sed "s/%%SIZE%%/${SIZE}/" > publish/package_l.raumschiffbau_index.json

