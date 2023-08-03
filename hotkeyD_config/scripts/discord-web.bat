:: Name:     discord.bat
:: Purpose:  Opens Discord in the web browser (brave).
:: Author:   https://github.com/Sokoloft/
:: Revision: May 31/22 R3
:: Notes: 	 Modified for use with Discord Canary & PowerCord.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

cd C:\Program Files\BraveSoftware\Brave-Browser\Application\
start brave.exe --new-window "https://discord.com/channels/@me"
exit
