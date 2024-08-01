# Lab client setup for automation module

**NOT COMPLETE** do not start working on this lab yet!

Today's lab will set up a number of things we need on the client side for the automation module.
The steps are also designed to re-familiarise yourself with some concepts needed from previous modules and experience.
There are a lot of different things to do but most are not particularly challenging, so make sure that you keep to time.

**DkIT login:**
We will be using a number of services that require your DkIT login.
If you don't have this working please use the self service password reset utility or seek advice from the technical staff immediately.
You will need it for many of the instructions below.

**Lab computers:**
You must use the lab computers for these instructions.
You're welcome to attempt / repeat the steps on your own laptop or home computer but I have designed the instructions to work within the wired specialist lab network environment at DkIT.

*This section needs clarification depending on what remote access facilities are installed over summer 2024.*


## Task 1: Clone the git repository

We will be using the `git ` source code control system a lot in this module.
First, I will use it to distribute all the files you need to you on an ongoing basis.
You will start today using it to maintain your on-going lab work for assessment.

1. Open up PowerShell in Windows Terminal and navigate to your home folder using `cd`.
   (Folder path should look like  `C:\Users\D92929292`)
2. Run the command `git clone https://github.com/peadargrant/automation.git`.
3. Use `ls` to confirm that the `automation` folder now exists in your home folder.
4. Confirm visually using Explorer that the `automation` folder appears.
5. Close PowerShell.


### Web access

As you can see from the URL, `git` uses `https` and other protocols to work with so-called remotes.
Because I have used GitHub you can browse all the course files via the web including on your smartphone.
This is *not* a substitute for cloning and updating the course files!


### OneDrive issues

**TL;DR:** Keep source code files in this module *well away* from OneDrive.

From experience, do not locate git-managed folders on OneDrive.
This includes folder like Documents and Desktop if you've set them to be redirected to OneDrive.

Git does not like any other system like OneDrive interfering with its hidden files.
If you use a git repository on multiple computers you should `clone`, `pull` and `push` on each separately in a non-OneDrive folder.


## Task 2: PC setup

You are probably going to find it easiest to always use the same lab PC for the module.
To confirm that the lab PC you are using has the requirements:

1. Open up a new Powershell window and navigate to the `automation` folder on your Desktop.
2. Run the `client_check_windows.ps1` command.
3. Confirm that it says `system ok for automation module`.

**Note:**
there are also two Bash scripts to check Mac and Linux client systems for compatibility.
These are experimental as all the lab machines run Windows 11.


## Task 3: XOA request

We will make use of the XOA virtualisation system in DkIT later in this module.

**Note:** the following two steps might seem out-of-sequence, but they must be done in the order shown below.
If you don't first login to XOA you won't have a User profile for the technical staff to assign permissions to.


### Step 1: Login to XOA

First you need to login to XOA itself with your DkIT credentials to create a User profile on it at the following URL:
`https://xoa.comp.dkit.ie`.

You will be able to login to XOA but not create any VMs or other resources.
It has however created your user profile.


### Step 2: Request permissions

To be granted full access to XOA, you will then need to request permissions from the following URL: `https://xoarequest.comp.dkit.ie`.

There is no need to tick any of the optional boxes in the request.


### Step 3: Wait for permissions to be granted

Granting permissions needs some manual input from the technical staff.
It will probably be completed by the next time we have a lab, which is plenty of time.


## Task 4: GitLab setup for labs

In this module you are required to maintain your lab work in the School GitLab server **on an ongoing basis**.
This task will set up your lab folder on GitLab.

I will monitor your progress manually and automatically throughout the semester using the GitLab server.
To facilitate this you will add me to your lab work repository. 

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


## Task 6: Clone your lab folder

1. Open PowerShell.
2. Navigate to your home directory (if required), should be `C:\Users\D92929292` or similar.
   - **Note:** make sure you're not in the `automation` folder itself.
3. Type `git clone ` but don't press enter.
4. In your browser go to your project page on GitLab and hit the blue `Code` button.
5. Copy the `Clone with HTTPS` URL from the box.
6. Paste after the `git clone ` command and run it.
7. You should now see the `automation_labs` folder as well as `automation` folder.


## Task 7: Set up your lab folder

1. Navigate into the `automation_labs` folder.
2. Run the `./setup_lab_folder.py` program.
3. Answer any required questions.

**Note:** you only need to do this once for your labs repository!
It does *not* need to be done on each computer that you use. 


## Task 8: Commit and push your work

1. Stay in the `automation_labs` folder.
2. Run `git status` and confirm that it shows a change to `README.md`.
3. Type `git add README.md` to add the changed `README.md` file to this commit.
4. Run `git status` and notice it shows the file as staged.
5. Run `git commit -m 'readme file updated'`. The `-m` switch specifies the *commit message* that appears in the log. If you don't specify `-m` an editor will open up, which isn't always easiest on Windows. So best to get into the habit of using the `-m` switch everywhere.
6. Run `git push` to push your changes to the DkIT GitLab server. It will ask for your DkIT username / password. 


## Reflection

Consider the following questions before the next lab:

1. Which parts of today's work did you find easy, straightforward and/or enjoyable?
   - Were there any commonalities in these tasks?
2. Which parts of today's work did you find challenging, difficult or unpleasant?
   - Were there any commonalities in these tasks? 
3. Were there any parts of today's work that you would have seen the opportunity for you or the lecturer to automate further to make things easier for you? 
