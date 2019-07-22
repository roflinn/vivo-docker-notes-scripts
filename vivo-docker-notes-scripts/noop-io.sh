#!/bin/bash

# Change the Disk I/O Scheduler
echo "Type root Password Below"
su root

echo noop > /sys/block/sda/queue/scheduler
exit

echo "Script Complete"
