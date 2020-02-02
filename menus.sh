#!/bin/bash

function menu {
	while [ true ]
	do
		select i in "List Tables" "Create Table" "Delete Table" "Update Table" "Back to Main Menu"
		do
			case $i in
				"List Tables" ) 
				break ;;
				"Create Tables" )
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
	while [ true ]
	do
		select i in "Create Database" "Connect to Database" "List Databases" "Exit"
		do
			case $i in
				"Create Database" ) 
				break ;;
				"Connect to Database" )
					menu
				break ;;
				"List Databases" )
				break ;;
				"Exit" )
					exit
				break ;;
			esac
		done
	done
}
