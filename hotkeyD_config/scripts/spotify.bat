:: Name:     spotify.bat
:: Purpose:  Checks if Toastify is open. If not it will exec Toastify. If it is, it will exec Spotify.
:: Author:   https://github.com/Sokoloft/
:: Revision: October 16/21
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
tasklist | find /I "Toastify" 
if errorlevel 1 (
        cd "C:\Program Files\Toastify\"
		start Toastify.exe
) Else (
        cd "C:\Users\%username%\AppData\Roaming\Spotify"
		start Spotify.exe

)
exit
