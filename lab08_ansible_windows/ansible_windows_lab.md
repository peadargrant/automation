% Ansible Windows lab

Useful information:

- [Ansible on Windows and BSD](https://docs.ansible.com/ansible/latest/os_guide/index.html)
- [See windows usage in manual](https://docs.ansible.com/ansible/latest/os_guide/windows_usage.html)


# Task 1: VM setup

We will need 2 VMs for this lab.

## Control node (Linux VM)

Control VM as follows:

- Ubuntu Server Quick Instance

## Target node (Windows VM)

- Windows Server 2019 Quick Instance

It may be easier to use SSH and/or RDP rather than the emulated console to work with the Windows VM

- Remote desktop turned on (optional)
- OpenSSH server installed and working (optional):

Commands to enable OpenSSH server are:

	Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
	Start-Service sshd
	Set-Service -Name sshd -StartupType 'automatic'


# Task 2: Control node setup

Use SFTP to copy the following files to the control node (or copy and paste them):

	control_inventory.ini
	control_playbook.yml
	target_playbook.yml

Install ansible on the control node

	sudo apt -y install ansible

Run the playbook against the control node:

	ansible-playbook -i control_inventory.ini control_playbook.yml  --ask-become
-pass

Manually reboot the control node and re-connect when it comes back up. 


# Task 3: WinRM 

On the Windows host (target node), check that WinRM is listening by running:

	winrm enumerate winrm/config/Listener

Configure it by running:

	winrm quickconfig
	
The default(s) are OK.


# Task 4: Test WinRM loopback

WinRM definitely won't work remotely if it won't work from the same machine. 
Try the following command over WinRM to test it (change the password for Administrator if different):

	winrs -r:http://127.0.0.1:5985/wsman -u:Administrator -p:1Password ipconfig
	
It should return the exact same output as if you did it locally.


# Task 5: Setup WinRM for remote access

In this section we'll make some basic configuration changes to allow WinRM to accept remote connections.

## Enable basic authentication

Basic authentication is disabled by default for security reasons.
It's useful for testing, development and learning purposes as it requires little-to-no configuration.
We'll switch it on here: 

	Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $True

## Allow unencrypted connections

Likewise, WinRM restricts unencrypted connections for security purposes.
While this is a good idea on production systems, unencrypted connections are easier to configure for testing, development and learning purposes.
They don't require certificate setup and configuration (which could be an entire lab in itself!)

We'll allow unencrypted connections by running: 

	Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $True


# Task 6: Inventory

Create a file named `target_inventory.ini` on the control host, following the pattern of the sample file.


# Task 7: Playbook run

On the control host run the playbook against the target node:

	
# Lab submission

In `lab08` submit evidence that you have run the playbooks in form of:

	target_playbook.yml (with changes if any)
	target_inventory.ini
	output.txt (copied text screen output)
