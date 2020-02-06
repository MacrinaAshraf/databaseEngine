function CreatINsertTable {
while [ true ]
do
select var in  "Create Table" "quit" 
do
case $var in
"Create Table" )
echo "enter table Name"
read tableName
touch $tableName.meta
touch $tableName.data
echo "$tableName created successfully"
break;;
"quit" )
exit
break;;
esac
done
done

}
CreatINsertTable

