@echo off
REM ------------------------------------------------------------------------------
REM  Example DISM capture script
REM  This script demonstrates how to capture a Windows installation into a WIM
REM  file from within WinPE.  Adjust the drive letters to suit your environment.
REM ------------------------------------------------------------------------------

echo Listing volumes using diskpart...
diskpart /s "%~dp0list_volumes.txt"

echo Capturing Windows image to install.wim...
dism /capture-image ^
    /imagefile:D:\install.wim ^
    /capturedir:C:\ ^
    /name:"Windows10-Custom" ^
    /compress:max ^
    /checkintegrity

echo Image capture complete.  Verify the image using:
echo dism /get-wiminfo /wimfile:D:\install.wim