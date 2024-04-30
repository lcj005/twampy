#!/bin/bash

# Check if sufficient arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: sudo ./run_twampy.sh [IP Address] [Remote Port] [Local Port]"
    exit 1
fi

# Assign arguments to variables
ip_address=$1
remote_port=$2

# Check if the local port is provided, otherwise use default 20000
if [ $# -ge 3 ]; then
    local_port=$3
else
    local_port=20000
fi

# Display the variables (for debugging purposes)
echo "Using IP Address: $ip_address"
echo "Using Remote Port: $remote_port"
echo "Using Local Port: $local_port"

# Run the Python script with the provided IP address, remote port & local port
echo "Running the Python script..."
python twampy.py sender $ip_address:$remote_port :$local_port
