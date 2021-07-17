#!/bin/bash

# Parse Arguments
while getopts p:d: flag
do
  case "${flag}" in
    p) directory_path=${OPTARG};;
    d) slide_duration=${OPTARG};;
  esac
done


# Print Arguments
# echo "directory_path: $directory_path"
# echo "slide_duration: $slide_duration"

cd $directory_path
mkdir remuxed

for i in *.*; do
  ffmpeg -hwaccel videotoolbox -i "$i" -c copy -map 0:v\
    -pix_fmt yuv420p\
    -pattern_type glob\
    -framerate "1/$slide_duration" "remuxed/remuxed.mp4";
done



#ffmpeg -pattern_type glob\
#  -framerate "1/$slide_duration"\
#  -i "$directory_path"\
#  -pix_fmt yuv420p $directory_path"_slideshow".mp4
