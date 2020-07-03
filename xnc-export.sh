#!/bin/bash

vm=""
vm_id=`cat $vm | cut -d ' ' -f1`
vm_name=`cat $vm | cut -d ' ' -f2 | sed 's/\ /_/g`

for $vm in `cat vm-list`;do
    echo "$vm wird exportiert..."
    xe vm-export vm="`${vm_id}`" filename="${vm_name}.xen"
    
done
echo Alle VMs exportiert
exit
