#!/bin/bash
IFS=$'\n'
echo "" > p5.txt
p=1
avti=0
ppid=$(cat n4.txt | h -n 1 | awk '{pri $3}')

for var in $(cat n4.txt)
do
curppid=$(echo "$var" | awk '{pri $3}')
curti=$(echo "$var" | awk -F= '{print $4}')

if [[ "$curppid" == "$ppid" ]];
then
p=$(($n+1))
avti=$(echo "scale=5; $avti+$curti" | bc)

else
pr1=$(echo "$ppid" | awk -F= '{pri $2}')
pri2=$(echo "scale=5; $avti/$n" | bc)
echo "Aver_Sleeping_Children_of_PID=$print1 is $pri2" >> p5.txt

ppid=$curppid
p=1
avti=$curti

fi
echo "$var" >> p5.txt
done

pri1=$(echo "$ppid" | awk -F= '{pri $2}')
pri2=$(echo "scale=5;$avti/$n" | bc)
echo "Average_Sleeping_Children_of_PD=$print1 is $pri2" >> p5.txt