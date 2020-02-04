#!/bin/bash

function mainmenu {
	. ./database_functions.sh
	while [ true ]
	do
		select i in "Create Database" "Connect to Database" "Show Databases" "Exit"
		do
			case $i in
				"Create Database" ) 
				break ;;
				"Connect to Database" )
					echo "Enter a databse name to connect to "
					read dbName
					connectToDatabase $dbName
				break ;;
				"Show Databases" )
					echo "___________________________________________"
					echo "Available Databases"
					echo "___________________________________________"
					listDatabases
					echo "___________________________________________"
				break ;;
				"Exit" )
					exit
				break ;;
			esac
		done
	done
}
