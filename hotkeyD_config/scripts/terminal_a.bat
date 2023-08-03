:: Name:     terminal_a.bat
:: Purpose:  Opens Windows Terminal.
:: Author:   https://github.com/Sokoloft/
:: Revision: April 21/22
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
start wt.exe
exit
