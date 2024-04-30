#!/usr/bin/env fish

# Disable the firewall
echo "Disabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
echo "Firewall is disabled."

# Run the Python script
echo "Running the Python script..."
python twampy.py sender 192.168.191.223:27031

# Re-enable the firewall
echo "Re-enabling the firewall..."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
echo "Firewall is re-enabled."
