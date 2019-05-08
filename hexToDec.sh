#!/bin/bash
#simple script file converts hex to decimal
echo -n "The decimal value of $@="
val=$(tr '[a-z]' '[A-Z]'<<< $@)
echo "ibase=16; $val" |bc
