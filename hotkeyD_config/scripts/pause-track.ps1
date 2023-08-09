# Name:     pause-track.ps1
# Purpose:  Presses the play/pause track media key.
# Author:   https://github.com/Sokoloft/
# Revision: August 9/23
# Notes: 	 None.
#			  Made possible with https://stackoverflow.com/ copy pasta goodness.

$wshShell = new-object -com wscript.shell
$wshShell.SendKeys([char]179)
exit