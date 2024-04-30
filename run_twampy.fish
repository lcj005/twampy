#!/usr/bin/env fish

# Check if sufficient arguments are provided
if test (count $argv) -lt 2
    echo "Usage: sudo ./run_twampy.fish [IP Address] [Port]"
    exit 1
end

# Assign arguments to variables
set ip_address $argv[1]
set port $argv[2]

# Display the variables (for debugging purposes)
echo "Using IP Address: $ip_address"
echo "Using Port: $port"

# Disable the firewall
echo "Disabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
echo "Firewall is disabled."

# Run the Python script with the provided IP address and port
echo "Running the Python script..."
python twampy.py sender $ip_address:$port

# Re-enable the firewall
echo "Re-enabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
echo "Firewall is re-enabled."
