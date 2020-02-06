#!/bin/bash

function createTable {

    touch $1/$2.meta
    touch $1/$2.data
    
}

function showTables {
    path=$1
    cd $path

    tables=(`ls *.data`)
    echo ${tables[0]}
    if [ "${#tables[@]}" != 0 ];
    then
        for i in ${tables[@]}
        do
            echo $i | cut -d. -f1
        done
    else
        echo "There are no tables to show."
    fi
    cd ..
    cd ..
}

function deleteRecordFromTable {
    if [ -f "$1/$2.data" ]
    then
        noOfRows=`cat $1/$2.data | wc -l`
        echo $noOfRows
        if [ "$noOfRows" == "0" ]
        then 
            echo "This Table is empty"
        else
            echo "Enter the row that you want to delete"
            read row
            if [ "$row" -gt "$noOfRows" ]
                then 
                echo "This number is out of range"
            elif [ "$row" -le "0" ]
                then
                echo "$row is out of range"
            else
                sed -i "$row d" $1/$2.data
            fi
        fi
    else
        echo "This is not a valid file "
        echo "Please re-enter a valid name when you try again"
    fi
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
}