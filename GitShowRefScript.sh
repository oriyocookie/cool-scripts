#!/bin/bash
#script that Lists references in a local repository 
#then echos the result intoa text file
for BRANCH in `git show-ref -s`
do 
	echo "for $BRANCH:" >> result 
	git show --name-only $BRANCH >> result
	echo " " >> result
done

