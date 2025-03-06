# Defguard gateway Ansible Playbook

This Ansible playbook automates the configuration and deployment of Defguard gateway, including the setup of Defguard groups, networks, and gateway deployment.

## Prerequisites

- Ansible installed on the control machine.
- Access to the Defguard API with a valid token.
- Target machines should be accessible from the control machine.

## Playbook Structure

The playbook is structured into several files:

- `tasks/main.yml`: Main entry point for the playbook.
- `tasks/_defguard.yml`: Tasks related to Defguard configuration.
- `tasks/_gateway.yml`: Tasks related to gateway deployment.
- `vars/main.yml`: Variables used in the playbook.
- `templates/gateway.toml.j2`: Template for the gateway configuration file.
- `files/`: Directory containing necessary files for the deployment.

## Variables

The following variables are defined in `vars/main.yml`:

- `defguard_api_url`: URL of the Defguard API.
- `defguard_gw_group`: Name of the Defguard group, used in the network (location).
- `defguard_gw_name`: Name of the Defguard network (location).
- `defguard_gw_ip`: IP address of the Defguard gateway in the VPN.
- `defguard_gw_allowed_ips`: Accessible IPs through the Defguard network (location).
- `defguard_gw_dns`: DNS server for the Defguard network (location).
- `defguard_gw_public_ip`: Public IP address of the Defguard gateway.
- `defguard_keepalive_interval`: Keepalive interval for the Defguard network.
- `defguard_mfa`: Multi-factor authentication status.
- `defguard_peer_disconnect_threshold`: Peer disconnect threshold for the Defguard network.
- `defguard_gw_port`: Port for the Defguard gateway.
- `defguard_gw_package_url`: URL of the Defguard gateway package.
- `defguard_deployment`: Flag to indicate if the gateway deployment or the upgrade of the gateway should be performed. True -> Deployment, False -> Upgrade.

## Tasks

### Defguard Configuration (`tasks/_defguard.yml`)

1. **Get Current Defguard Groups**: Fetches the current Defguard groups from the API.
2. **Create Defguard Group**: Creates a new Defguard group if it does not already exist.
3. **Get Current Defguard Networks**: Fetches the current Defguard networks from the API.
4. **Format Defguard Networks**: Formats the network data for easier access.
5. **Create Defguard Network**: Creates a new Defguard network if it does not already exist.
6. **Modify Defguard Network**: Modifies an existing Defguard network if it already exists.
7. **Set Defguard Network Variables**: Sets variables for the Defguard network ID and public key.
8. **Get Defguard Network Token**: Fetches the token for the Defguard network.
9. **Set Defguard Network Token Variable**: Sets the variable for the Defguard network token.

### Gateway Deployment (`tasks/_gateway.yml`)

1. **Define Defguard Package Name**: Defines the name of the Defguard package.
2. **Gather Package Facts**: Gathers facts about installed packages.
3. **Download Defguard Gateway Package**: Downloads the Defguard gateway package.
4. **Install Defguard Gateway Package**: Installs the Defguard gateway package.
5. **Install Wireguard Tools**: Installs Wireguard tools for troubleshooting.
6. **Create Gateway Configuration File**: Creates the gateway configuration file from a template.
7. **Copy Defguard CA Certificate**: Copies the Defguard CA certificate to the target machine.
8. **Copy Up Script**: Copies the up script to the target machine.
9. **Copy Down Script**: Copies the down script to the target machine.
10. **Activate IP Forwarding**: Activates IP forwarding on the target machine.
11. **Enable and Start Defguard Gateway Service**: Enables and starts the Defguard gateway service.
12. **Restart Defguard Gateway Service**: Restarts the Defguard gateway service if it is already installed.
13. **Copy Prometheus Wireguard Exporter Binary**: Copies the Prometheus Wireguard exporter binary to the target machine.
14. **Copy Prometheus Wireguard Exporter Service File**: Copies the Prometheus Wireguard exporter service file to the target machine.
15. **Start Prometheus Wireguard Exporter**: Starts the Prometheus Wireguard exporter service.

## Files

- `files/defguard-ca.pem`: Defguard CA certificate.
- `files/down_script.sh`: Bash script launched when the Defguard gateway goes down.
- `files/up_script.sh`: Bash script launched when the Defguard gateway goes up.
- `files/wg-exporter.service`: Service file for the Wireguard Prometheus exporter.
- `files/wireguard_exporter`: Binary of the Wireguard Prometheus exporter.

## Usage

To run the playbook, use the following command:

```bash
ansible-playbook -i inventory_file playbook.yml
```

Replace `inventory_file` with the path to your inventory file and `playbook.yml` with the path to your playbook file.

## License

This playbook is licensed under the Apache 2 License. See the LICENSE file for more information.
