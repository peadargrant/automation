% Pipeline lab


# Task 0: VMs required

We're going to use a locally provisioned control VM for today: Ubuntu Quick Instance.

Assumed username is `administrator`.  If you're using your own VM solution you will need to modify this!

The control node and the target node will be the same.


# Task 1: Control VM setup

We're going to use Ansible to provision the control VM.
Use SFTP to copy the following files to your control VM:

	control_playbook.yml
	inventory.yml

Then via SSH execute the command

	sudo apt -y install ansible && ansible-playbook -i inventory.ini control_playbook.yml --ask-become-pass

This file does quite a lot! 
You will need to read through it to make full sense of it.


# Task 2: Product

We've a very basic project that just converts a markdown document to docx.
It includes a *pipeline* to do this.


# Task 3: Git Repository

First let's put your chosen app (from previous task) in a Git Repository on GitLab.
On GitLab create a new project called `pipeline_project` with no code.

Then run

	./setup_pipeline_project.ps1


# Task 4: Linking the runner to the project

1. On GitLab go to your fork of the `pipeline_project` project.
2. Click *Settings* and then *CI/CD*. 
3. Find *Runners* on the screen and click *Expand*.
4. Click *New project runner*.
5. Choose *Linux* on the next screen.
6. **Important!** Make sure to turn on *Run untagged jobs*.
7. Click *Create runner*.
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


# Task 5: Manually running the pipeline

We will now manually run the pipeline to confirm all works (it probably won't):

1. In your `pipeline_project` project on GitLab go to *Build/Pipelines*.
2. Click *Run pipeline*. 
3. Click *Run pipeline* on the next screen also.
4. If it fails, look at the reason. Usually it's a missing command.
5. On your XOA machine install the missing command(s) and re-try step 4 until it works.

By default a failing pipeline will e-mail you from GitLab.
It will also mail you the first time that a pipeline that previously failed runs successfully.


# Task 6: Automatically running the pipeline

In your clone of the repository, make a change to the README.md file.

Commit and push the change.

Look at your GitLab under *Build/Jobs* and see that your pipeline has automatically run. 

This will happen regardless of where your repo is pushed from, even from changes made in the interactive GitLab screens. 



# Submission 

If you have got this far then you have successfully set up your runner and executor and have linked them to your GitLab repository so that your pipeline can run when commits are pushed.

For this week's lab folder `lab_10` include either a screenshot or text copy of output showing that you've completed the lab.

