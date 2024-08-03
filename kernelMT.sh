#!/bin/bash

# source the Ctemplate.sh to use its functionalities
source ./CTemplate.sh
source ./MKTemplate.sh

ModuleDir=""
# Handling User Message
while true; do
	# prompt the user to enter a message
	echo "Enter your Message or Type Help"
	read user_message

	case $user_message in 
		"modules")
		# Show the modules
		lsmod
		;;
		"log")
		# show Log
		dmesg | tail
		;;
		"generate module")
		echo " Enter module name"
		read module_name
		mkdir $module_name
		cd $module_name
		ModuleDir=$(pwd)
		# call the ./Ctemplate function -> generate_c_file
		generate_c_file $module_name
		# call the ./MKtemplate function -> generate_make_file
		generate_make_file $module_name
		;;

		"load")
		# Loading the Kernel Module
		echo " Load the module "
		if [ -z "$ModuleDir"]; then
             echo "Module directory not set. Generate a module first."
        else
            echo "Loading the module from $ModuleDir"
            cd $ModuleDir
			make all
            # sudo make modules_install
            #sudo insmod ${module_name}.ko
            cd ..
        fi

		;;
		"Unload")
		#
		echo " Unload the module "
		if [-z "$ModuleDir"]; then
			echo "Module directory not set. Generate a module first."
		else
            echo "Unloading the module"
            sudo rmmod ${module_name}
		fi

		;;

		"exit")
		echo " Terminating the script"
		break
		;;

		*)
		echo  "Unknow command"
		break
		;;
	esac
done