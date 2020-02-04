#!/bin/bash

function menu {
	path=$1
	while [ true ]
	do
		echo "___________________________________________"
		select i in "Show Tables" "Create Table" "Select from databases" "Delete Table" "Update Table" "Back to Main Menu"
		do
			case $i in
				"Show Tables" ) 
				break ;;
				"Create Tables" )
				break ;;
				"Select from Tables" )
				break ;;
				"Delete Tables" )
				break ;;
				"Update Tables" )
				break ;;
				"Back to Main Menu" )
					mainmenu
				break ;;
				* )
					echo "This is not a valid choice"
				break ;;
			esac
		done
	done
}