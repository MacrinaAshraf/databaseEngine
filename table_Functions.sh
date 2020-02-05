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
touch $tableName.txt
echo "$tableName created successfully"
    while [ true ]
    do
    select tabledata in "Insert Data"  "Exit"
    do
   case $tabledata in
    "Insert Data" )
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
     break;;
   "EXit" )
    exit
    break;;
    esac
    done
    done
break;;
"quit" )
exit
break;;
esac
done
done

}
CreatINsertTable

