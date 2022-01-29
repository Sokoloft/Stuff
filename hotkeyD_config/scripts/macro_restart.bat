:: Name:     macro_restart.bat
:: Purpose:  Restart Voicemeeter Macro application.
:: Author:   https://github.com/Sokoloft/
:: Revision: December 18/21
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
taskkill /f /im VoicemeeterMacroButtons.exe
cd C:\Program Files (x86)\VB\Voicemeeter
start VoicemeeterMacroButtons.exe
exit
