#!/bin/bash

function createTable {
    path=$1/$2
    touch $path.meta
    touch $path.data

    validFlag=false
    while [ "$validFlag" == false ]
    do
        read -p "Enter how many columns do you want to add to you table: " noOfColumns
        if [[ $noOfColumns =~ ^[1-9]+$ ]]
        then
            validFlag=true
        else 
            echo "Invalid input, try again"
        fi
    done
    echo $noOfColumns > $path.meta

    counter=0

    while [ "$counter" != "$noOfColumns" ]
    do 
        read -p "Enter the name of the column: " colName
        echo $colName >> $path.meta
        
        read -p "Enter the type of the column: " colType
        echo $colType >> $path.meta
        
        let counter=$counter+1

    done 
    
}

function showTables {
    path=$1
    cd $path

    tables=(`ls *.data`)

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

function Insert{
    echo "Insert Datatypes type ok to stop"    
    read datatype
    while [$read != "stop"]
    do
    echo "$datatype ," >> $tableName.meta
    done
    x=wc -w $tableName.meta
    echo  "Data you want to store"
      read data
      for ((I=0;I<x;I++))
       do
      echo "$read , " >> $tableName.txt   
    done  

}
