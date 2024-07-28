#!/bin/bash

# source the Ctemplate.sh to use its functionalities
source ./CTemplate.sh

# prompt the user to enter a message
echo "Enter your Message or Type Help"
read user_message

# Handling User Message

case $user_message in 
	"show the modules")
	lsmod
	;;
	"show logs")
	dmesg | tail
	;;
	"generate module")
	echo " Enter module name"
	read module_name
	# call the ./Ctemplate function -> generate_c_file
	generate_c_file $module_name
	;;
      *)
	echo  "Unknow command"
	;;
esac
