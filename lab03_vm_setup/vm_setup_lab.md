% Linux VM setup

We will do a lot of our work for this module in a Linux / UNIX environment.
For this purpose you will use a VM on the XOA virtualisation environment installed in the school.

Today's lab covers some practicalities involved, particularly SSH, and sets up a single VM with useful linux tools. 
It partially mirrors the client setup on the Windows side that you saw at the beginning of the module.

**Note:**
You can try these out on a local VM (and later VMs) on your local machine instead of XOA.
You can also try these out on a cloud-based VM such as Digital Ocean or build up the required VM using AWS/Azure.
Later labs will use multiple VMs so cost could be an issue if you experiment with this on the cloud. 


# Task 0: Connect to P1153 (night class only)

Make sure you are connected to a lab PC in P1153 for these instructions.

Arrangements for this will be discussed during class time.


# Task 1: VM creation

1. Login to https://xoa.comp.dkit.ie/ using your DkIT username and password.
2. Make sure you see the *New VM* button.   If not, you need to request permissions and wait for them to be granted.
3. Click the *New VM* button. 

## Pool selection

For Create a new VM on drop down **Primary Pool (Full Access)**.

## Info

Template: Ubuntu Server Quick Instance

Name: `D00000000_automation_vm`

Replace D00000000 with your own D number.
The technical staff **will delete** VMs that are not named beginning with a student number.

Put the name also in as the description.

Move on to *Disks* section.

## Disks

**SR** should be set to **Quick Instance Storage**.

Name should be same as VM name, e.g. `D00000000_automation_vm`.
The technical staff **will delete** VMs where disks are not named beginning with a student number.

## Create

Finally hit the blue **Create** button at the bottom.


# Task 2: Connect to VM

1. In XOA look for the IP address of your instance. Note it down. 
2. In windows terminal run the command `ssh administrator@ip-address-here`. 
3. Answer *yes* in response to the host key query.
4. Use the standard password as given in class.
5. Confirm that you see the bash prompt.


# Task 3: Transfer public key

We're going to use your VM a lot, and sometimes via PowerShell scripts on your Windows PC.
Instead of entering the password each time we'll use a keypair instead to login.
This will be an important feature later on when we use a keypair to remotely manage *other* linux and Windows hosts. 

In this section you will transfer the public key of your SSH keypair to it using SFTP.
SFTP is a protocol with a number of implementations, including Graphical clients.
The default client `sftp` is a command-line program that runs within PowerShell (or Bash on linux).

When using SFTP (or FTP, or any other file transfer utility) you are dealing in parallel with *two* working directories: one on the client (local) and another on the server (remote).
It can be confusing in a command-line environment to keep track of where you are.
Use the `pwd` and `lpwd` commands liberally if you are not sure!

1. Without closing your SSH session from the last task, open a new tab in Windows terminal and run the command `sftp administrator@ip-address-here`.
2. Use `pwd` to show the *remote* working directory path. 
3. Use `lpwd` to display the *local* working directory path. 
4. Use `lcd .ssh` to enter into the local client's `.ssh` directory. 
5. Transfer your public key using `put id_ed25519.pub`. Do *not* transfer `id_ed25519` (your private key!)
6. Terminate the connection using `exit`.


# Task 4: Copy public key to authorized_keys

Go back to your existing SSH session to the server.

1. Use `cd ~/.ssh` to change into your SSH config folder.
2. Use `cat ~/id_ed25519.pub >> authorized_keys` to *append* your public key to the list of authorized keys.


# Task 5: Connect to VM using public key

1. Open a *new* PowerShell window in Windows Terminal.
2. Run the command `ssh administrator@ip-address-here`. 
3. You should go straight to the prompt without it asking for a server password.
4. Stay connected and move on to the next task.


# Task 6: Software update

1. Run `sudo apt -y update` to update the package lists. The `-y` bypasses the confirmation prompt.
2. Run `sudo apt -y upgrade` to upgrade packages that are out of date. As in the previous step the `-y`switch bypasses the confirmation prompt.
3. Reboot the instance using `sudo reboot`. 
4. It will disconnect.
5. Give it time to reboot and then re-connect.


# Task 7: Clone the automation code to your VM

1. Ensure that you're in your home directory. Run `cd` on its own to make to sure.
2. Use `git clone https://github.com/peadargrant/automation.git` to clone the automation folder.
3. Use `ls` to confirm that the `automation` folder now exists in your home folder.


# Task 8: Git config setup

As with Windows, Git needs to be configured with your name and e-mail address for logging commit activity.
Let's set them now. 

	git config --global user.name "Your name here"
	git config --global user.email "D00000000@student.dkit.ie"


# Task 9: Clone your lab folder to your VM

We'll also *clone* your lab repository. 

## Step 1: Getting the remote URL

You could look this up from GitLab but it's quicker to:

1. In Windows Terminal open a PowerShell session on your local client. 
2. Navigate to your `automation_labs` folder.
3. Use `git remote get-url origin` to show the URL of your lab code folder.


## Step 2: Clone from the remote URL

1. On the *linux* machine, ensure that you're in your home directory. 
   Run `cd` on its own to make to sure.
2. Type `git clone ` but don't press enter.
3. Paste the URL from the previous step and hit enter.
4. If you list the directory using `ls` you should now see the `automation_labs` folder as well as `automation` folder.


# Task 10: Run the VM check script

Just as with the local PC, I've given you a VM check script.

1. Change into the `automation` folder.
2. Run the `./vm_check.sh` script. 
3. Install the required packages identified using the `apt` system.


# Task 10: Commit your lab work

Change into your `automation_labs` folder and make a subdirectory called exactly `lab03` in there.

To demonstrate that you've set up your VM, run the appropriate commands to do the following using shell redirection to produce the output text files given:

1. Disk space free to a file `df.txt`.
2. Logged in user(s) to a file `who.txt`.
3. Directory listing of your `~/.ssh` folder to `ssh.txt`.

*Hint:* the output file names are a clue for parts 1 and 2.



