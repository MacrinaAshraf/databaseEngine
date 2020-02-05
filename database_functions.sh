#!/bin/bash

. ./sub_menu.sh

function showDatabases {
    #getting databses from folder and putting them in dbArray
    dbArray=(`ls Database`)

    if [ "${#dbArray[@]}" != 0 ];
    then
        for i in ${dbArray[@]}
        do
            echo $i
        done
    else
        echo "There are no databases to show."
    fi
}

function connectToDatabase {
    path="Database/$1"
    if [ -d "$path" ]
    then
        echo "Switched to $1"
        menu $path
    else
        echo "This database does not exist"
    fi
}

function createDatabase {

	echo "type Database Name please";
	read dbName;

	if [ -d "Database/$dbName" ]
	then
 		echo "$dbName already exists"
	else
		mkdir Database/$dbName;
 		echo "$dbName created successfully";
	fi
}

function dropDatabase {
    if [ -d "Database/$1" ]
    then
        rm -r Database/$1
        echo "$1 is deleted successfully"
    else
        echo "This is not a valid database name"
        echo "Please try again with the right name"
    fi
}
