#!/bin/bash
# Find "Oct" at the beginning of lines 
# (case-insensitive, without filename at the beginning of result, 
# without any error messages in command line, use PCRE)
grep -ihsP '^Oct' /var/log/* > errors.log
# Find lines contains paths
grep -iP '[^a-z0-9:/](/.+)+' errors.log