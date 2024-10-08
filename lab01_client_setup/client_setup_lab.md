% Client setup lab for Automation module

Today's lab will set up a number of things we need on the client side for the automation module.
The steps are also designed to re-familiarise yourself with some concepts needed from previous modules and experience.
There are a lot of different things to do but most are not particularly challenging, so make sure that you keep to time.

**DkIT login:**
We will be using a number of services that require your DkIT login.
If you don't have this working please use the self service password reset utility or seek advice from the technical staff immediately.
You will need it for many of the instructions below.

**Lab computers:**
You **must use** the **lab computers** for these instructions:

- You're welcome to attempt / repeat the steps on your own laptop or home computer but I have designed the instructions to work within the wired specialist lab network environment at DkIT.
- I suspect that they won't (easily) work as written outside of this environment!
- Part of this module's aim is to help you automate setup on different machines that aren't always entirely under your own control!


# Task 1: Clone the module git repository

We will be using the `git ` source code control system a lot in this module.
First, I will use it to distribute all the files you need to you on an ongoing basis.
You will start today using it to maintain your on-going lab work for assessment.

1. Open up PowerShell in Windows Terminal and navigate to your home folder using `cd`.
   (Folder path should look like  `C:\Users\D92929292`)
2. Run the command `git clone https://github.com/peadargrant/automation.git`.
3. Use `ls` to confirm that the `automation` folder now exists in your home folder.
4. Confirm visually using Explorer that the `automation` folder appears.
5. Close PowerShell.


## Web access

As you can see from the URL, `git` uses `https` and other protocols to work with so-called *remotes*.
Because I have used GitHub you can browse all the course files via the web including on your smartphone.
This is *not* a substitute for cloning and updating the course files yourself!


## OneDrive issues

**TL;DR:** Keep source code files in this module (and others, unless advised by your lecturer!) *well away* from OneDrive.

From experience, do not locate `git`-managed folders on OneDrive.
This includes folders like Documents and Desktop if you've set them to be redirected to OneDrive.
(The problem is, OneDrive likes to encourge folks to do this!)

Git does not like any other system like OneDrive interfering with its hidden files, timestamps etc.
If you use a git repository on multiple computers you should `clone`, `pull` and `push` on each separately in a non-OneDrive folder.


# Task 2: Enabling PowerShell script execution

We're going to be using PowerShell a lot (although not exclusively) on the Windows client side in different parts of this module.
Windows by default limits script execution.
These instructions will remove this limitation. 

1. Open Windows Terminal.
2. Make sure that the prompt shows `PS` to show it's PowerShell and not the older `cmd` shell.
3. Run the command `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` .
4. Close and re-open Windows Terminal.  If you don't do this, the changes sometimes don't take effect.
5. Run the command `Get-ExecutionPolicy` and confirm it shows as `RemoteSigned`.
6. Test by running the './test_script.ps1' script in this folder.

This sets the `RemoteSigned` execution policy and applies it to the `CurrentUser` scope.
Because you're not an administrator if you try to apply it to `LocalMachine` it won't work. 


# Task 3: PC setup

You will find it easiest to always use the same lab PC for the module.
Make sure you like where you're sitting!
To confirm that the lab PC you are using has the software requirements:

1. Open up a new Powershell window and navigate to the `automation` folder.
2. Run the `./client_check.ps1` script in this folder.
3. Confirm that it says `system ok for automation module`.

**Note:**
There is also a Bash script to check Mac and Linux client systems for compatibility.
This is experimental as all the lab machines run Windows 11.


# Task 4: XOA request

We will make use of the XOA virtualisation system in DkIT later on in this module.

**Important Note:**
the following two steps might seem illogical and out-of-sequence, but they must be done in the order shown below.
If you don't first login to XOA you won't have a User profile for the technical staff to assign permissions to.
Therefore please follow the steps below exactly in the order shown: 


## Step 1: Login to XOA

First you need to login to XOA itself with your DkIT credentials to create a User profile on it at the following URL:
`https://xoa.comp.dkit.ie`.

