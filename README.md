# chdify
Automatically extract, clean, and convert game ISO/CUE/BIN to CD/DVD CHD format for emulation and cleanup after.
**chdify** is a Windows batch script designed to automate the cleanup and preparation of large ROM or disc image collections — especially for use with retro game emulators like RetroBat, RetroArch, and RomM.

It extracts compressed archives, converts CD/DVD images to the more efficient `.chd` format, and organizes multi-disc games with proper `.m3u` playlist support — all in one go.
I wrote this .bat file because I could not find one in my searches that fit my use case and didnt want to re organize my entire rom library to suit another bat file. In my case I have a root folder and each sub folder is a specific console, within each console folder I had single disc game archives and multi disc folders with the archives inside them just like 
in the "Before" example below

---

## ✨ Features

- ✅ Automatically extracts `.zip` and `.7z` archives
- ✅ Recursively deletes unwanted `.txt` and `.m3u` files to avoid creating duplicates later
- ✅ Detects and processes **multi-disc games** (e.g. `(Disc 1)`, `(Disc 2)` naming)
- ✅ Converts `.cue`, `.bin`, and `.iso` files to `.chd` using `chdman`
- ✅ Generates `.m3u` playlists for multi-disc games for emulator compatibility
- ✅ Cleans up original disc image and archive files after conversion
- ✅ Easily switch between `createcd` and `createdvd` conversion modes

---

Feel Free to check out my in depth blog post about chdify at: https://sentimenteltech.com/organize-compress-and-clean-your-iso-bin-cue-rom-library-with-chdify/

---

## 🛠 Requirements

Make sure these tools are accessible in your system's PATH or in the same folder as the script:

- [`chdman`](https://www.mamedev.org/tools/) (part of MAME)
- [`7z.exe`](https://www.7-zip.org/) (7-Zip command-line tool)

---

## 📦 Usage

1. Place the script (`chdify.bat`) in the root folder containing your ROM or ISO/7z collection.
2. Ensure any multi disc game files are already in their own folder before running the script
3. Open the script in a text editor and set your preferred conversion mode (**createcd for ps1,ps2, etc./createdvd for psp**):
   ```bat
   set MODE=createcd

   Change to createcd or createdvd depending on the media type.
   ```
4. Double-click the script to run it.

The script will:

Extract any .zip or .7z files

Remove unnecessary .txt and .m3u files

Convert disc images to .chd

Detect and handle multi-disc games

Generate proper .m3u files

**Delete original image/archive files** (if conversion succeeds)

🔁 Example File Structure (Before and After)

**Before:**
```
Roms/
├── PS1/
    ├── Final Fantasy IX/
        ├── Final Fantasy IX (Disc 1).7z
        ├── Final Fantasy IX (Disc 2).zip
        ├── Final Fantasy IX (Disc 3).7z
        └── Final Fantasy IX (Disc 4).zip
    └── Harvest Moon - Back to Nature.iso
    ├── Final Fantasy VII/
        ├── Final Fantasy VII (Disc 1).bin
        ├── Final Fantasy VII (Disc 1).cue
└── PS2/
    ├── Shadow of the Colossus.iso
    ├── Metal Gear Solid 3 Subsistence/
        ├── Metal Gear Solid 3 Subsistence (Disc 1).iso
```

**After:**
```
Roms/
├── PS1/
    ├── Final Fantasy IX/
        ├── Final Fantasy IX.m3u
        ├── Final Fantasy IX (Disc 1).chd
        ├── Final Fantasy IX (Disc 2).chd
        ├── Final Fantasy IX (Disc 3).chd
        └── Final Fantasy IX (Disc 4).chd
    └── Harvest Moon - Back to Nature.chd
    ├── Final Fantasy VII/
        ├── Final Fantasy VII (Disc 1).chd
        ├── Final Fantasy VII (Disc 2).chd
└── PS2/
    ├── Shadow of the Colossus.chd
    ├── Metal Gear Solid 3 Subsistence/
        ├── Metal Gear Solid 3 Subsistence.m3u
        ├── Metal Gear Solid 3 Subsistence (Disc 1).chd
```

⚠️ Disclaimer

**This script permanently deletes .7z, .iso, .cue, and .bin files after successful conversion. Make sure you have backups or confirm the CHD output before deleting originals.

Use at your own risk.**
