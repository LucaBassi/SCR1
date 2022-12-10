#!/bin/bash

#cat vsftpd | awk '/(instances)/ && /=/' | awk '{ print $3 }'

CONTENT=''

if [ -z ${1+x} ] || [ -z ${2+x} ] ; then

        echo "Usage: ./update-conf-awk <config-file> <entry_name> [<entry_value>] ";

else

        if [ -z ${3+x} ] ; then

                echo "vous avez entrer les variable oligatoires $1 $2";
                cat $1 | awk '/('$2')/ && !/^#/' | awk '{ print $3 }'

        else

                cat vsftpd | awk '{if( !/^#/ && $1 == "'$2'"){$3 = "'$3'"};print }' >  outputFile

                echo "vous avez entrer les variable optionneles $1 $2 $3";
                echo $1
                echo $2
                echo $3

        fi
fi