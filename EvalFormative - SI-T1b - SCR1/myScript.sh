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
                echo "vous avez entrer les variable optionneles $1 $2 $3";
#                cat vsftpd | awk -F= 'NF == 2 && !/\s*#/ && $1 ~/'$only'/ {print $1}'
                cat $1 | awk '{if( !/^#/ && $1 == "'$2'"){$3 = "'$3'"};print }' >  outputFile
                #cat outputFile > $1


        fi
fi