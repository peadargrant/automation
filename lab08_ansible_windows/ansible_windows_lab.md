% Ansible Windows lab

Useful information:

- [Ansible on Windows and BSD](https://docs.ansible.com/ansible/latest/os_guide/index.html)
- [See windows usage in manual](https://docs.ansible.com/ansible/latest/os_guide/windows_usage.html)


# Task 1: VM setup

We will need 2 VMs for this lab.

## Linux VM

Control VM as follows:

- Ubuntu Server Quick Instance
- Hostname set to: `control`

## Windows VM

- Windows Server 2019 Quick Instance
- Computer name set to: `target`
- Remote desktop turned on (optional)
- OpenSSH server installed and working (optional)

	Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
	Start-Service sshd
	Set-Service -Name sshd -StartupType 'automatic'
	

# Task 2: WinRM 

Check that WinRM is listening by running:

	winrm enumerate winrm/config/Listener
	
Configure it by running:

	winrm quickconfig
	
The default(s) are OK.


# Task 3: Test WinRM loopback

Try the following command over WinRM:

	winrs -r:http://127.0.0.1:5985/wsman -u:Administrator -p:1Password ipconfig
	
It should return the exact same output as if you did it locally.


# Task 4: Setup WinRM for remote access

Enable basic auth

	Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $True

Allow unencrypted

	Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $True


