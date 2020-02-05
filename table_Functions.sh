while [ true ]
do
select var in  "Create Table"  "Delete table"  "quit" 
do
case $var in
"Create Table" )
echo "enter table Name"
read tableName
touch $tableName.meta
touch $tableName.txt
echo "$tableName created successfully"
    while [true]
    do
    select tabledata in "Insert Data"  "Exit"
    do
   case $tabledata in
    "Insert Data" )
    echo "Insert Datatypes"
    #vi $tableName.meta
    read datatype
    echo $datatype >> $tableName.meta
    read datatype
    echo $datatype >> $tableName.meta
    read datatype
    echo $datatype >> $tableName.meta
    echo  "Data you want to store"
      read data
   for (I=1;I <3 ; I++)
    do
    echo "$read , " >> $tableName.txt   
   done
   break;;
   "EXit" )
    exit
    break;;
    esac
    done
    done
break;;
"Delete table" )
rm $tableName.meta
rm $tableName.txt
break;;
"quit" )
exit
break;;
esac
done
done