You will be able to login to XOA but not create any VMs or other resources.
It has however created your user profile.


## Step 2: Request permissions

To be granted full access to XOA, you will then need to request permissions from the following URL: `https://xoarequest.comp.dkit.ie`.

There is no need to tick any of the optional boxes in the request.


## Step 3: Wait for permissions to be granted

Granting permissions needs some manual verification and input from the technical staff.
It will probably be completed by the next time we have a lab, which is plenty of time.


# Task 5: GitLab setup for labs

In this module you are required to maintain your lab work in the School GitLab server **on an ongoing basis**.
This task will set up your lab folder on the GitLab server.

**Note:** GitLab also have a public service like GitHub.
Make sure that you're always using the school's URL. 

I will monitor your progress manually and automatically throughout the semester using the GitLab server.
To facilitate this you will add me as a member of your lab work repository.

**Forking:** is a way to create your own copy of a project on a system like GitLab or GitHub.
We could have done it by you cloning a copy of the labs from my account, creating a new repo on your own account and pushing to that instead.
But forking is quicker to do when appropriate.

1. Login to the **school** GitLab instance at `https://gitlab.comp.dkit.ie` with your DkIT credentials.
2. Go to the project `https://gitlab.comp.dkit.ie/grantp/automation_labs`.
3. Click the `Fork` button.
4. Leave everything alone on the page. Click `Fork` again.
5. You'll be redirecting to a holding page. Wait until it refreshes.
6. You should now see a new project.
7. Go to the left hand bar, click `Manage` and then `Members`.
8. Click the blue `Invite members` button on the top right.
9. Put `grantp` in the Username box, set `Role` to `Developer` and hit `Invite`.


# Task 6: Clone your lab folder

We'll now *clone* the repository you've created in the previous task to the local client computer.
Later on, you'll also clone your repository to other virtual machines that you create.
You can also clone the repository to your own device(s) at home.

This will give you a local isolated copy of all files in your repository that you can work on during the labs.
When you're finished, you'll commit the changes (capturing them as a snapshot) and push them (sending them to GitLab).

1. Open PowerShell.
2. Navigate to your home directory (if required), should be `C:\Users\D92929292` or similar.
   - **Note:** make sure you're *not* in the `automation` folder itself.
   - Use `pwd` to check your location if not sure!
   - Accidentally nesting a git repository inside another *will* cause *serious* confusion to you!
3. Type `git clone ` but don't press enter.
4. In your browser go to your project page on GitLab and hit the blue `Code` button.
5. Copy the `Clone with HTTPS` URL from the box.
6. Paste after the `git clone ` command and run it.
7. If you list the directory using `ls` you should now see the `automation_labs` folder as well as `automation` folder.


# Task 7: Set up your lab folder

1. Navigate into the `automation_labs` folder.
2. Run the setup script in Python using `python ./setup_lab_folder.py` program.
3. Answer any required questions.

**Note:** you only need to do this once for your labs repository!
It does *not* need to be done on each computer that you use. 


# Task 8: Git config

Git infers usernames and e-mail addresses to record commits against.
Sometimes it will refuse to commit until you've explicitly set these.

	git config --global user.name "Your name here"
	git config --global user.email "D00000000@student.dkit.ie"
	
Of course, you could instead use the provided `git_config.ps1` script which will do this for you!


# Task 9: Commit and push your work from this lab

You'll follow these stesps at the end of each lab:

1. Stay in the `automation_labs` folder.
2. Run `git status` and confirm that it shows a change to `README.md`.
3. Type `git add README.md` to add the changed `README.md` file to this commit.
4. Run `git status` and notice it shows the file as staged.
5. Run `git commit -m 'readme file updated'`:
   - The `-m` switch specifies the *commit message* that appears in the log.
   - If you don't specify `-m` an editor will open up, which isn't always easiest on Windows.
   - So best to get into the habit of using the `-m` switch everywhere.
6. Run `git push` to push your changes to the DkIT GitLab server. It will ask for your DkIT username / password. 
