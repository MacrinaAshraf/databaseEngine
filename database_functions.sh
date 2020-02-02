#!/bin/bash

function listDatabases {

    databases=(`ls Database`)

    if [ "${#databases[@]}" != 0 ];
    then
        for i in ${databases[@]}
        do
            echo $i
        done
    else
        echo "There are no Databases to show."
    fi

}

listDatabases