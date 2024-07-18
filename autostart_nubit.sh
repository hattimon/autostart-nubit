#!/bin/bash

# Step 1: Create nubit.sh script
echo "#!/bin/bash

# Logging script start
echo \"Starting Nubit script at \$(date)\" >> /root/nubit-light.log

# Running main command
curl -sL1 https://nubit.sh | bash >> /root/nubit-light.log 2>&1

# Logging script finish
echo \"Nubit script finished at \$(date)\" >> /root/nubit-light.log" > /usr/local/bin/nubit.sh

# Make nubit.sh executable
chmod +x /usr/local/bin/nubit.sh

# Step 2: Create nubit.service unit file
echo "[Unit]
Description=Run Nubit script on startup
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/nubit.sh
User=root
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/nubit.service

# Step 3: Reload systemd, start and enable nubit.service
systemctl daemon-reload
systemctl start nubit.service
systemctl enable nubit.service

echo "Setup completed successfully."
