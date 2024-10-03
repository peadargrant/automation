% Basic remoting lab

Today's lab introduces the powerful concept of *remoting* where a script (or manual commands) on our "local" computer invokes commands on a remote computer. 

From previous module(s) you're familiar with basic PowerShell CLI and scripting on Windows, as basic bash CLI and scripting on UNIX.
We won't be re-covering the basics of how to build scripts, but you should review previous notes and work from relevant modules.

We're going to work with a few simple commands to begin with on the remote side.
For the most part these just read and display basic information and don't make any changes.


# Task 1: Setup a Linux target VM

On XOA setup a machine running Ubuntu Linux Quick Instance on `Primary Pool (FUll Access)` . 
Make sure to follow naming rules. 

Once the machine has started up note its IP.
Recommend that you put it in a PowerShell variable named `$LinuxServerIp`. 

Open a new tab in Windows Terminal and SSH to the Linux server

	ssh administrator@$LinuxServerIp


# Task 2: Setup a Windows target VM

On XOA setup a machine running Windows Server 2019 from Quick Instance on `Primary Pool (Full Access)`
Make sure to follow naming rules.

Once the machine has started up note its IP.
Recommend that you put it in a PowerShell variable named `$WindowsServerIp`. 

Open an RDP session to the Windows Server.
On it, run Windows PowerShell as administrator.


## Check for OpenSSH server

Check if OpenSSH is installed already:

	Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

Notice that the client is installed but the server is not.


## Install OpenSSH server

To install openSSH server type

	Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

This operation may take some time.


## Enable service

To enable the service to start on boot 

	Set-Service -Name sshd -StartupType 'Automatic'


## Start service now

Enabling the service doesn't start it immediately.
Do this via:

	Start-Service sshd


## Test SSH is running

As a basic check, we can see if the local computer is listening on the SSH port.

	Test-NetConnection -Port 22 -ComputerName 127.0.0.1
	
The results should show `TcpTestSuceeded : True`. 


## Test SSH from lab computer

Get the IP address of your Windows machine.

Log into your Windows Server machine over SSH from your lab PC using:

	ssh Administrator@$WindowsServerIp

Answer host key prompt(s) and type password.

Does this look like PowerShell to you? 
It's actually the old Command Prompt shell.


## Running PowerShell on Windows Server


You can change to PowerShell by running `powershell` command. 

This means that when you `exit` from PowerShell you'll be returned to the old command prompt. 
A second `exit` will terminate the SSH session.
Leave the SSH session open fully in PowerShell for now. 



## Change default Shell

On Windows you will notice that the default shell is the old Command Prompt.
You can change this to PowerShell by setting the `DefaultShell` registry key on the VM:

	New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String  -Force
	
Start a *new*  SSH session to the Windows Server and note that it starts PowerShell by default.

Assuming that this session opens successfully, close the previous session. 

**Important note:** In general, any time that you make a change to SSH configuration (either system wide or your own user account), leave the existing session open and make sure that a newly open session works as expected.
Otherwise you could lock yourself out of the machine completely.


# Task 3: Invoking remote commands

Run the simple command `date` separately on both the Linux and Windows machines. 
We're now going to try invoking this directly from our client machine. 

To invoke a command on a remote machine over SSH, we simply prefix add it to the end of the SSH command:

	ssh administrator@$LinuxServerIp date
	ssh Administrator@$WindowsServerIp date
	
Note that:

1. the output is directly that which would be emitted from the command. 
2. we're prompted for authentication each time (nuisance)



# Task 4: Key-based authentication

Make sure that you have a working ED25519 key.
If you followed the client setup you should have!
If not sure, run

	./test_key.ps1
	

## Placing public key on Linux Server

To put our public key on the Linux Server we'll use SFTP to transfer the public key to the linux machine.
We'll then use some shell commands to append it to the list of authorized keys.

### Transferring the key

Open an *SFTP* session using:

	sftp administrator@$LinuxServerIp
	
SFTP is a command-line program with its own prompt.
Although the commands in many cases are similar to the shell commands it is *NOT* a command shell.

Change to your local .ssh folder

	lcd ~/.ssh
	
Put the public key on to the remote server

	put id_ed25519.pub
	
Do NOT put your Private key there!



### Appending the key to your authorized keys list

On the open SSH session to the linux server, change into the SSH folder.

	cd ~/.ssh
	
Append the key to the existing `authorized_keys` file:

	cat ../id_ed25519.pub >> authorized_keys
	
Print out the authorized keys file to be sure:

	cat authorized_keys
	
List out the folder in detail:

	ls -lh
	
Make sure that the `authorized_keys` file has only one `rw` in the permissions list.


### Test the connection

Try opening a new SSH session to the linux machine.
It should succeed *without* prompting for a password.


## Placing public key on Windows Server

To put our public key on the Windows Server we'll use SFTP to transfer the public key to the linux machine.
We'll then use some PowerShell commands to append it to the list of authorized keys.

### Transferring the key

Open an *SFTP* session using:

	sftp administrator@$WindowsServerIp
	
Change to your local .ssh folder

	lcd ~/.ssh
	
Put the public key on to the remote server

	put id_ed25519.pub
	
Do NOT put your Private key there!



### Appending the key to your authorized keys list

On the open SSH session to the windows server, change into the central SSH folder.

	cd C:\ProgramData\ssh

Put your key file in as the `administrators_authorized_keys` file:

	mv ~/id_ed25519.pub administrators_authorized_keys
	
Print out the authorized keys file to be sure:

	cat authorized_keys
	
	
### Test the connection

Try opening a new SSH session to the windows machine.
It should succeed *without* prompting for a password.


# Task 4: More remote commands

Let's return to the simple `date` command separately on both the Linux and Windows machines. 
As before, to invoke a command on a remote machine over SSH, we simply prefix add it to the end of the SSH command:

	ssh administrator@$LinuxServerIp date
	ssh Administrator@$WindowsServerIp date
	
We're no longer prompted for authentication each time!


# Task 5: 

Write a simple client script that uses the `ipconfig` and `ip -a` commands to return basic information from the two servers and present it.


# Submission

Put the following from this week in your `lab04` folder in your `automation_labs`:

- Windows Server `ipconfig` output `windows_ipconfig.txt` via remoting
- Linux server `ip a` output `linux_ipconfig.txt` via remoting
- PowerShell script from Task 5.

Commit and push to GitLab.

