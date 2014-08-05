#!/bin/bash
# USAGE: ./bootstrap_env.sh <env config file>

while read line
do
        # Check if the line is commented out... if not:
        if echo $line | grep -v ^#
                then
                echo "Machine definition = $line"
                image_name=`echo $line | awk -F:: '{print $1}'`
                flavor_name=`echo $line | awk -F:: '{print $2}'`
                net_id=`echo $line | awk -F:: '{print $3}'`
                availability_zone=`echo $line | awk -F:: '{print $4}'`
                hypervisor=`echo $line | awk -F:: '{print $5}'`
                instance_name=`echo $line | awk -F:: '{print $6}'`
                echo "Bootstrapping $instance_name"


                nova boot --image "$image_name" --flavor "$flavor_name" --nic net-id="$net_id" --availability-zone "$availability_zone":"$hypervisor" "$instance_name" &> logs/bootstrap-$instance_name.log
                if [ $? -ne 0 ]
                        then
                        echo "Creation of $instance_name : FAILED"
                else
                        echo "Creation of $instance_name : PASSED"
                fi
                sleep 10
        fi

done < $1

echo "All bootstraps defined in $1 are complete. Check individual logs for information. "


