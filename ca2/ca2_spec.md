% Automation CA2 specification

**Deadline:** 20/12/2024 09:00


# Requirements

You are to construct an automation of your choice for either system setup, administration or deployment purposes.
You can use CA1 (if you wish, not required!) as a basis for starting this CA but you must discuss this with me first.

## Problem description. (10%)

What do you aim to do, and why? 

Should be in a file called `description.txt`.

Make sure to explain the node(s) involved and their relationships to each other.


## Planned approach (10%)

Explain how you're going to automate, focusing on what cannot easily be automated, or other scripts / tools that you will employ.

Should be in a file called `planned_approach.txt`.

Make sure to explain if you're going to use a script to drive the automation itself (e.g. a PS or bash script that calls the ansible playbook).


## Ansible playbooks (40%)

Provide suitable ansible playbooks to perform your automation steps.

Syntax, clarity, descriptive naming, commenting etc. 

Consider using loops, and external data sources (e.g. csv files) as required. 


## Ancillary scripts (20%)

Provide a scripts that will run the playbooks as required for each different task / scenario that you have.

You should supply script as needed to do any preparatory setup on the control (or other) nodes
- ansible installation itself
- copying ssh keys 
- WinRM setup 


## Demonstration instruction file (10%)

Provide a set of human-readable instructions for someone at the skill level as you to run the supplied system from scratch.

Specify VMs if needed. 

Should be in a file `instructions.txt`.


## Evidence (10%)

Provide screenshots / text dumps of a selection of command output to show that your system performs as required.



# Submission

Required files are to be placed in the `ca2` folder of your labs git repository.

Files should be submitted and pushed to GitLab in advance of the submission deadline to be taken as submitted.


# Feedback

Summary feedback will be provided on Moodle and/or GitLab.
Verbal feedback available on request.


# Generative AI

It is not permitted to use Generative AI in this assignment.


