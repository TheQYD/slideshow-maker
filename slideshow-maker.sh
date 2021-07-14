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

ffmpeg -pattern_type glob -framerate "1/$slide_duration" -i "$directory_path/*.png" -pix_fmt yuv420p $directory_path"_slideshow".mp4
