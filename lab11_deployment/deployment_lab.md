% Deployment lab

# Task 0: VM setup

We will need the following VM: Ubuntu Linux Quick Instance.

Use SFTP to copy the following files to your control VM:

	control_playbook.yml
	inventory.yml

Then via SSH execute the command

	sudo apt -y install ansible && ansible-playbook -i inventory.ini control_playbook.yml --ask-become-pass

You can go ahead and do the next few tasks while this long operation is completing.
Do check back and re-run the playbook when the VM reboots.
When it does, you can just run:

	ansible-playbook -i inventory.ini control_playbook.yml
	
It should run to completion this time.


# Task 1: Open project

There is a simple application called `reporter`, in the form of a Maven project.
Open it with your preferred IDE.
I have tested it with NetBeans only.


# Task 2: Run the project in your IDE

**Run** the project within your IDE.
It should print out a message to the terminal.


# Task 3: Build the project in your IDE

**Build** the project using the Build or Clean and Build button. 

The Maven Assembly plugin will create a second JAR file named `reporter-full.jar` that:

1. Has the Main class set
2. Has any required non-standard dependencies bundled in (there aren't any here)


# Task 3: Run the JAR directly in Windows / Linux

Open your Windows Terminal / XTerm / Terminal.app and navigate to the `target` folder.

Using `ls` should show something like:

    Directory: C:\Users\grantp\automation\lab11_deployment\reporter\target


	Mode                 LastWriteTime         Length Name
	----                 -------------         ------ ----
	d-----        27/11/2024     09:38                archive-tmp
	d-----        27/11/2024     09:38                classes
	d-----        27/11/2024     09:38                generated-sources
	d-----        27/11/2024     09:38                maven-archiver
	d-----        27/11/2024     09:38                maven-status
	-a----        27/11/2024     09:38           2197 reporter-1.0.jar
	-a----        27/11/2024     09:38           2219 reporter-full.jar
	
Run the `reporter-full.jar` as follows:

	java -jar reporter-full.jar
	

# Task 4: Create GitLab project

In [GitLab](https://gitlab.comp.dkit.ie/) setup a new project named exactly `deployment_project`.
Set it up as an empty repository (no README).
Make sure that *Initialize repository with a README* is turned OFF.


# Task 5: Create the deployment project repo

Then in this folder run the script (replacing `grantp` with your GitLab username): 

	./setup_deployment_project.ps1 -GitLabUserName grantp
	

# Task 6: Checkout the project on your control node

Check out the Git repo from GitLab on the control node (replacing `grantp` with your username): 

	git clone https://gitlab.comp.dkit.ie/grantp/deployment_project.git
	

# Task 7: Check that the project runs on your control node

	./build.sh
	
	
# Task 8: Setup runner for project

1. On GitLab go to your fork of the `deployment_project` project.
2. Click *Settings* and then *CI/CD*. 
3. Find *Runners* on the screen and click *Expand*.
4. Click *New project runner*.
5. **Important!** Make sure to turn on *Run untagged jobs*.
6. Click *Create runner*.
7. Choose *Linux* on the next screen.
8. Under Step 1 on the next screen, copy the command onto your XOA machine with `sudo` infront of it.
You may need to enter your machine password here.
	- If you get a yellow WARNING type Ctrl-C to exit.
	- Re-run the command with `sudo` in front of it as instructed.
9. Press enter to accept the default GitLab URL.
10. Press enter to accept the default runner name.
11. When it asks `Enter an executor` type `shell` and press enter.
    - You DON'T need to run the `gitlab-runner run` command as its handled by systemd.
12. Finally click *View runners*.
13. You should see a green dot under *Assigned project runners*.


# Task 9: Manually running the pipeline

We will now manually run the pipeline to confirm all works (it probably won't):

1. In your `deployment_project` project on GitLab go to *Build/Pipelines*.
2. Click *Run pipeline*. 
3. Click *Run pipeline* on the next screen also.
4. If it fails, look at the reason. Usually it's a missing command.
5. On your XOA machine install the missing command(s) and re-try step 4 until it works.

By default a failing pipeline will e-mail you from GitLab.
It will also mail you the first time that a pipeline that previously failed runs successfully.
