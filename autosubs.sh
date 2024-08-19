#!/bin/bash

# Loop through all the mp4 files in the current directory
for file in *; do
    # If the file has a .mp4 extension
    if [[ $file == *.mp4 ]]; then

        # store the file name in a variable
        filename="${file%.*}"

        # Extract the audio from the video file
        ffmpeg -i "$file" "$filename".mp3

        # Generate the .srt file using the extracted audio
        whisper "$filename".mp3 --model base --language English --output_format srt  --verbose False

        # convert the .srt file to .ttml
        tt convert -i "$filename".srt -o "$filename".ttml

    fi
done