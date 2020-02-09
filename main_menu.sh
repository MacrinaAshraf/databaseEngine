#!/bin/bash

function mainmenu {
	. ./database_functions.sh
	while [ true ]
	do
		PS3="Enter your choice: "
		echo "___________________________________________"
		select i in "Create Database" "Connect to Database" "Show Databases" "Drop Database" "Exit"
		do
			case $i in
				"Create Database" ) 
					echo "___________________________________________"
					createDatabase
					echo "___________________________________________"
				break ;;
				"Connect to Database" )
					echo "___________________________________________"
					echo "Enter a databse name to connect to "
					read -e dbName
					echo "___________________________________________"
					connectToDatabase $dbName
					echo "___________________________________________"
				break ;;
				"Show Databases" )
					echo "___________________________________________"
					echo "Available Databases"
					echo "___________________________________________"
					showDatabases
					echo "___________________________________________"
				break ;;
				"Drop Database" )
					echo "___________________________________________"
					echo "Enter a databse name you want to drop"
					read -e dbName
					echo "___________________________________________"
					dropDatabase $dbName
					echo "___________________________________________"
				break ;;
				"Exit" )
					return
				break ;;
				* )
					echo "___________________________________________"
					echo "This is not a valid choice"
					echo "___________________________________________"
				break ;;
			esac
		done
	done
}
