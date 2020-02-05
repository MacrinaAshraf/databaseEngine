#!/bin/bash
function createTable{
#echo "type table Name please";
#read tableName;

while [ true ]
do
select var in  "Create Table"  "quit" 
do
case $var in
"Create Table" )
echo "enter table Name"
read tableName
touch $tableName.meta
touch $tableName.txt
break;;
"quit" )
exit
break;;
esac
done
done


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
