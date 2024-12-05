% Multi-OS deployment lab

# Task 0: VM setup

We need 3 VMs:

	control (Ubuntu Quick Instance)
	linux-target (Ubuntu Quick Instance)
	windows-target (Windows 2019 Quick Instance)
	
Note down the IP addresses in a text file as we'll need all of them.

To speed matters up, you can manually do an update on the Linux machines. 
No need to reboot as we will cover that later on.
	
	
# Task 1: Copy SSH ID key to Control node

To make life easier we'll copy the ED25519 key from our PC to the control node:

	 Get-Content ~\.ssh\id_ed25519.pub | ssh administrator@control-node-ip "cat >> .ssh/authorized_keys"
	 
If your local machine does NOT have an SSH key, then create one using `ssh-keygen -t ed25519`.
	 
	 
# Task 2: Control node setup

We'll setup the control node using the 

	./setup_control_node.ps1
	
	
# Task 3: Control to target linux key setup

Create a new ed25519 key on the control node, and copy it to the linux target.

	ssh-keygen -t ed25519 
	ssh-copy-id administrator@linux-target-ip
	
	
# Task 5: Linux target setup

	ansible-playbook -i target_inventory.ini linux_target_playbook.yml --ask-become-pass
	

# Task 6: Windows WinRM target setup

On the Windows target machine:

	./winrm_setup_commands.ps1
	
Make sure that WinRM works by trying a command "remotely" from the same machine:

	winrs -r:http://127.0.0.1:5985/wsman -u:Administrator -p:1Password ipconfig
	
	
# Task 7: Windows target setup

	ansible-playbook -i target_inventory.ini target_setup_playbook.yml
	

