#!/bin/bash

set -e

VER=$1

cd src/ver

sed -i "s/1.x-dev/${VER}/" CMakeLists.txt
