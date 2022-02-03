:: Name:     lock.bat
:: Purpose:  Lock windows.
:: Author:   https://github.com/Sokoloft/
:: Revision: Febuary 2/22
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
Rundll32.exe user32.dll,LockWorkStation
exit
