#!/bin/bash
#This script will delete all files owned by a user
#and then delete the user. It won't delete a user 
#unless the account is locked. Use with caution!

for user in $@; # loop through each argument given
do 
	if id $user >/dev/null 2>&1; # 'if user exists' - I'm sending all stderr and stdout to /dev/null for tidiness
		then
		if [[ `passwd -S $user|awk '{print $9}'|cut -d'.' -f1` = locked ]]; # 'if user is locked' - bit messy, matching the phrase 'locked' in the passwd -S output
			then string="$string -o -user $user"; # add user (with some options) to a variable we'll call later to find all user-owned files
			deathrow="$deathrow $user"; # add user to a variable we'll call later to delete all the users at once
			else echo "$user is not locked"; # if a user account isn't locked we'll display this so we know what happened
			fi;
		else echo "$user does not exist on this server"; # if the user doesn't exist this is our informational message
	fi;
done; # end of for loop
string=${string#???}; # delete the first three characters from $string - the ' -o', because it's easier than not adding it in the first place and it breaks find
if [ -z "$string" ]; # check to see if $string is empty
	then echo "None of these users exist on this server - find will not be executed"; # if the string *is* empty we'll not take any further action
        else find / $string -exec rm -rf {} \; 2>/dev/null; # delete every file owned by each user that existed and was locked, route errors to /dev/null for tidiness
	for i in $deathrow; do userdel $i; done; # delete every user that existed and was locked
fi;
