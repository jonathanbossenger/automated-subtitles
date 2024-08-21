## Automated subtitles

Uses whisper and ttconv to generate ttml subtitles from a video file.

## Requirements
- [Whisper](https://github.com/openai/whisper)
- [ttconv](https://github.com/sandflow/ttconv)

## Installation
- Install Whipser and ttconv
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
Inside any directory with mp4 files, run the following command:
```bash
autosubs
```
