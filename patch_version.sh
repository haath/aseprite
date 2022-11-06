#!/bin/bash

VER=$1

cd src/ver

sed -i "s/v1.x-dev/${VER}/" CMakeLists.txt
