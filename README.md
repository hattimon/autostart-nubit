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
      To view the logs of the NUBIT NODE, use:

   ```bash
   sudo cat /root/nubit-light.log
   ```


## About the Script

The `autostart_nubit.sh` script performs the following actions:
- Logs the start and completion of the script execution.
- Downloads and executes the Nubit installation script via `curl`.
- Configures the systemd service to manage the Nubit node.

############################################################################
# Uninstallation of Nubit Autostart Setup

To remove the Nubit autostart setup and revert all changes made by the `autostart_nubit.sh` script, follow these steps:

## Uninstallation Instructions

1. **Clone the Repository**

   If you haven't already, clone the repository that contains the uninstallation script:

   ```bash
   git clone https://github.com/hattimon/autostart-nubit.git
   cd autostart-nubit


2. **Make the Script Executable**

   Change the script permissions to make it executable:

   ```bash
   chmod +x uninstall_autostart_nubit.sh
   ```

3. **Run the Uninstallation Script**

   Execute the script to remove the Nubit autostart setup:

   ```bash
   ./uninstall_autostart_nubit.sh
   ```

4. **Verify Removal**

   To ensure the service has been completely removed, you can check the list of systemd services:

   ```bash
   systemctl list-units --type=service | grep nubit
   ```

   You should not see `nubit.service` listed.

## About

This script automates the process of removing the Nubit service and its associated script, undoing the changes made by the `autostart_nubit.sh` script.
