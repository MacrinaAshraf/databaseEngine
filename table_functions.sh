#!/bin/bash

function createTable {
    filePath=$1/$2
    touch $filePath.meta
    touch $filePath.data

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
    echo $noOfColumns > $filePath.meta

    counter=0
    echo "___________________________________________"
    while [ "$counter" != "$noOfColumns" ]
    do 
    #Validation on Column name to ensure that the colName variable will only hold letters
        validFlag=false
        while [ "$validFlag" == false ]
        do
            read -p "Enter the name of the column: " colName
            if [[ $colName =~ ^([[:lower:]]|[[:upper:]])+$ ]]
            then
                validFlag=true
            else 
                echo "Invalid input, try again"
            fi
        done
        echo "name:$colName" >> $filePath.meta

        echo "Choose the type of the column: " 
        echo "1) String"
		echo "2) Int"
        read colType
            
        case $colType in
            1 ) 
            echo "datatype:string" >> $filePath.meta
            ;;
            2 ) 
            echo "datatype:int" >> $filePath.meta
            ;;
            * ) 
            echo "Invalid input, try again"
            ;;
        esac
        
        let counter=$counter+1
        
        echo "___________________________________________"
    done
}

function showTables {
    filePath=$1
    cd $filePath

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
    #filePath to table file is sent as 2 parameters to this function from sub_menu.sh 
    if [ -f "$1/$2.data" ]
    then
        rm -r  $1/$2.*
        echo "$2 deleted successfully"
    else
        echo "This is not a valid file "
        echo "Please re-enter a valid name when you try again"
    fi
}

function selectFromTable {
    lines=$( sed -n 'p' $1/$2.data )
    if [ -z  "$lines" ]
    then 
        echo "This table is Empty!";
    else
        printf '%s\n' "${lines[@]}"
    fi 
}

function insertInTable {
    filePath=$1/$2
    noOfColumns=`sed -n '1p' $filePath.meta`
    let temp=$noOfColumns-1

    colNames=(`grep "^name" $filePath.meta | cut -d: -f2`)
    colTypes=(`grep "^datatype" $filePath.meta | cut -d: -f2`)
    
    counter=0
    data=""
    while [ "$counter" != "$noOfColumns" ]
    do
        validFlag=false
        while [ "$validFlag" = false ]
        do
            echo "Enter data for column ${colNames[counter]}"
            read entry
            if [ "$entry" != "" ] 
            then
                if [ "${colTypes[counter]}" = "int" ] 
                then
                    if [[ "$entry" =~ ^[1-9]+$ ]]
                    then
                        if [ "$counter" = "$temp" ]
                        then
                            data+=$entry
                        else 
                            data+="$entry:"
                        fi
                        validFlag=true
                    else 
                        echo "Wrong datatype"
                    fi
                else 
                    if [[ "$entry" =~ ^([[:lower:]]|[[:upper:]])+$ ]]
                    then
                        if [ "$counter" = "$temp" ]
                        then
                            data+=$entry
                        else 
                            data+="$entry:"
                        fi
                        validFlag=true
                    else 
                        echo "Wrong datatype"
                    fi
                fi
                else 
                    echo "Invalid input"
            fi
        done
        let counter=$counter+1
    done
    echo $data >> $filePath.data
}
