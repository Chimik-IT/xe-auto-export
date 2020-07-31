#!/bin/bash

pattern=$1

names=`xe vm-list | grep name-label | grep $pattern | cut -d ":" -f2`

for vm in `cat $names`;
do
    uuid=xe vm-list name-label="`cat $vm`" | grep uuid | cut -d ":" -f2
    echo "`cat $vm`:`cat $uuid`" >> VM-EXPORT
done
echo Exportdatei bereit!

exit

 
