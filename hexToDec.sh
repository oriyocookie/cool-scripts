#!/bin/bash
echo -n "The decimal value of $@="
val=$(tr '[a-z]' '[A-Z]'<<< $@)
echo "ibase=16; $val" |bc
