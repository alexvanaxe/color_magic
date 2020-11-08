#! /bin/bash

. color_sort.sh
mkdir img
mkdir img_hsv
rm -rf ./img/*
rm -rf ./img_hsv/*

wallpaper=$1
if [ -z "$wallpaper" ]; then
    wallpaper=$(cat ~/wallpaper.txt)
fi

echo $wallpaper

#colors=($(convert "${wallpaper}" +dither -colors 15 -define histogram:unique-colors=true -format "%c" histogram:info: | grep -o "#......"))

colors=($(convert "${wallpaper}" -scale 50x50! -depth 3 +dither -colors 15 -format "%c" histogram:info: | grep -o "#......"))

colors_lum=($(order_list $colors))
#order_list $colors

#colors_hsv=($(convert "${wallpaper}" -format %c -depth 3 -colors 15 -colorspace HSL histogram:info:- | awk '{print $3,$4}' OFS="-" ORS="\n"))


#ordered_hsv=$(order_color_hsv "${colors_hsv[@]}")

#echo -e ${colors_sort_hsv[@]} | sort -n



count=0
#echo -e ${ordered_hsv}
echo -e ${colors_lum[@]} | sort -n
#echo -e ${colors_lum[@]}  | sort -n | awk '{print $2}'

#for corsort in $(echo -e ${ordered_hsv[@]}); do
    #./generate_img.sh "${corsort}" "$(printf %02d $count)_${corsort}"
    #count=$(( count + 1 ))
#done

for corsort in $(echo -e ${colors_lum[@]}  | sort -n | awk '{print $2}'); do
    ./generate_img.sh "${corsort}" "$(printf %02d $count)_${corsort}"
    count=$(( count + 1 ))
done
##

echo "COLOR:"
#echo $(black_or_white $colors 11)

