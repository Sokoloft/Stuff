:: Name:     audiodg.bat
:: Purpose:  Changes audiodg processor affinity. Discord fix.
:: Author:   https://steamcommunity.com/id/sokoloft/
:: Revision: October 18/21
:: Notes: 	 glub yup
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
PowerShell "get-process audiodg | foreach { $_.ProcessorAffinity=4 }"
wmic process where name="audiodg.exe" CALL setpriority "high priority"
exit
