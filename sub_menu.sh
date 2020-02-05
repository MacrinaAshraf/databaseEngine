#!/bin/bash

. ./table_functions.sh

function menu {
	path=$1
	while [ true ]
	do
		echo "___________________________________________"
<<<<<<< HEAD
		select i in "Show Tables" "Create Table" "Insert in table" "Select from Table" "Delete Table" "Back to Main Menu"
=======
		select i in "Show Tables" "Create Table" "Insert in Table" "Select from Table" "Delete Table" "Back to Main Menu"
>>>>>>> 732362d6af7b17c4f948b43c42ee20a455c88996
		do
			case $i in
				"Show Tables" ) 
					showTables $path
				break ;;
				"Create Table" )
					echo "___________________________________________"
					echo "Enter a the name of the new table"
					read tableName

					createTable $path $tableName
				break ;;
				"Insert in Table" )
				break ;;
				"Insert in table" )
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
