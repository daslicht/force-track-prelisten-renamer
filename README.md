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

Akai Force does **not** allow dots (`.`) in filenames except for the final file extension. That means:

- `Shimmer.wav` → ❌ Not recognized
- `Shimmer.preview.wav` → ❌ Not recognized
- `Shimmer.xtp.wav` → ✅ Recognized as preview for `Shimmer.xtp`

This script ensures that your preview files are renamed to match the exact track name, including the `.xtp` extension, followed by `.wav`.

## 📂 Folder Structure

Expected layout:

YourProjectFolder/
├── Shimmer.xtp
├── Sunset.xtp
└── [previews]/
├── Shimmer.xtp.wav
├── Sunset.xtp.wav

