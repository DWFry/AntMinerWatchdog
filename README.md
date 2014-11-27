AntMinerWatchdog
================

watchdog.ash - 2014.11.26 - by b00m3rang

Watchdog script in ash to reboot AntMiner if no blocks are being submitted

This script parses the output of cgminer-monitor, reads the timestamp of the last work unit submitted, and if the time is more than 10 minutes from the current time, will reboot the miner.  This should minimize lost mining time, as well as reduce strain on the miner from power cycling.

Add the following entry to crontab, or System -> Scheduled Tasks in the GUI to run the script every 3 minutes:

 * */6  *   *   *     /root/watchdog.ash
