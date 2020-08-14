#! /bin/bash

HEXE=$1
FN=$2

convert -size 100x100 xc:${HEXE} img/${FN}.png
