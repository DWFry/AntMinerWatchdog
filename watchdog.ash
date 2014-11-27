#!/bin/ash
# /root/watchdog.ash for AntMiner - 2014.11.26 - by b00m3rang

# You must run 'chmod 755 /root/watchdog.ash' or set +x in SCP client,
# and add the following line to "Scheduled Tasks" under "System":
# * */6  *   *   *     /root/watchdog.ash

# Assgn variables for current time and time of last work accepted
currtime=$(date +"%s")
lastwork=$(cgminer-monitor 2>&1 1>/dev/null | grep A= | awk '{ print $7 }')

# Calculate seconds since last work accepted
sincework=$(echo $((currtime-lastwork)))

# If no work submitted in the last 10 minutes, log and reboot
if [ $sincework -gt 600 ]; then
    echo `date` >> /root/watchdog.log
    reboot
fi
