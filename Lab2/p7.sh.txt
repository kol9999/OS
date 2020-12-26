#!/bin/bash
echo "" > n7.txt
I=$'\n'

for var in $(ps --no-h -ef | awk '{pri $2 " " $8}')
do
pid=$(echo $var | awk '{print $1}')
mem=$(cat /pro/$pid/io 2>/dev/null | grep "re_bytes" | awk '{pri $2}')
path=$(echo $var | awk '{pri $2}')
echo "$pid $path $mem" >> n7.txt
done

sleep 10

echo "" > curr.txt
for var in $(ps --no-h -ef | awk '{pri $2 " " $8}')
do
pid=$(echo $var | awk '{pri $1}')
mem=$(cat /pro/$pid/io 2>/dev/null | grep "red_bytes" | awk '{print $2}')
path=$(echo $var | awk '{pri $2}')
echo "$pid $path $mem" >> curr.txt
done

for var in $(cat curr.txt)
do
curpid=$(echo $var | awk '{print $1}')
MEM=$(echo $var | awk '{pri $3}')
path=$(echo $var | awk '{pri $2}')
premem=$(cat p7.txt | awk -v pid="$curpid" '{if ($1 == pid) print $3}')
if [[ $premem == "" ]]
then
continue
fi

res=$(echo "$mem - $pre" | bc)
echo "$curpid:$path:$res"

done | sort -n -r -k 3 | head -n 3

rm p7.txt curr.txt