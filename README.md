# YouTube download script

[yt-dlp](https://github.com/yt-dlp/yt-dlp) wrapper script used to download video/audio files from YouTube. If multiple sources are provided, they will be merged together using `ffmpeg`.

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

### Examples

#### Download audio

```sh
$ youtube a https://youtu.be/9kaIXkImCAM
```

#### Download multiple videos and merge them together

```sh
$ youtube v https://youtu.be/9kaIXkImCAM https://youtu.be/dQw4w9WgXcQ
```

## Notes

### Download

Files are downloaded to a temporary directory created using `$XDG_RUNTIME_DIR` or `/tmp` if unset. You may wish to create the temporary directory inside a directory that isn't located on a `tmpfs` mount. This can be accomplished by changing the `TMP` variable found at the beginning of the script to, for example, `TMP=youtube_download`.

### Why remux from `.mkv` to `.mp4`? Why not just merge to `.mp4`?

When downloading and merging multiple video files, the timestamps of the resulting video file can cause problems with media players such as [vlc](https://www.videolan.org/). This would require a re-encode to fix.

Merging the downloaded video files to a [Matroska](https://www.matroska.org/index.html) (`.mkv`) container file and then remuxing to `.mp4` solves the issue.

### Why `h264`?

`h264` is one of the most widely supported video codecs. Great performance on virtually any platform.

### Why `opus`?

`opus` is typically the highest quality audio codec that YouTube provides.
