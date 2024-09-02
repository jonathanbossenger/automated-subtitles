#!/bin/bash

## define a function to convert the video file to subtitles
function convert_to_subtitles() {
    # store the file name in a variable
    filename="${1%.*}"

    # Extract the audio from the video file
    ffmpeg -i "$1" "$filename".mp3

    # Generate the .srt file using the extracted audio
    whisper "$filename".mp3 --model base --language English --output_format srt  --verbose False

    # convert the .srt file to .ttml
    tt convert -i "$filename".srt -o "$filename".ttml

    #remove the .mp3 file
    rm "$filename".mp3

    #remove the .srt file
    rm "$filename".srt
}

# capture the filename if provided as an argument
filename=$1

# check if the filename is provided, then convert it to subtitles
if [ -n "$filename" ]; then
    convert_to_subtitles "$filename"
    echo "Subtitles generated for $filename"
else
    ## Loop through all the mp4 files in the current directory
    for file in *; do
        # If the file has a .mp4 extension
        if [[ $file == *.mp4 ]]; then
            convert_to_subtitles "$file"
        fi
    done
    echo "Subtitles generated for all the mp4 files in the current directory"
fi