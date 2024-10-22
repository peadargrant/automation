% Automation CA1 specification

**Weight:** 30%

**Deadline:** Mon 04 Nov 09:00

**Description:**
Assignment demonstrating understanding of principles and approaches to automation

# Scenario

A software development team is debating whether slack, Teams or IRC should be the default communication channel for staff:
- The chat system will be used for general person-group communication.
- It will also serve as a conduit for notifications from system monitoring, data centre alerts and build alerts from the CI system.
You have been tasked with prototyping the IRC system, and have been asked to create the appropriate ansible playbook and supporting scripts.

Technical requirements:
- Must be shown to work on Linux (Ubuntu Server) in both text console (`irssi`) and GUI (`hexchat`) forms.
  - The XFCE desktop will be installed on linux. 
  - XRDP will be installed to permit RDP access to the desktop for each user.
- Windows will be Windows Server 2019.
  - Client will be `hexchat` and should be installed for all users.
  - RDP will be enabled.
- For demo purposes all machines shall have 3 user accounts created: `alice`, `bob` and `mary`.  All accounts shall have `1Password` as the password.
- If necessary you can / should tunnel RDP using SSH tunnel.


# Requirements

It is expected that submitted files will be free of syntax and basic formatting errors, such that they will run, even if the actions they take are incorrect.
Submitted files that contain errors that prevent them running (e.g. syntax errors) will be treated as not submitted and will receive zero.


## VM setup (10%)

Unless otherwise agreed, VMs for this exercise must be set up in the XOA system in DkIT.

The VMs must remain set up until you are told that they can be deleted.

Modify the Linux VM configuration such that `sudo` does *not* require a password.

## Windows SSH setup (10%)

Modify the Windows setup so that SSH is available and that it logs into PowerShell by default. 


## Automation SSH key setup (10%)

On the control host set up an ssh keypair and transfer the public key to the managed hosts such that `administrator` can log into all hosts without a password.

*The lecturer may require you to put his public key onto the administrator account on the control host to facilitate system testing, and to supply the administrator password.* 


## Ansible inventory (10%)

On the control host, create your inventory file for the 3 managed hosts.
The inventory file should be submitted as `inventory.txt`.


## Ansible playbooks (40%)

Your ansible playbook in `setup_playbook.yml` should do as much of the following as possible:

- Creation of local user accounts
- System software update
- Installation of packages
- File transfer(s) required

You should develop this iteratively, bearing in mind that a well-designed playbook will be idempotent. 


## Non-automatable (10%)

Items that you could not automate should be listed in a file named `non_automatable.txt`.
Each should have a reason why.

## Instructions (10%)

Write a brief set of instructions named `instructions.txt` that incorporate running the playbook(s), and describe how non-automatable steps should be performed.

You should briefly include instructions for testing. 


# Submission

Submissions will be collected automatically after the submission date.
Assuming that you have:

1. Set up the GitLab `automation_labs` folder.
2. Created a subfolder called `ca1`.
3. Supplied all files required from the instructions above.
4. Committed and pushed your CA1 work before the deadline.

You can deem it submitted.
If you wish you can check with me in class.


# Demonstration

Verification demonstration will be required during lab time.
No presentation will be required.
Students who do not attend for demonstration will receive zero.


# Feedback

Summary feedback will be provided via Moodle and/or GitLab.


# Q&A

*Q&A will go here.*
