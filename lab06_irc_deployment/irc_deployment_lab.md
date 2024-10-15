% IRC Deployment Lab


This lab will be a bit harder than previous labs - you will not be given the commands needed if you've seen them before!

This lab is a slight prelude to using automation more widely. 
Therefore we're going to learn to script/automate certain steps. 


# Task 1: VM setup

We're going to need one VM for today, running Linux.

## Linux VM

Set up as Ubuntu Server Quick Instance.
All defaults are OK.
Note down its IP address in a file named `target.txt`. 


# Task 2: SSH key setup

Ensure you've an ED25519 key pair set up on your machine. 
Check for a file named `~/.ssh/id_ed25519.pub`.

Create it using `ssh-keygen -t ed25519` (without passphrase) if not.


# Task 3: SSH key transfer

Last week we manually transferred and appended our SSH key to the VM.
Repeat that again this week and make sure you can login without password being asked for.


# Task 4: Software installation

We're going to use a script named `run_setup.ps1` on our lab desktop which will transfer some required files to the server, and will then run an installation script on the remote server.

	./run_setup.ps1


# Task 5: Test IRC works on localhost

Login over SSH.
Launch `irssi` using the command:

	irssi
	
This will open a full-screen application.
IRC normally accepts commands in text form.

## Connect to local server

To connect to localhost, we type:

	/CONNECT 127.0.0.1
	
If `ngircd` is working you should see a message that ends with `End of MOTD command` or similar.

By default there is no authentication.
(It can be setup on the server if needed.)


## Join a channel

Let's now join a channel.
IRC servers sometimes have channels pre setup on them.
Just as with the loose authentication options, by default IRC servers permit any user to create a channel.
Let's do that now:

	/JOIN #GENERAL
	
Note the hash tag before the channel name, just as used in modern social media.


# Task 7: Tunneling SSH

SSH has a *very* handy feature called **Tunnelling**.

Tunnelling lets us open a port on our local machine and *forward* it to the remote machine (or any machine on the remote machine's network).
It's almost like a mini VPN.
Tunnelling can co-exist with a normal interactive login session.

Open a new SSH session to your `lab-linux` machine using:

	ssh -L6667:127.0.0.1:6667 student@linux-ip-address-here

The `-L` option opens port 6667 (the standard IRC port) on the local machine and forwards it to the remote machine, where it will send traffic to 127.0.0.1 (itself) on port 6667.


# Task 7: Installing IRC on local PC

[Install MIRC](https://www.mirc.com/get.html)

## Configuration

When it opens go to Server dropdown and click the button beside it, then Add.

	Description: localhost
	Address: 127.0.0.1
	
Leave everything else alone and click `OK`.  

## Connection

Drop down your new Server setting in the list.
Put `lab` in the Nickname.
Hit `Connect` .

You should see a similar message in MIRC as you saw in `irssi`.
Close the Favourites window that pops up.

## Joining Channel

You can browse channels etc in the GUI but the same commands also work here.
In the command box type

	/JOIN #GENERAL
	
Look at your linux box and notice that it shows the `lab` user has joined.


## Try out chat

At this point you can type messages in the command window which will fill up in the chat just like WhatsApp / Teams etc.


# Submission

In your `lab06` folder include the following files:

- `target_ip.txt` 
- screenshot `screenshot.png`  or text copy `screenshot.png` of the login screen of your IRC server 


# Delete all resources

When you've finished the lab, delete all resources by deleting your resource group!

**VERY IMPORTANT** Delete all resources once you're finished using them to save your Azure credits!  You're entirely responsible for managing your credits!

Delete the lab resource group from the CLI using:

	az group delete -n lab_rg

You should notice the RDP session (if open) terminates, the SSH connection(s) if open terminate(s). 
Once the command has finished then confirm that the resource group is gone in the Portal.

