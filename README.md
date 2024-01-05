# YouTube download script

[yt-dlp](https://github.com/yt-dlp/yt-dlp) wrapper script used to download video/audio files from YouTube. If multiple URLs are provided they will be merged together into a single file.

## Installation

```
git clone https://gitlab.com/camj/youtube
cd youtube
make install
```

### Dependencies

* [yt-dlp](https://github.com/yt-dlp/yt-dlp)
* ffmpeg

## Usage

```
USAGE:
    youtube [SUBCOMMAND] [URL] ...

SUBCOMMANDS:
    v, video    Download .mp4 using h264 and opus
    a, audio    Download .mp3 using opus
```

## Notes

### Download location

Files are first downloaded to a temporary directory before being processed by `ffmpeg`. This directory is created in [`XDG_RUNTIME_DIR`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) or `/tmp` if unset. This can be changed by editing the `TMP` variable [found at the top](https://gitlab.com/camj/youtube/-/blob/master/youtube?ref_type=heads#L3) of the script.

This could be changed to, for example, `TMP=youtube_download`.

### Why remux from `.mkv` to `.mp4`? Why not just merge to `.mp4`?

When downloading and merging multiple video files, the timestamps of the resulting video file can cause problems with media players such as [vlc](https://www.videolan.org/). This would require a re-encode to fix.

Merging the downloaded video and audio files to a [Matroska](https://www.matroska.org/index.html) (`.mkv`) container and then remuxing to `.mp4` solves the issue.
