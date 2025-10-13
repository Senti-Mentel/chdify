@echo off
setlocal EnableDelayedExpansion

:: === CONFIGURATION ===
:: Set conversion mode: createcd or createdvd
set MODE=createcd

:: Path to chdman (set this if chdman isn't in PATH)
set CHDMAN=chdman.exe

:: Path to 7z (set this if 7z.exe isn't in PATH)
set SEVENZ=7z.exe

echo -------------------------------
echo Game Processing Script Started
echo Mode: %MODE%
echo -------------------------------

:: STEP 1: Unzip all .zip and .7z files
echo Extracting archives...
for %%f in (*.zip *.7z) do (
    echo Extracting: %%f
    "%SEVENZ%" x "%%f" -o"%%~nf" >nul
)

:: STEP 2: Delete all .txt and .m3u files
echo Deleting .txt and .m3u files...
for /R %%f in (*.txt *.m3u) do (
    del /f /q "%%f"
)

:: STEP 3: Convert remaining ISO/CUE/BIN files to CHD
echo Converting remaining disc images to CHD...
for /R %%f in (*.iso *.cue) do (
    set "chd=%%~dpnf.chd"
    if not exist "!chd!" (
        echo Converting: %%f
        "%CHDMAN%" %MODE% -i "%%f" -o "!chd!"
    )
)

:: STEP 4: Process subfolders for multi-disc games
echo Deleting all existing .m3u files...
for /r %%f in (*.m3u) do (
    echo Deleting "%%f"
    del "%%f"
)

echo Scanning for folders with multiple .chd files...

for /d /r %%d in (*) do (
    set "chd_count=0"
    set "first_file="
    set "folder=%%d"

    REM Count CHD files and capture the first filename
    for %%c in ("%%d\*.chd") do (
        if exist "%%c" (
            set /a chd_count+=1
            if not defined first_file (
                set "first_file=%%~nxc"
            )
        )
    )

    if !chd_count! GEQ 2 (
        REM Clean the name of the first file (remove (Disc 1) and extension)
        set "playlist_name=!first_file:(Disc 1)=!"
        set "playlist_name=!playlist_name:.chd=!"
        set "playlist_path=%%d\!playlist_name!.m3u"

        echo Creating playlist: !playlist_path!

        (
            for %%c in ("%%d\*.chd") do (
                echo %%~nxc
            )
        ) > "!playlist_path!"
    )
)

:: STEP 5: Delete all .7z, .iso, .cue, and .bin files
echo Step 5: Cleaning up .7z, .iso, .cue, and .bin files...

for /R %%f in (*.7z *.iso *.cue *.bin) do (
    echo Deleting: %%f
    del /f /q "%%f"
)

    endlocal
    popd >nul
)

echo -------------------------------
echo Processing Complete
echo -------------------------------
pause