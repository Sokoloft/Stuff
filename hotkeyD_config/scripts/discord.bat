:: Name:     discord.bat
:: Purpose:  Opens Discord.
:: Author:   https://github.com/Sokoloft/
:: Revision: October 16/21
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
cd "C:\Users\%username%\AppData\Local\Discord\"
start Update.exe --processStart Discord.exe"
exit
