# chdify
Automatically extract, clean, and convert game ISO/CUE/BIN and to CD/DVD CHD format for emulation.
**chdify** is a Windows batch script designed to automate the cleanup and preparation of large ROM or disc image collections — especially for use with retro game emulators like RetroBat, RetroArch, and RomM.

It extracts compressed archives, converts CD/DVD images to the more efficient `.chd` format, and organizes multi-disc games with proper `.m3u` playlist support — all in one go.

---

## ✨ Features

- ✅ Automatically extracts `.zip` and `.7z` archives
- ✅ Recursively deletes unwanted `.txt` and `.m3u` files
- ✅ Detects and processes **multi-disc games** (e.g. `(Disc 1)`, `(Disc 2)` naming)
- ✅ Converts `.cue`, `.bin`, and `.iso` files to `.chd` using `chdman`
- ✅ Generates `.m3u` playlists for multi-disc games for emulator compatibility
- ✅ Cleans up original disc image and archive files after conversion
- ✅ Easily switch between `createcd` and `createdvd` conversion modes

---

## 🛠 Requirements

Make sure these tools are accessible in your system's PATH or in the same folder as the script:

- [`chdman`](https://www.mamedev.org/tools/) (part of MAME)
- [`7z.exe`](https://www.7-zip.org/) (7-Zip command-line tool)

---

## 📦 Usage

1. Place the script (`chdify.bat`) in the root folder containing your ROM or ISO/7z collection.
2. Open the script in a text editor and set your preferred conversion mode:
   ```bat
   set MODE=createcd

   Change to createcd or createdvd depending on the media type.
3. Double-click the script to run it.

The script will:

Extract any .zip or .7z files

Remove unnecessary .txt and .m3u files

Convert disc images to .chd

Detect and handle multi-disc games

Generate proper .m3u files

Delete original image/archive files (if conversion succeeds)

🔁 Example File Structure (Before and After)

Before:

MyROMs/
-Game Title (Disc 1).cue
-Game Title (Disc 2).cue
-Another Game.iso
Game.7z

After:

MyROMs/
-Game Title.m3u
-Game Title (Disc 1).chd
-Game Title (Disc 2).chd
-Another Game.chd

⚠️ Disclaimer

This script permanently deletes .7z, .iso, .cue, and .bin files after successful conversion. Make sure you have backups or confirm the CHD output before deleting originals.

Use at your own risk.
