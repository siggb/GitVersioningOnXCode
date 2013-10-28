#!/bin/sh

#  gitversioning.sh
#  
#
#  Created by sig on 28.10.13.
#

version=$(git rev-parse --verify HEAD | cut -c 1-7)
curdate=$(date +"%d.%m.%y")

filesource="//\n//  GitVersion.h\n//\n//  Created by sig on $curdate.\n//\n\n#ifndef GitVersion_h\n#define GitVersion_h\n\n#define GIT_SHA_VERSION @\"$version\"\n\n#endif"

echo -e "$filesource" > Sources/GitVersion.h
touch Sources/GitVersion.h