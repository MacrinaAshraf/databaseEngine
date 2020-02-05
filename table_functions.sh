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
