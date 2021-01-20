#! /bin/bash

. ./color_sort.sh

wallpaper="$(<~/wallpaper.txt)"

colors_lum=($(get_wall_colors "${wallpaper}"))
#color_test="${colors_lum[$((${#colors_lum}-2))]}"
#color_test="95BCC7"

#echo "${color_test}"

black_or_white "${wallpaper}"
