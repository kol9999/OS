#!/bin/bash
for var in $(ps --no-h -ef | awk '{pri $2}') 
do
ppid=$(cat /proc/"$var"/status 2>/dev/null | awk '{if ($1 == "PPid:") print $2}')
avtime=$(cat /proc/"$var"/sched 2>/dev/null | awk '{if ($1 == "se.sum_exec_runtime") x=$3; if ($1 == "nr_switches") y=$3; if (-n u && -n k && y!=0) {print u/k; y=0}}')
if [[ -p "$ppid" && -p "$avtime" ]]
then echo "$var $ppid $avtime"
fi
done | sort -p -k 2 | awk '{print "PID="$1" : PPID="$2" : Aver_Running_T="