% Workstation setup lab

# Task 0: VM setup

We need 3 VMs:

	control (Ubuntu Quick Instance)
	client-target (Ubuntu Quick Instance)
	
Note down the IP addresses in a text file as we'll need all of them.

To speed matters up, you can manually do an update on the VMs. 
No need to reboot as we will cover that later on.
Carry on to the next step while that proceeds (in a different window).
	
	
# Task 1: Copy SSH ID key to Control node

To make the next step(s) work we'll copy the ED25519 key from our PC to the control node:

	 Get-Content ~\.ssh\id_ed25519.pub | ssh administrator@control-node-ip "cat >> .ssh/authorized_keys"
	 
If your local machine does NOT have an SSH key, then create one using `ssh-keygen -t ed25519`.
Make sure that you can now connect to the control node without a password using:

	ssh administrator@control-node-ip

	 
# Task 2: Windows WinRM target setup

On the Windows target machine(s) run the commands in the file :

	./winrm_setup_commands.ps1
	
Make sure that WinRM works by trying a command "remotely" from the same machine:

	winrs -r:http://127.0.0.1:5985/wsman -u:Administrator -p:1Password ipconfig


# Task 3: Control node setup

From our Windows PC, we'll setup the control node using the 

	./setup_control_node.ps1
	
When it reboots, re-run the playbook.
	
	
# Task 4: Windows target setup

Run the windows target setup:

	ansible-playbook -i target_inventory.ini target_setup_playbook.yml
	

# Submission

For lab12, submit your target playbook and inventory files.
 

