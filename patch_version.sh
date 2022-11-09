#!/bin/bash

set -e

VER=$1

cd src/ver

sed -i "s/v1.x-dev/${VER}/" CMakeLists.txt

# check the patch
cat CMakeLists.txt
