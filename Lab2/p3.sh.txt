#!/bin/bash
ps --no-h -eo pid,comm,stime | s -k 3 | t -n 1 | awk '{pri $1 " " $3}'