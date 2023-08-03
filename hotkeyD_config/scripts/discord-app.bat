:: Name:     discord.bat
:: Purpose:  Opens Discord.
:: Author:   https://github.com/Sokoloft/
:: Revision: Febuary 2/22 R2
:: Notes: 	 Modified for use with Discord Canary & PowerCord.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

cd "C:\Users\%username%\AppData\Local\DiscordCanary\"
start Update.exe --processStart DiscordCanary.exe
exit
