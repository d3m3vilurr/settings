#!/usr/bin/env bash
while true;
do
    FILE=$(find ~/Pictures/gallery-dl|grep -e "\(jpg\|png\)\$"|shuf|head -n 1)
    ABS_FILE_PATH=$(readlink -f "${FILE}")
    echo ${ABS_FILE_PATH}
    #ln -sf "${ABS_FILE_PATH}" ~/Pictures/wallpaper.jpg
    swaymsg output "*" bg "${ABS_FILE_PATH}" fill
    sleep 900
done
