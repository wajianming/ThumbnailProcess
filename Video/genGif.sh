prop_fps=$2
ffmpeg -y -ss 30 -t 3 -i $1 \
-vf fps=10,scale=320:-1:flags=lanczos,palettegen $1.png

ffmpeg -ss 30 -t 3 -i $1 -i $1.png -filter_complex \
"fps=$prop_fps,scale=600:-1:flags=lanczos[x];[x][1:v]paletteuse" $1.$prop_fps.gif
