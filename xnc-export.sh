#!/bin/bash

vm=""
vm_id=`cat $vm | cut -d ' ' -f1`
vm_name=`cat $vm | cut -d ' ' -f2 | sed 's/\ /_/g'`

for $vm in `cat vm-list`;
do
    echo "$vm wird herunter gefahren..."
    xe vm-shutdown uuid="`${vm_id}`" force=true
    # aus
    echo "$vm wird exportiert..."
    xe vm-export uuid="`${vm_id}`" filename="${vm_name}.xen"
    echo "Export von $vm erfolgreich beendet"
done
echo Alle VMs exportiert
exit
