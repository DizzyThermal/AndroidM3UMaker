#!/bin/bash

M3U_PATH=${1}
M3U_PATH="$(adb shell readlink -f ${M3U_PATH})"
M3U_PATH=$(echo $M3U_PATH | sed "s/\r//")/

MP=$(echo $M3U_PATH | sed "s@/mnt/shell@/storage@");

while read line; do
	echo "${MP}$line" >> Music.m3u;
done < <(adb shell ls ${M3U_PATH})

adb push Music.m3u $M3U_PATH;