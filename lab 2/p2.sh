#!/bin/bash
ps a x | grep -X "[[:s:]]+/sbin/+" | awk '{p $1}' > p2.txt