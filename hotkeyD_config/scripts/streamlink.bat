:: Name:     streamlink.bat
:: Purpose:  Opens Streamlink-Twitch_GUI.
:: Author:   https://github.com/Sokoloft/
:: Revision: March 5/23
:: Notes: 	 None.
::			  Made possible with https://stackoverflow.com/ copy pasta goodness.

cd "C:\Program Files\Streamlink Twitch GUI\"
start streamlink-twitch-gui.exe "--max"
cd C:\Users\%username%\Documents\luminous-ttv
start luminous-ttv.exe
exit
