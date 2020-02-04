#!/bin/bash

. ./sub_menu.sh

function listDatabases {
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

function connectToDatabase {
    
    if [ -d "Database/$1" ]
    then
        echo "Switched to database $1"
        menu $1
    else
        echo "This database does not exist"
    fi
}