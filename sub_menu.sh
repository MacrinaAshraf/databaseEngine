#!/bin/bash

. ./table_functions.sh

function menu {
	path=$1
	while [ true ]
	do
		echo "___________________________________________"
		select i in "Show Tables" "Create Table" "Select from Table" "Delete Table" "Update Table" "Back to Main Menu"
		do
			case $i in
				"Show Tables" ) 
				break ;;
				"Create Table" )
				break ;;
				"Select from Table" )
				break ;;
				"Delete Table" )
					echo "___________________________________________"
					echo "Enter a table name to delete"
					read tableName

					deleteTable $path $tableName
				break ;;
				"Update Table" )
				break ;;
				"Back to Main Menu" )
					return
				break ;;
				* )
					echo "This is not a valid choice"
				break ;;
			esac
		done
	done
}