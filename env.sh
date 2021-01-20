#!/bin/bash

# Remote machine IP 
export SERVERSPEC_IP=<IP>

# Set remote host machin user
export SERVERSPEC_USER=<USER>

# Path to private key of remote machine
export SERVERSPEC_SSH_KEY=<PATH_TO_KEY>

# Remote machine password 
#export SERVERSPEC_PASSWORD=<PASSWORD>

# If set, it'll ask password runtime (if you dont want to store password)
#export ASK_SSH_PASSWORD=<ANYTHING>

# Local path to store rspec reports
export RESULT_PATH=./report

# In case need to communicate on different port.
#export SERVERSPEC_SSH_PORT=<PORT>