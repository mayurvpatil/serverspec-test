#!/bin/bash

# Remote machine IP 
export SSH_HOST=<IP>

# Set remote host machin user
export SSH_USER=<USER>

# Path to private key of remote machine
export SSH_KEY=<PATH TO KEY>

# Remote machine password 
#export SSH_PASSWORD=<PASSWORD>

# If set, it'll ask password runtime (if you dont want to store password)
#export ASK_SSH_PASSWORD=<ANYTHING>

# Local path to store rspec reports
export RESULT_PATH=./report

# In case need to communicate on different port.
#export SSH_PORT=<PORT>