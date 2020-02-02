#!/bin/bash

function menu {
	while [ true ]
	do
		select i in "Show Tables" "Create Table" "Select from databases" "Delete Table" "Update Table" "Back to Main Menu"
		do
			case $i in
				"Show Tables" ) 
				break ;;
				"Create Tables" )
				break ;;
				"Select from databases" )
				break ;;
				"Delete Tables" )
				break ;;
				"Update Tables" )
				break ;;
				"Back to Main Menu" )
					mainmenu
				break ;;
			esac
		done
	done
}


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
					menu
				break ;;
				"Show Databases" )
					echo "___________________________________________"
					echo "Available Databases"
					echo "___________________________________________"
					listdatabases
					echo "___________________________________________"
				break ;;
				"Exit" )
					exit
				break ;;
			esac
		done
	done
}
