#!/bin/bash

# Function to download files if they don't exist
download_files() {
    [[ ! -f redis-leader-deployment.yaml ]] && wget https://k8s.io/examples/application/guestbook/redis-leader-deployment.yaml
    [[ ! -f redis-leader-service.yaml ]] && wget https://k8s.io/examples/application/guestbook/redis-leader-service.yaml
    [[ ! -f redis-follower-deployment.yaml ]] && wget https://k8s.io/examples/application/guestbook/redis-follower-deployment.yaml
    [[ ! -f redis-follower-service.yaml ]] && wget https://k8s.io/examples/application/guestbook/redis-follower-service.yaml
    [[ ! -f frontend-deployment.yaml ]] && wget https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
    [[ ! -f frontend-service.yaml ]] && wget https://k8s.io/examples/application/guestbook/frontend-service.yaml
}

# Function to deploy files
deploy_files() {
    kubectl apply -f redis-leader-deployment.yaml
    kubectl apply -f redis-leader-service.yaml
    kubectl apply -f redis-follower-deployment.yaml
    kubectl apply -f redis-follower-service.yaml
    kubectl apply -f frontend-deployment.yaml
    kubectl apply -f frontend-service.yaml
}

# Function for port forwarding
port_forward() {
    kubectl port-forward svc/frontend 8080:80
}

# Function to delete deployments and services
delete_resources() {
    kubectl delete deployment -l app=redis
    kubectl delete service -l app=redis
    kubectl delete deployment frontend
    kubectl delete service frontend
}

# Function to get service ports
get_service_ports() {
    echo "Frontend service ports:"
    kubectl get svc frontend -o jsonpath='{range .spec.ports[*]}{.port}{"\n"}{end}'
    
    echo "Redis Leader service ports:"
    kubectl get svc redis-leader -o jsonpath='{range .spec.ports[*]}{.port}{"\n"}{end}'
    
    echo "Redis Follower service ports:"
    kubectl get svc redis-follower -o jsonpath='{range .spec.ports[*]}{.port}{"\n"}{end}'
    echo
}

# Function to scale the frontend deployment
scale_frontend() {
    read -p 'Enter number of replicas: ' replicas
    kubectl scale deployment frontend --replicas=$replicas
}

# Prompt user for action
echo "Enter action (Deploy, Port Forward, Delete, Get Ports, Scale):"
read action

# Perform action based on user input
case $action in
    "Deploy")
        download_files
        deploy_files
        echo "Deployment completed."
        ;;
    "Port Forward")
        port_forward
        ;;
    "Delete")
        delete_resources
        echo "Resources deleted."
        ;;
    "Get Ports")
        get_service_ports
        ;;
    "Scale")
        scale_frontend
        ;;
    *)
        echo "Invalid action. Please enter 'Deploy', 'Port Forward', 'Delete', 'Get Ports', or 'Scale'."
        ;;
esac

