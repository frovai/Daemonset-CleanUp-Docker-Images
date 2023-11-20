#!/bin/bash
export CRICTL="/usr/local/bin/crictl"

export CONTAINER_RUNTIME_ENDPOINT="unix:///run/containerd/containerd.sock"

while true; do

    IMAGES=$($CRICTL images --no-trunc | grep "MYAWSACCOUNTID.dkr.ecr.us-east-1.amazonaws.com" | awk '{print $3}')

    USED_IMAGES=$($CRICTL ps --no-trunc | awk '{print $2}' | grep -iv "image")

    for image in $IMAGES; do
        image_in_use=false
        for used_image in $USED_IMAGES; do
            if [[ "$image" == "$used_image" ]]; then
                image_in_use=true
                break
            fi
        done
        
        if [[ "$image_in_use" == "false" ]]; then
            echo "Deleting image ID: $image"
            $CRICTL rmi "$image"
        fi
    done
    
    sleep 86400

done
