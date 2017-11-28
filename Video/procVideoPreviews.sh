# Arugs:
#    $1: Video
#    $2: Ouput path
# 
# Output:
#
# Parameters:

generateVideoPreviews()
{
	preview_count=10
	output_type="jpg"
	scale_conf="-vf scale=600:600:force_original_aspect_ratio=decrease"
	#scale_conf=
	duration=`ffprobe -i $1 -show_format -v quiet |sed -n 's/duration=//p'`
	echo "$duration"
	step=`echo print $duration/$preview_count. | bc`
	echo "$step"
	echo "duration = $duration, step = $step"

	for((i=0;i<($preview_count);i=i+1))
	do
		ss_time=`echo print $step*$i. | bc`
		echo "Generate video preview at the duration $ss_time sec"
		gen_preview_cmd="ffmpeg -loglevel warning -y -ss $ss_time -i $1 -frames:v 1 -q:v 2 $scale_conf $2/$1.preview$i.$output_type"
		#echo "$gen_preview_cmd"
		echo `$gen_preview_cmd`
	done
}

generateVideoPreviews $1 $2
source ./genGifPreview.sh
generateGifPreview $1 $2
source ./genTilePreview.sh
generateTilePreview $1 $2
