#!/bin/bash

# Add the following to your crontab
# Ensure to uncomment the crontab string

#pz
#50 23,5,11,17 * * * bash /home/steam/Games/pzserv/restart.sh

# Edit this to be the directory of your zomboid server
zctrl=/home/foobar/pzserv

case "$(pidof ProjectZomboid64 | wc -w)" in
# Process not found
# Deletes zomboid.control file to ensure clean start
0)  rm $zctrl/zomboid.control

    ;;
# Process is found
# Give warnings, stop and start the server.
1)      echo "servermsg \"Server Restart in 10 Minutes\"" > $zctrl/zomboid.control
        sleep 300
        echo "servermsg \"Server Restart in 5 Minutes\"" > $zctrl/zomboid.control
        sleep 240
        echo "servermsg \"Server Restart in 1 Minute\"" > $zctrl/zomboid.control
        sleep 60
        sudo systemctl stop pzserv.service
        sleep 60
        sudo systemctl start pzserv.service
    ;;
esac
