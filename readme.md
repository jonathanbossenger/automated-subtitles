## Automated subtitles

Uses whisper and ttconv to generate ttml subtitles from a video file.

## Requirements
- [Whisper](https://github.com/openai/whisper)
- [ttconv](https://github.com/sandflow/ttconv)

## Installation
- Install Whipser and ttconv
- Clone the repository
```bash
git clone git@github.com:jonathanbossenger/automated-subtitles.git
```
- Set the permissions on the script
```bash
cd automated-subtitles
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
