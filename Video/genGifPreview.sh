#!/bin/sh

#palette="/tmp/palette.png"

#ffmpeg -v warning -f image2 -i image%d.png -vf "$filters,palettegen" -y $palette
#ffmpeg -framerate 1 -v warning -f image2 -i image%d.jpg -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2

#Input:
#  Arg 1: Video file name. (xxx.mp4)
#  Arg 2: Output directory. (abcd/)
#Output:
#  Arg2/Arg1.preview.gif (abcd/xxx.mp4.preview.gif)
#
generateGifPreview(){
	palette="$2/$1.palette.png"
	filters="fps=20"
	input_image="$2/$1.preview%d.jpg"
	ffmpeg -y -v warning -f image2 -i $input_image -vf "$filters,palettegen" -y $palette
	ffmpeg -y -framerate 0.5 -v warning -f image2 -i $input_image -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2/$1.preview.gif
}
