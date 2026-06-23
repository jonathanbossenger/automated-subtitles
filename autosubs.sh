#!/bin/bash

## define a function to convert the video file to subtitles
function convert_to_subtitles() {
    # store the file name in a variable
    filename="${1%.*}"
    audio_file="$1"
    temporary_audio_file=""

    # Extract the audio from video files
    if [[ $1 == *.mp4 ]]; then
        temporary_audio_file="$filename".mp3
        ffmpeg -i "$1" "$temporary_audio_file"
        audio_file="$temporary_audio_file"
    fi

    # Generate the .srt file using the audio file
    whisper "$audio_file" --model base --language English --output_format srt --verbose False

    # convert the .srt file to .ttml
    tt convert -i "$filename".srt -o "$filename".ttml

    #remove the extracted audio file
    if [ -n "$temporary_audio_file" ]; then
        rm "$temporary_audio_file"
    fi

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
    ## Loop through all the supported files in the current directory
    shopt -s nullglob
    for file in *.mp4 *.mp3 *.ogg *.wav; do
        convert_to_subtitles "$file"
    done
    shopt -u nullglob
    echo "Subtitles generated for all supported files in the current directory"
fi
