#!/bin/bash

function listdatabases {
    #getting databses from folder and putting them in dbArray
    dbArray=(`ls Database`)

    if [ "${#dbArray[@]}" != 0 ];
    then
        for i in ${dbArray[@]}
        do
            echo $i
        done
    else
        echo "There are no dbArray to show."
    fi
}

function createDatabase {

	echo "type Database Name please";
	read dbName;

	if [ -d "Database/$dbName" ]
	then
		clear
 		echo "$dbName is already exist"
	else
		mkdir Database/$dbName;
		#cd "Database/$dbName"
 		echo "$dbName created successfully";
	fi
}






listdbArray
