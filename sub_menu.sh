#!/bin/bash

. ./table_functions.sh

function menu {
	path=$1
	while [ true ]
	do
		echo "___________________________________________"
		select i in "Show Tables" "Create Table" "Insert Table" "Select from Table" "Delete Table" "Back to Main Menu"
		do
			case $i in
				"Show Tables" ) 
				break ;;
				"Create Table" )
					echo "___________________________________________"
					echo "Enter a the name of the new table"
					read tableName

					createTable $path $tableName
				break ;;
				"Insert Table" )
				break ;;
				"Select from Table" )
				break ;;
				"Delete Table" )
					echo "___________________________________________"
					echo "Enter a table name to delete"
					read tableName

					deleteTable $path $tableName
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