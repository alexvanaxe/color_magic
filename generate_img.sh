#! /bin/bash

HEXE=$1
FN=$2

DIR=$3

convert -size 100x100 xc:${HEXE} $DIR/${FN}.png
