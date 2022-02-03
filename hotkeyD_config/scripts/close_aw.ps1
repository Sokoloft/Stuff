# Name:     close_aw.ps1
# Purpose:  Closes Active Window.
# Author:   https://github.com/Sokoloft/
# Revision: January 29/22
# Notes: 	 This is depreciated & slow. hotkeyD has a closewindow function now.
#			  Made possible with https://stackoverflow.com/ copy pasta goodness.

[CmdletBinding()]            
Param(            
)            
Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public class UserWindows {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
"@            
try {            
$ActiveHandle = [UserWindows]::GetForegroundWindow()
$Process = Get-Process | ? {$_.MainWindowHandle -eq $activeHandle}
$Process | Select ProcessName, @{Name="AppTitle";Expression= {($_.CloseMainWindow())}}
} catch {            
 Write-Error "Failed to get active Window details. More Info: $_"            
}
exit
