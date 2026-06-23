## Automated subtitles

Uses whisper and ttconv to generate ttml subtitles from video and audio files.

## Requirements
- [Whisper](https://github.com/openai/whisper)
- [ttconv](https://github.com/sandflow/ttconv)

## Installation
- Install [Whipser and ttconv](https://jonathanbossenger.com/generating-automated-subtitles-with-openais-whisper-on-ubuntu-22-04/)
- Download the autosubs.sh script
```bash
curl -O https://github.com/jonathanbossenger/automated-subtitles/blob/main/autosubs.sh 
```
- Set the permissions on the script
```bash
chmod +x autosubs.sh
```
- Add the script to your path
```bash
sudo cp autosubs.sh /usr/local/bin/autosubs
```
## Usage
Inside any directory with supported media files (`.mp4`, `.mp3`, `.ogg`, `.wav`), run the following command:
```bash
autosubs
```

You can also pass a single supported file to process:
```bash
autosubs my-audio-file.mp3
```
