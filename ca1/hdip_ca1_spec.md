% HDip Automation CA1 specification

**Weight:** 30%

**Deadline:** Tue 12 Nov 09:00

**Description:**
Assignment demonstrating understanding of principles and approaches to automation

# Scenario

You are to deploy a system of your choice using Ansible.
There must be at least the control server and 3 other hosts (the configuration on which may be very similar!)

Ideas:

- Basic local provisioning (users, groups) etc. 
- Attempt .MSI installation files on Windows
- IRC client and server
- Samba / SMB (client, server, drive mapping)
- NFS setup (client and server) 
- Web server
- Desktop (xfce, xrdp)

Machines may be Windows and/or Linux. 


# Requirements

It is expected that submitted files will be free of syntax and basic formatting errors, such that they will run, even if the actions they take are incorrect.
Submitted files that contain errors that prevent them running (e.g. syntax errors) will be treated as not submitted and will receive zero.


## VM setup (15%)

VMs for this exercise may be set up in the XOA system in DkIT or on resource of your own.

The VMs must remain set up until you are told that they can be deleted.

Modify the Linux VM configuration such that `sudo` does *not* require a password.


## Automation SSH key setup (15%)

On the control host set up an ssh keypair and transfer the public key to the managed hosts such that `administrator` (or similar account) can log into all hosts without a password.


## Ansible inventory (10%)

On the control host, create your inventory file for the 3 managed hosts.
The inventory file should be submitted as `inventory.ini`.


## Ansible playbook (40%)

Your ansible playbook in `setup_playbook.yml` should implement as much of the desired functionality as possible.

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
