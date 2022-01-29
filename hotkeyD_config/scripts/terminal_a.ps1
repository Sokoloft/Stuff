# Name:     terminal.bat
# Purpose:  Opens Windows Terminal.
# Author:   https://github.com/Sokoloft/
# Revision: January 29/22
# Notes: 	 None.
#			  Made possible with https://stackoverflow.com/ copy pasta goodness.

powershell "Start-Process -Verb RunAs cmd.exe '/c start wt.exe'"
exit
