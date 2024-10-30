#!/bin/bash

# Prompt for SSH credentials
read -p 'Enter SSH username@host for ssh server: ' ssh_credentials
read -p 'Enter SSH username@host for your k8s machine: ' k8s_credentials

# Connect to the first SSH server and set up port forwarding, then execute the second SSH within
ssh -t $ssh_credentials -L 8080:localhost:9999 "ssh $k8s_credentials -L 9999:localhost:8080"

