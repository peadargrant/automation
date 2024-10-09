% Advanced remoting lab

**Important note:** these instructions in many places point you to look elsewhere.
This is to emphasise that you should be learning by doing!


# Task 1: VM setup

For today's lab you will need on XOA:

1. One linux VM named `D????????_control`.
   - Use Ubuntu Server Quick Instance
2. Another linux VM named `D????????_linux_target`.
   - Use Ubuntu Server Quick Instance
3. A Windows Server VM named `D????????_windows_target`.
   - Use Windows Server 2019 

Note down the IP addresses of all machines somewhere on your Client PC, either in a text doc or shell variables.


# Task 2: SSH server setup on Windows

Use the instructions from last week to add the OpenSSH.Server windows feature, enable it, start it, test connectivity.


# Task 3: SSH connectivity

Connect from your client PC to the control VM over SSH.

Once connected, SSH to the Linux VM to confirm it works, then exit.

Then SSH to the Windows VM to confirm that it too works, then exit.


# Task 3: Key setup

On the control server we're going to generate an SSH KeyPair that will be used to connect to the targets.

## Key creation

Create a new ED25519 key following the same instructions as for Windows client in previous weeks.


## Copying public key

Use the instructions from previous labs to copy the public key to the correct locations on both the Linux and Windows target VMs. 


## Confirm that key works

From the control VM, SSH to the Linux VM to confirm that the SSH sessions starts without asking for a password, then exit.

Similarly SSH from the control VM to the Windows VM to confirm that it too works, then exit.


# Task 4: Bash script

On the control VM use a text editor to write a Bash script called `monitor.sh` that does the following:

1. Opens a new file named `report.txt` in `/home/administrator`

2. Puts a header saying `# System report`.

3. Puts a line with the date (hint: use `date` command).

4. Puts a header saying `## IP configuration:`.

5. Shows the Linux and Windows IP configurations as reported by the relevant commands under `### Linux Target` and `### Windows Target`.

6. Shows the disk usage under a header `## Disk usage` with the same sub-headings. 

Make the appropriate permission changes so that `monitor.sh` can be run directly.


# Task 5: Cron job

On the control VM open the administrator user's crontab file by running

	crontab -e
	
Insert a new line in the file to run the `monitor.sh` file every minute.

Exit the text editor.

Confirm by observing the `report.txt` file's timestamp that the cron job has completed.

Inspect the contents of the `report.txt` file.


