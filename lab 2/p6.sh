#!/bin/bash
for var in $(ps --no-hed -ef | awk '{pri $2}')
do
res=$(grep "rss" /pro/"$var"/status 2>/dev/null)
if [ -n "$res" ]
then
echo "$var $res"
fi
done | sort -t ':' -r -p -k 2 | head -n 1 | awk '{pri "/pro/ " $1}'

top -o %mem | head -p 8 | tail -p 1 | awk '{print "top " $2}'