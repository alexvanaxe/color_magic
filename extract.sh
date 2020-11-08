#! /bin/bash

. color_sort.sh
mkdir img
mkdir img_unsorted
rm -rf ./img/*
rm -rf ./img_unsorted/*

wallpaper=$1
if [ -z "$wallpaper" ]; then
    wallpaper=$(cat ~/wallpaper.txt)
fi

echo $wallpaper


colors_lum=($(get_wall_colors $wallpaper))


colors_unsorted=($(convert "${wallpaper}" -scale 50x50! -depth 3 +dither -colors 15 -format "%c" histogram:info: | grep -o "#......"))


echo ${colors_lum[@]}


count=0
for corsort in $(echo -e ${colors_unsorted[@]}); do
    ./generate_img.sh "${corsort}" "$(printf %02d $count)_${corsort}" "./img_unsorted"
    
    count=$(( count + 1 ))
done

count=0
for corsort in $(echo -e ${colors_lum[@]}); do
    ./generate_img.sh "#${corsort}" "$(printf %02d $count)_${corsort}" "./img"
    count=$(( count + 1 ))
done
##

#echo "COLOR:"
#echo $(black_or_white $colors 11)

