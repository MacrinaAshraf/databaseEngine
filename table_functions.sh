#!/bin/bash

function createTable {
    path=$1
    tableName=$2

    touch $1/$tableName.data
    touch $1/$tableName.meta
    
}

function deleteTable {
    #path to table file is sent as 2 parameters to this function from sub_menu.sh 
    if [ -f "$1/$2.data" ]
    then
        rm -r  $1/$2.*
        echo "$2 deleted successfully"
    else
        echo "This is not a valid file "
        echo "Please re-enter a valid name when you try again"
    fi
    echo "path = $1/$2"
}