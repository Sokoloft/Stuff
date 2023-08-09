# Name:     previous-track.ps1
# Purpose:  Presses the previous track media key.
# Author:   https://github.com/Sokoloft/
# Revision: August 9/23
# Notes: 	 None.
#			  Made possible with https://stackoverflow.com/ copy pasta goodness.

$wshShell = new-object -com wscript.shell
$wshShell.SendKeys([char]177)
exit