#!/bin/bash

function menu {
	. ./table_functions.sh
	path=$1
	while [ true ]
	do
		echo "___________________________________________"
		select i in "Show Tables" "Create Table" "Insert in Table" "Select from Table" "Delete Table" "Back to Main Menu"
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
				"Select from Table" )
				break ;;
				"Delete Table" )
					echo "___________________________________________"
					echo "Enter a table name to delete"
					read tableName
					echo "___________________________________________"
					echo "1) Delete the whole table"
					echo "2) Delete a record from the table"
					read choice
					case $choice in
						1 ) 
						deleteTable $path $tableName
						;;
						2 ) 
						deleteRecordFromTable $path $tableName
						;;
						* ) 
						echo "This is not a valid choice"
						;;
					esac
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
