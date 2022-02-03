# Name:     terminal_a.ps1
# Purpose:  Opens Windows Terminal as Administrator.
# Author:   https://github.com/Sokoloft/
# Revision: January 29/22
# Notes: 	 None.
#			  Made possible with https://stackoverflow.com/ copy pasta goodness.

powershell "Start-Process -Verb RunAs cmd.exe '/c start wt.exe'"
exit
