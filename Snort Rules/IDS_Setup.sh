#!/bin/bash

# ==============================================================================
# Black Lab - Snort 2 IDS Automated Setup & Rule Updater
# ==============================================================================

# Updated to match your system's actual network interface
INTERFACE="ens33"
SUBNET="192.168.1.0/24"

echo "[*] Initializing Black Lab Snort 2 Setup..."

# 1. Install missing PulledPork dependencies
echo "[*] Installing PulledPork dependencies..."
sudo apt-get install -y libcrypt-ssleay-perl liblwp-useragent-determined-perl

# 2. Download and install PulledPork globally (This was missing from the last script)
echo "[*] Installing PulledPork..."
cd /tmp
wget -q https://github.com/shirkdog/pulledpork/archive/master.tar.gz -O pp.tar.gz
tar -xzf pp.tar.gz
sudo cp pulledpork-master/pulledpork.pl /usr/local/bin/
sudo chmod +x /usr/local/bin/pulledpork.pl

# 3. Network Preparation
echo "[*] Setting $INTERFACE to promiscuous mode..."
sudo ip link set $INTERFACE promisc on

# 4. Directory Prep
echo "[*] Creating required directories..."
sudo mkdir -p /etc/snort/rules/iplists
sudo touch /etc/snort/rules/iplists/default.blocklist
sudo touch /etc/snort/rules/local.rules

# 5. PulledPork Configuration
echo "[*] Writing pulledpork.conf..."
sudo cat << 'EOF' > /etc/snort/pulledpork.conf
rule_url=https://snort.org/downloads/community/|community-rules.tar.gz|Community
rule_url=https://rules.emergingthreats.net/|emerging.rules.tar.gz|open-nogpl
ignore=deleted.rules,experimental.rules,local.rules
temp_path=/tmp
rule_path=/etc/snort/rules/snort.rules
local_rules=/etc/snort/rules/local.rules
config_path=/etc/snort/snort.conf
sid_msg=/etc/snort/sid-msg.map
sid_msg_version=1
sid_changelog=/var/log/sid_changes.log
snort_path=/usr/sbin/snort
distro=Debian-10
block_list=/etc/snort/rules/iplists/default.blocklist
IPRVersion=/etc/snort/rules/iplists
version=0.8.0
EOF

# 6. Fix Snort.conf network variables and rule includes
echo "[*] Configuring snort.conf for $SUBNET..."
# Set correct subnet strings natively in the config file
sudo sed -i "s|^ipvar HOME_NET.*|ipvar HOME_NET $SUBNET|" /etc/snort/snort.conf
sudo sed -i "s|^ipvar EXTERNAL_NET.*|ipvar EXTERNAL_NET any|" /etc/snort/snort.conf

# Disable all default rule includes to prevent rule crashing/duplication
sudo sed -i 's/^include \$RULE_PATH/#include $RULE_PATH/' /etc/snort/snort.conf

# Ensure PulledPork's master rule file is the only one included
if ! grep -q "include \$RULE_PATH/snort.rules" /etc/snort/snort.conf; then
    echo "include \$RULE_PATH/snort.rules" | sudo tee -a /etc/snort/snort.conf > /dev/null
else
    # Re-enable it if the sed command above accidentally commented it out
    sudo sed -i 's/^#include \$RULE_PATH\/snort.rules/include $RULE_PATH\/snort.rules/' /etc/snort/snort.conf
fi

# 7. Run PulledPork
echo "[*] Running PulledPork to download and compile rules..."
sudo pulledpork.pl -c /etc/snort/pulledpork.conf -l

echo ""
echo "[+] ======================================================================"
echo "[+] Setup Complete. Snort 2 rules are ready for $INTERFACE."
echo "[+] Start the IDS by running this exact command:"
echo ""
echo "sudo snort -q -c /etc/snort/snort.conf -i $INTERFACE -A console"
echo "[+] ======================================================================"