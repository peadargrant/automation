% Ansible lab

# Task 1: VM setup

Log into XOA.

Set up the following **3** VMs all using the *Ubuntu Server Quick Instance*:

- `D00000000_control` 
- `D00000000_managed_1` 
- `D00000000_managed_2` 


# Task 2: Hostname setup

Once all 3 machines have started up, log into each and configure the hostname.

- `D00000000_control` named `control`
- `D00000000_managed_1` named `managed_1`
- `D00000000_managed_2` named `managed_2`

You can do this using the following command (example shows the one for control):

	sudo hostnamectl hostname control
	
After doing this logout and back in again and confirm that the prompt correclty shows the hostname. 


# Task 3: Control node software update

The following command will do an apt update/upgrade on the control node and then reboot.

	sudo NEEDRESTART_MODE=a apt -y update && sudo NEEDRESTART_MODE=a apt -y upgrade && sudo reboot

Once it reboots just reconnect to it.



# Task 3: Control node key setup

Make sure that you have an ED25519 SSH key pair on your lab PC.

Use the instructions from previous weeks to transfer your public key to the control node and that you can login without a password.


# Task 4: Managed node SSH key creation (compulsory)

The ansible system realistically requires the control node to be able to access the managed nodes over SSH without requiring a password.
We'll setup a separate key/pair between the control node and the managed nodes to do this.

**On the control node** create a new key pair using

	ssh-keygen -t ed25519
	
	
# Task 5: Copy the public key to the managed nodes
	
On the **control node**, copy the public key `id_ed25519` to both of the managed nodes using SFTP following previous instructions.

On each of the managed nodes add the public key to the list of `authorized_keys` following previous instructions.

Make sure that you can SSH from the control node to each of the managed nodes without a password being asked for.
*Do not move on until this is working.*


# Task 6: Sudo reconfiguration

By default `sudo` requires a password.
Using `sudo` open the `/etc/sudoers` file:

	sudo nano /etc/sudoers
	
Look for the line that says:

	%sudo   ALL=(ALL:ALL) ALL
	
Change it to:

	%sudo   ALL=(ALL:ALL) NOPASSWD: ALL
	
Save and exit. 
Confirm that `sudo` works correctly afterwards, e.g. using `date` or `ip a`.


# Task 6: Install ansible on control node

Install `ansible` on the control node using the package manager.

	sudo apt -y install ansible


# Task 7: Setup ansible inventory

On the control node, let's now set up our *inventory* by putting the IP addresses for both managed hosts into a file called `inventory.ini`.
First we open the file

	nano inventory.ini
	
And in the file we put the IP addresses of both managed hosts:

	[managed]
	10.108.154.105
	10.108.156.198
	

# Task 8: Ad-hoc Command Execution

	ansible -i inventory.ini managed -a "ip a"


# Task 9: Simple Playbook

Open the file `update_playbook.yml` in a text editor on your lab PC.
Copy the contents to the clipboard.

Create a new file called `update_playbook.yml` on the `control` node.

	nano update_playbook.yml
	
Paste the contents into the new file and save.
We'll now run the playbook:

	ansible-playbook -i inventory.ini update_playbook.yml
	
This could take a while, but you should see the task being queued for execution.
When complete the command will return.

When it completes, repeat the command.
Look carefully at the `PLAY RECAP` - is it the same?


# Lab submission

In `lab07` folder include the following files to show you've completed the lab: 

- `inventory.ini`
- A playbook in `.yml` format that you used.
- `ansible_output.txt` showing clearly ansible output from the hosts in the inventory file

