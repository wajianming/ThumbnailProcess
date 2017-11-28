#Input Args:
#  $1: Video name
#  $2: Output dir
#Output:
#  $2/$1.tile.gif
generateTilePreview(){
	input_image="$2/$1.preview%d.jpg"
	output_image="$2/$1.tile.jpg"

	ffmpeg -y -i $input_image -filter_complex scale=600:-1,tile=5x2 $output_image
}
