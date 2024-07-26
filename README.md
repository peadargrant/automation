# Automation module

**Lecturer:** Dr Peadar Grant


## Module descriptors

Content is common across *two* modules:

- [https://courses.dkit.ie/index.cfm/page/module/moduleId/69178](COMP I8063: Higher Diploma in Science in Networking and Systems)
- [https://courses.dkit.ie/index.cfm/page/module/moduleId/57313](COMP I8039: Level 8 Computing Systems and Operations Stage 3)

Delivery modes, contact hours and assessment format(s) may differ across both modules.
The learning outcomes and content are almost identical.

Make sure you are looking at the correct module descriptor, particularly when referring to assessment and workload.


## Learning outcomes

1. **MLO1:** Recognise the purpose of automation and examine the industry challenges it addresses.
2. **MLO2:** Examine the different approaches to automation.
3. **MLO3:** Construct an automated delivery solution using current industry tools.
4. **MLO4:** Evaluate the best approach and practices to automation for different scenarios.


## Indicative content

### Purpose of Automation

Discuss the challenges of deploying in a complex environment, how automation and Infrastructure as Code addresses these challenges. Describe different approaches to automation - push/pull, procedural vs declarative.

### Deploying into Environments

Review how to achieve remote access and permissions to deploy in different environments, e.g ssh, winrm.

### Introduction to Automation with Ansible

Describe Ansible system - overview. Introduction to yaml, playbooks, inventory, roles, variables and modules. Build and execute playbooks to deploy onto Linux and Windows environments.

### Automation in the Cloud

Introduce concepts of provisioning in a Cloud environment. Provision simple Cloud environment using tool such as Terraform or Cloud Formation.


## Content organisation

This repository has all content in it for both courses.
Due to differing prior experience, some content will be emphasised only in one module or the other.
Where relevant, this will be clearly indicated in the schedule.

Topics are in sequentially numbered folders.


## Assumed prior knowledge

We will be *using* a lot of concepts that you've studied in previous modules.
This will hopefully be familiar to you due to usage and repetition, but may need some revision on your part.
We will review and extend certain concepts again as necessary.


### Relevant prior modules

#### HDip

- Cloud Technologies
- Infrastructure Services

#### L8

- DevOps Lifecycle
- Introduction to System Administration
- Solutions Architecture
- Operating Systems


### You should have

- Familiarity with command-line interfaces (by regular usage of them!)
- Basic Bash usage:
  - Concept of working directory
  - Navigating filesystem using `pwd`, `cd` and relative operators, e.g. `..`, `/` etc.
  - Manipulating files using `rm`, `mv`, `cp` etc.
  - Displaying files using `cat`, `more` etc.
  - Manipulating directories using `mkdir`, `rmdir` etc.
  - File permissions and ownership `chmod`, `chown` etc.
  - Use of wildcards (e.g. `*`) to refer to multiple files.
- Basic PowerShell usage
  - Same ideas as above for Bash required.
- You can a Python program in the command-line environment.
- Accessing help on commands via `-h` switch (or similar) and using `man` command. 
- Principle of Shell redirection (`>`, `<`) and command piping / chaining (`|`)
  - Using `Get-Content` and `Out-File` in PowerShell to achieve same aims.
- Secure SHell (`ssh`) including key-based authentication
- SFTP (`sftp`) operations (`get`, `put`) and concept of local/remote directory navigation (`cd`, `lcd`, etc)
- Plain text editors via local GUI (e.g. notepad, VSCode) and local/remote console (`emacs`, `nano`, `vim` etc).
- Markdown (`.md`) text formatting and conversions using tools like `pandoc`. **L8 only**
- Working knowledge of `git` (e.g. `git pull --rebase`)
- Experience with XOA environment (creating and using VMs)
- Encountered containers (e.g. docker) **L8 only**
- Encountered cloud environments (e.g. AWS, Azure) **HDip only**

**Note:** If you *"don't do" command line interfaces* you will need to reset that limitation you've placed on yourself for success in this module.
Almost all of our work will involve command-line interfaces.
There's simply no way of avoiding them here!


## System requirements

All required software is installed on DkIT specialist lab computers (P1153).
In additional all required services are accessible from DkIT specialist lab computers.

You are welcome to try use your own device(s) at home and within DkIT, as well as non-specialist-lab computers to help you in this module.
While I encourage you to try things out, you are responsible for supporting your own devices and configurations.

The `system_check_windows.ps1` and `system_check_linux.sh` scripts (which call the `system_check.py` script) can be used to see if all required software for this module is installed on the device you'll use for the module.


## Academic integrity

You are reminded that all of your work must comply with DkIT Academic Integrity Policy.
Specific guidance will be given on the assessments in this module.

