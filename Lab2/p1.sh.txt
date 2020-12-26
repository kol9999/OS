#!/bin/bash
p=$(ps --no-h a -U usr)
echo "$p" | wc -l
echo "$p" | awk '{print $1 ":" $5}'
