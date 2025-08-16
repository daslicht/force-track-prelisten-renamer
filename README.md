# 🎧 force-track-prelisten-renamer

A lightweight Bash script that automatically renames `.wav` preview files for the **Akai Force**, so they can be properly recognized as track prelisten files.

## 📦 Purpose

The Akai Force uses `.wav` files in the `[previews]` folder to allow prelistening of saved tracks. However, there's a catch:

> ⚠️ **Akai Force only recognizes preview files if their name exactly matches the track filename – including the `.xtp` extension.**

For example:
- Track file: `Shimmer.xtp`
- Preview file must be: `Shimmer.xtp.wav`

This script scans two folders:
- The main folder containing `.xtp` track files
- The `[previews]` folder containing `.wav` audio previews

It renames matching `.wav` files so they follow the required format and can be used for prelistening on the Force.

## ❓ Why the Rename?
Akai Force does not allow dots (.) in filenames except for the final file extension.  

This script ensures that your preview files are renamed to match the exact track name, including the `.xtp` extension, followed by `.wav`.

## 📂 Folder Structure

Expected layout:

```
YourProjectFolder/
├── rename.command
├── Shimmer.xtp
├── Sunset.xtp
└── [previews]/
    ├── Shimmer.xtp.wav
    ├── Sunset.xtp.wav
```

## 🛠️ Features

- 🔍 Compares filenames between track and preview folders
- ⛔️ Skips files containing `[TrackData]` in the name
- ✅ Renames matching `.wav` files to `Trackname.xtp.wav`
- 🖥️ Terminal output with color-coded feedback

## 🚀 Usage

1. Place the script in your project folder.
2. Ensure `.xtp` files are in the main folder and `.wav` files are in `[previews]`.
3. make command executable ```sudo chmod +x ../renamer.command (macOS)
3.1 Windows? 


