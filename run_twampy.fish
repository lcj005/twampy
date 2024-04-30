#!/usr/bin/env fish

# Check if sufficient arguments are provided
if test (count $argv) -lt 2
    echo "Usage: sudo ./run_twampy.fish [IP Address] [Remote Port] [Local Port]"
    exit 1
end

# Assign arguments to variables
set ip_address $argv[1]
set remote_port $argv[2]

# Check if the local port is provided, otherwise use default 20000
if test (count $argv) -ge 3
    set local_port $argv[3]
else
    set local_port 20000
end

# Display the variables (for debugging purposes)
echo "Using IP Address: $ip_address"
echo "Using Remote Port: $remote_port"
echo "Using Local Port: $local_port"

# Disable the firewall
echo "Disabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
echo "Firewall is disabled."

# Run the Python script with the provided IP address, remote port & local port
echo "Running the Python script..."
python twampy.py sender $ip_address:$remote_port :$local_port

# Re-enable the firewall
echo "Re-enabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
echo "Firewall is re-enabled."
