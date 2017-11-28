# Create Video Thumbnail using FFmpeg.
  * (Extract pictures)[https://trac.ffmpeg.org/wiki/Create%20a%20thumbnail%20image%20every%20X%20seconds%20of%20the%20video]  

  ```
This example will seek to the position of 0h:0m:14sec:435msec and output one frame (-vframes 1) from that position into a PNG file.

  ffmpeg -i {Input Video} -ss 00:00:14.435 -vframes 1 out.png

Output one image every ten minutes:

  ffmpeg -i test.flv -vf fps=1/600 thumb%04d.bmp

  ```

  * Check duration of the video:  

  ```
    ffprobe -i input.file -show_format -v quiet | sed -n 's/duration=//p'
  ```


  * Quickest way to generate thumbnail using ffmpeg.

  ```
      # Without scale
      ffmpeg  -ss {H:M:S / Sec} \
              -i {Input Video} \
              -frames:v 1 -q:v 2 \
              image.png

      # Scale image
        a. force_original_aspect_ratio=increase
        b. force_original_aspect_ratio=decrease

      ffmpeg  -ss {H:M:S /Sec} \
              -i {Input Video} \
              -frames:v 1 -q:v 2 \
              -vf "scale=400:300:force_original_aspect_ratio=decrease" \
              image.jpg
 

      # Without crop image
      ffmpeg  -ss {H:M:S /Sec} \
              -i {Input Video} \
              -frames:v 1 -q:v 2 \
              -vf "scale=400:300:force_original_aspect_ratio=increase" \
              image.jpg

      # Crop image
      ffmpeg  -ss {H:M:S /Sec} \
              -i {Input Video} \
              -frames:v 1 -q:v 2 \
              -vf "scale=400:300:force_original_aspect_ratio=increase,crop=400:300" \
              image.jpg

  ```

  ```
    // Measure the performance on Raspberry Pi 3
    time ffmpeg -ss 1:6:23 -y -i DeepMind_s_Richard_Sutton___The_Long_term_of_AI___Temporal_Difference_Learning___YouTube.mp4 -frames:v 1 -q:v 2  image.png
      real  0m3.312s
      user  0m7.300s
      sys 0m0.280s

    ls -la DeepMind_s_Richard_Sutton___The_Long_term_of_AI___Temporal_Difference_Learning___YouTube.mp4 
      -rw-r--r-- 1 pi pi 676458660 Nov 27 06:16 DeepMind_s_Richard_Sutton___The_Long_term_of_AI___Temporal_Difference_Learning___YouTube.mp4

  ```


  * GIF  

    - Example:
    ```
      ffmpeg -v warning -i $1 -vf "fps=1,palettegen" -y palette.png
    ```

    - Reference:
      - http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
      - https://stackoverflow.com/questions/37558504/lower-fps-when-using-ffmpeg-to-convert-mp4-to-gif

  * Tile  

    - Example:
    ```
      #Convert image1.jpg image2... to 5(Column)x2(Row) image. (5*600 x 2*?)
      ffmpeg -i image%d.jpg -filter_complex scale=600:-1,tile=5x2 output.jpg
    ```

    - Reference:
      - https://stackoverflow.com/questions/24604689/how-to-join-two-images-into-one-with-ffmpeg
      -


  * Loglevel:

    ```
const struct { const char *name; int level; } log_levels[] = {
        { "quiet"  , AV_LOG_QUIET   },
        { "panic"  , AV_LOG_PANIC   },
        { "fatal"  , AV_LOG_FATAL   },
        { "error"  , AV_LOG_ERROR   },
        { "warning", AV_LOG_WARNING },
        { "info"   , AV_LOG_INFO    },
        { "verbose", AV_LOG_VERBOSE },
        { "debug"  , AV_LOG_DEBUG   },
    };
    ``` 
