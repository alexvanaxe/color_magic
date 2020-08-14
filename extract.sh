#! /bin/bash

. color_sort.sh
mkdir img
rm -rf ./img/*
wallpaper=$(cat ~/wallpaper.txt)


colors=($(convert "${wallpaper}" -format %c -depth 8 -colors 15 histogram:info:- | sort -n | grep -o "#......"))


# colors_lum=($(order_list $colors))

colors_lum=($(order_list $colors))


count=0
echo -e ${colors_lum[@]} | sort -n
echo -e ${colors_lum[@]}  | sort -n | awk '{print $2}'

for corsort in $(echo -e ${colors_lum[@]}  | sort -n | awk '{print $2}'); do
    ./generate_img.sh "${corsort}" "$(printf %02d $count)_${corsort}"
    count=$(( count + 1 ))
done
#
