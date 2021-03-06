#!/bin/bash

function menu {
	. ./table_functions.sh
	path=$1
	while [ true ]
	do
		PS3="Enter your choice: "
		echo "___________________________________________"
		select i in "Show Tables" "Create Table" "Insert in Table" "Select from Table" "Delete Table" "Back to Main Menu"
		do
			case $i in
				"Show Tables" ) 
					showTables $path
				break ;;
				"Create Table" )
					echo "___________________________________________"
					echo "Enter the name of the new table"
					read -e tableName
					echo "___________________________________________"
					
					createTable $path $tableName
				break ;;
				"Insert in Table" )
					echo "___________________________________________"
					echo "Enter the name of the table"
					read -e tableName
					echo "___________________________________________"
                   insertInTable $path $tableName
				break ;;
				"Select from Table" )
					echo "___________________________________________"
					echo "Enter a table name to show its data"
					read -e tableName
					echo "___________________________________________"
					selectFromTable $path $tableName
				break ;;
				"Delete Table" )
					echo "___________________________________________"
					echo "Enter a table name to delete"
					read -e tableName
					echo "___________________________________________"
					echo "1) Delete the whole table"
					echo "2) Delete a record from the table"
					read -e choice
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
