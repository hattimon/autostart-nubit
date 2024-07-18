# autostart-nubit

# Nubit Autostart Setup

This guide explains how to install and configure the Nubit node to start automatically on Ubuntu using the provided `autostart_nubit.sh` script.

First, install the NUBIT NODE following the official instructions: 
https://docs.nubit.org/nubit-da/run-a-node. 
After a successful installation, install the autostart-nubit.sh script.

## Installation Instructions

1. **Clone the Repository**

   Open a terminal and run the following command to clone the repository:

   ```bash
   git clone https://github.com/hattimon/autostart-nubit.git
   ```

2. **Navigate to the Repository Directory**

   Change to the directory where the repository was cloned:

   ```bash
   cd autostart-nubit
   ```

3. **Make the Script Executable**

   Ensure that the `autostart_nubit.sh` script is executable:

   ```bash
   chmod +x autostart_nubit.sh
   ```

4. **Run the Installation Script**

   Execute the script with superuser privileges to set up the Nubit service:

   ```bash
   sudo ./autostart_nubit.sh
   ```

   This script will:
   - Create the `nubit.sh` script with necessary commands.
   - Set up a systemd service unit file (`nubit.service`).
   - Enable and start the Nubit service to ensure it runs at system startup.

5. **Verify the Service Status**

   Check the status of the Nubit service to ensure it is running correctly:

   ```bash
   sudo systemctl status nubit.service
   ```

   To view the logs of the Nubit service, use:

   ```bash
   sudo journalctl -u nubit.service -f
   ```

## About the Script

The `autostart_nubit.sh` script performs the following actions:
- Logs the start and completion of the script execution.
- Downloads and executes the Nubit installation script via `curl`.
- Configures the systemd service to manage the Nubit node.
