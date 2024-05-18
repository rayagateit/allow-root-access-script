mkdir -p /tmp

# Create the script file and write the content
cat > /tmp/allow_root_access.sh <<EOF
#!/bin/bash

# Update and upgrade system packages
apt update && apt upgrade -y

# Install ssh
apt install ssh -y

# allow root access
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# restart ssh
sudo systemctl restart ssh

echo "root access is allowed"
EOF

# Give execute permission to allow_root_access.sh
chmod +x /tmp/allow_root_access.sh

# Run allow_root_access.sh
/tmp/allow_root_access.sh

rm -r /tmp/allow_root_access.sh


#!/bin/bash

# Get the server IP address
server_ip=$(hostname -I | awk '{print $1}')


# Print the clickable link
echo "To log in to the server root via SSH, open the terminal and write: ssh root@${server_ip}"

