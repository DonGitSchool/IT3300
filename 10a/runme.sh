#!/bin/bash

# Prompt to change password
read -p 'Do you want to change the MySQL password? (y/n): ' change_pass
if [[ "$change_pass" == "y" || "$change_pass" == "Y" ]]; then
    read -sp 'Enter new MySQL password: ' new_password
    echo
    # Update kustomization.yaml with the new password
    sed -i "s/password=placeholderpass/password=$new_password/" kustomization.yaml
fi

# Stop and delete deployments
kubectl delete deployment wordpress
kubectl delete deployment wordpress-mysql

# Prompt to remove PVC storage
read -p 'Do you want to remove PVC storage? (y/n): ' remove_pvc
if [[ "$remove_pvc" == "y" || "$remove_pvc" == "Y" ]]; then
    kubectl delete pvc --all
fi

# Stop all services
kubectl delete service wordpress
kubectl delete service wordpress-mysql

# Apply the updated kustomization.yaml
kubectl apply -k ./

echo "Deployments and services managed, password updated if specified, PVC storage removed if requested, and redeployed."

