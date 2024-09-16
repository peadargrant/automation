% Automation module introduction

**Lecturer:** Dr Peadar Grant


# Module descriptors

Content is common across *two* modules:

- [COMP I8063: Higher Diploma in Science in Networking and Systems](https://courses.dkit.ie/index.cfm/page/module/moduleId/69178)
- [COMP I8039: Level 8 Computing Systems and Operations Stage 3](https://courses.dkit.ie/index.cfm/page/module/moduleId/57313)

Delivery modes, contact hours and assessment format(s) may differ across both modules.
The learning outcomes and content are almost identical.

Make sure you are looking at the correct module descriptor, particularly when referring to assessment and workload.


# Learning outcomes

1. **MLO1:** Recognise the purpose of automation and examine the industry challenges it addresses.
2. **MLO2:** Examine the different approaches to automation.
3. **MLO3:** Construct an automated delivery solution using current industry tools.
4. **MLO4:** Evaluate the best approach and practices to automation for different scenarios.


# Indicative content

*Directly from module descriptors*

## Purpose of Automation

Discuss the challenges of deploying in a complex environment, how automation and Infrastructure as Code addresses these challenges. Describe different approaches to automation - push/pull, procedural vs declarative.

## Deploying into Environments

Review how to achieve remote access and permissions to deploy in different environments, e.g ssh, winrm.

## Introduction to Automation with Ansible

Describe Ansible system - overview. Introduction to yaml, playbooks, inventory, roles, variables and modules. Build and execute playbooks to deploy onto Linux and Windows environments.

## Automation in the Cloud

Introduce concepts of provisioning in a Cloud environment. Provision simple Cloud environment using tool such as Terraform or Cloud Formation.


# Focus areas

## Emphasis

- Command-line tooling
- UNIX / Linux / Windows CLI environments
- Remote administration (e.g. SSH)
- Standard scripting tools and automation frameworks
- Good practices:
  - Robustness (e.g. idempotency)
  - Organisation (e.g. source control)
  - Standardisation (e.g. use of parameter handling in scripts)
- Use of Generative (and other) AI tools:
  - To assist the creation of automation solutions (e.g. help write a script)
  - By automation solutions (e.g. generate exam questions)


## De-emphasis

Although peripherally relevant to automation, we won't be devoting much / any time to:

- Graphical tooling (e.g. "Control Panel")
- Active Directory
  - GPOs
  - Assigned / published applications
- MDM solutions such as Microsoft InTune


# Assessment

## Labs (30%, due Week 12)

Lab work will be kept in a `git` repository on the school GitLab server.
Each week will need certain files submitted.
Labs are normally marked for completion only.


## CA1 (30%, Week 7)

Assignment demonstrating understanding of principles and approaches to automation.


## CA2 (30%, Week 11)

Aassignment, design an automation solution which requires deployment of system changes to client and server environments, including approach and configuration files.


# Content organisation

This repository has all code files in it.

Due to differing prior experience, some content will be emphasised only in one module or the other.
Where relevant, this will be clearly indicated in the schedule.

Topics are in sequentially numbered folders.


# Assumed prior knowledge

We will be *using* a lot of concepts that you've *already* studied in previous modules.
This will hopefully be familiar to you due to usage and repetition, but may need some revision on your part.
We will review and extend certain concepts again as necessary.


## Relevant prior modules

### HDip

- Cloud Technologies
- Infrastructure Services

### L8

- DevOps Lifecycle
- Introduction to System Administration
- Solutions Architecture
- Operating Systems


## Assumed knowledge

You should have: 

- Familiarity with command-line interfaces (built by regular routine usage of them!)
- Basic Bash usage on Linux:
  - Concept of working directory
  - Navigating filesystem using `pwd`, `cd` and relative operators, e.g. `..`, `/` etc.
  - Manipulating files using `rm`, `mv`, `cp` etc.
  - Displaying files using `cat`, `more` etc.
  - Manipulating directories using `mkdir`, `rmdir` etc.
  - File permissions and ownership `chmod`, `chown` etc.
  - Use of wildcards (e.g. `*`) to refer to multiple files.
  - Up cursor to recall previous commands
- Basic PowerShell usage on Windows
  - Same ideas as above for Bash required.
- You can run a Python program in the command-line environment.
- Accessing help on commands via switches (e.g. `-h` or similar) and using `man` command. 
- Principle of Shell redirection (`>`, `<`) and command piping / chaining (`|`)
  - Using `Get-Content` and `Out-File` in PowerShell to achieve same aims.
- JSON format
  - Basic understanding of JSON structure manually
  - Encountered JSON in files, from command output and APIs.
  - Using `json.dump` and `json.load` in Python
  - Using `ConvertFrom-Json` and `ConvertTo-Json` in PowerShell
  - Use of `jq` in Bash
- Secure SHell (`ssh`)
  - Idea of accessing remote command-line shells on another host
  - Key-based authentication using public/private keypair 
  - More advanced concepts: single-command, agent forwarding etc.
- SFTP (`sftp`)
  - standard operations (`get`, `put`)
  - concept of local/remote directory navigation (`cd`, `lcd`, etc)
- Plain text editors via local GUI (e.g. notepad, emacs, VSCode) and local/remote console (`emacs`, `nano`, `vim` etc).
- Markdown (`.md`) text formatting and conversions using tools like `pandoc`. **L8 only**
- Working knowledge of `git` (e.g. `git pull --rebase`)
- Experience with XOA environment in DkIT (creating and using Linux and Windows VMs)
- Encountered containers (e.g. docker) **L8 only**
- Encountered cloud environments (e.g. AWS, Azure) **HDip only**

**Very important point:** If you *"don't do" command line interfaces* you will need to reset that starting limitation you've placed on yourself for success in this module.
Almost **all** of our work **will** involve command-line interfaces with no GUI alternative.
There's simply no way of avoiding CLIs here!


# Learning Approach

- Primarily lab-based: Learn by doing module.
- Using a lot of automation ideas to learn and organise the module (e.g. PowerShell / Bash / Python scripts, git, ssh)
- There won't be much / any PowerPoint (or similar) 
- Notes and lab instructions are mainly in Markdown and HTML files in the git repository.


# Technology choices

- **Windows 11 client** - most common desktop 
  - PowerShell and Python scripting
  - SSH using in-built SSH client
  - Microsoft Office installation
- `git` for content distribution and assessment submission - most common source control system
- **Linux** as our 'data centre' control and deployment platform - most common deployment target
- **Ansible** as our automation framework
  - Some alternatives: will discuss at the relevant time


# System requirements

This module is based around the following configuration:

- Windows 11 client computer
- Linux and Windows VMs in XCP-NG managed via Xen Orchestra

All required client software is installed on DkIT specialist lab computers (P1153).
In additional all required services are accessible from DkIT specialist lab computers.

You are welcome to try using your own device(s) at home and within DkIT, as well as non-specialist-lab computers to help you in this module.
While I encourage you to try things out, you are responsible for supporting your own devices and configurations.
If you want to attempt a complete local installation of what's needed you will need an XCP-NG hypervisor host. 

The `client_check.ps1` and `client_check.sh` scripts (which call the `system_check.py` script) can be used to see if all required software for this module is installed on the client device you'll use for the module.


# Class recordings (HDip class only)

Sessions on Zoom will be put on HEANet Media Server and links posted to the recordings list in the GitHub repository.


# Remote access

**TODO:** confirm remote access arrangments based on new network setup 2024


# Academic integrity

You are reminded that all of your work must comply with DkIT Academic Integrity Policy.

Specific guidance will be given on the assessments in this module.

