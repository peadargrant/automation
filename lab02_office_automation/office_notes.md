# Office automation example


## Aims

- Identify opportunities to automate client-side processes
- Implement a basic client-side automation flow
- Appreciate the context and constraints of basic automation
- Advocate for system changes needed to enable automation


## Sample scenario

The sports co-ordinator at a technical college has to fill in a form to mail to the school office when a student needs to be released from class for college sports events.
The administration demands that class release forms are completed in Word using a template they have designed, mailed to the School office in Word format, saved and printed for record.
The form itself is cumbersome and needs the student's name to be entered in multiple places.

While the sports co-ordinator themselves is tech-savvy, comfortable using command-line interfaces and is solutions focused, the college administration are mired in cumbersome processes and very unwilling to change.
They have rejected using Microsoft Forms or a simpler e-mail based request.

Because of the amount of time taken and potential for mistakes, the sports co-ordinator wants a solution to at least quickly generate the forms required. 

They do not have Administrator access to their PC, Micosoft Office suite is on it, and PowerShell access seems unhindered. (Yes, some IT managers actually use GPO on Windows domains to disable access to PowerShell!)


## Approaches

There are at least three straightforward possibilies:

1. Within Word using VBA.

   - VBA is starting to look unsupported and unpromoted by Microsoft themselves. 

2. Using Python or another language to modify the template word document file directly. 

   - We don't know whether Python is or isn't installed, or whether it can be. 

3. Automate Word's own find and replace operation using Python, Powershell or another language.

	- Will definitely work once PowerShell access is unhindered.
	- Can start with partial or incomplete automation.
	
In today's example we'll choose the latter option, using PowerShell.
A basic script that we'll use for example is shown in `sports_absence_1.ps1`.


## COM automation

Microsoft Office, and many other applications, can be manipulated using PowerShell. 
This essentially exposes the same functionality that you'd use with the GUI to PowerShell. 
It's very powerful, but can be confusing at first.


## GUI Visibility

In today's example we'll make the GUI visible. 
It's possible to have automations that open Word (or other apps) without actually showing the GUI. 
This decision will depend on the scenario of interest, and sometimes will be useful during development. 


## File mutability

In general, mutability can trip you up!

Just as when doing things manually, it's best to avoid modifying files in-place where possible. 

Where possible, open any input (such as template files) read-only.
After you've actioned changes, save the file as a new name. 


