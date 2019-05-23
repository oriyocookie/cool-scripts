#!/bin/bash
echo "name the commit"
read commitName
git add --all 
git commit -m "$commitName" 
git push -u origin master
