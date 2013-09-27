#!/bin/bash
#This script will lock the user account and list the files
#of any user parsed as an argument. It can take multiple
#arguments and will intelligently handle non-existant users

for user in $@; # loop through each argument given
do 
	if id $user >/dev/null 2>&1; # 'if user exists' - I'm sending all stderr and stdout to /dev/null for tidiness
		then string="$string -o -user $user -printf %u\t%h/%f\n"; # add user (with some options) to a variable we'll call later to find all user-owned files
		passwd -l $user >/dev/null 2>&1; # lock user, route all STDERR and STDOUT to /dev/null for tidiness
		echo "User $user locked!"; # informational message
		else echo "$user does not exist on this server"; # if the user doesn't exist, tell us!
	fi;
done; # end of for loop
string=${string#???}; # delete the first three characters from $string - the ' -o', because it's easier than not adding it in the first place and it breaks find
if [ -z "$string" ]; # check to see if $string is empty
	then echo "None of these users exist on this server - find will not be executed"; # if the string *is* empty we'll not take any further action
	else find / $string 2>/dev/null; # list every file owned by each user that existed, route errors to /dev/null for tidiness
fi;
for user in $@; do #loop through every argument, again
	touch $user.lockedandsearched #this file is a simple safeguard - if the find didn't complete, the file won't be created and the second search won't work!
done #end of for loop
