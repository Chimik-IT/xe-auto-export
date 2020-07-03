#!/bin/bash

#pattern=$1

names=`xe vm-list | grep name-label | grep $pattern | cut -d ":" -f2`

vmnames=""

for vm in `cat $names`;do
    $vm >> VM
done

echo Bitte prüfen Sie die erstellte VM Datei.
echo 1 OK
echo 2 Abbrechen

for vm in `cat VM`;do
    uuid=xe vm-list name-label="`cat $vm`" | grep uuid | cut -d ":" -f2
    echo "`cat $vm`:`cat $uuid`" >> VM-EXPORT
done
rm VM
echo Exportdatei bereit!
exit

 
