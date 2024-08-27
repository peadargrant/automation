# Office automation lab

**STOP:** Do not start working on this lab yet. It is not complete.

**Command-line usage:**
These instructions all prefer / encourage / promote use of the PowerShell command-line rather than the explorer GUI for file operations.
This is deliberate.
It's designed to force you to think about relative file paths, and revise the commands relevant to directory navigation and file manipulation. 


## Task 1: Lab folder update

1. Open Windows Terminal.
2. Ensure that it's running PowerShell by looking for `PS` at the prompt. 
3. Navigate to your `automation_lab` folder.
4. Run `git pull --rebase` to pull any updates from GitLab. (There should be no issues with this!)


## Task 2: Create this topic's lab folder

1. Ensure you are in your `automation_lab` folder.
2. In your lab folder, create a folder named `t03_office` using `mkdir t03_office`.
3. Change into your new `t03_office` folder.


## Task 3: Copy the starting files

1. Ensure that you are in your `t03_office` folder.
2. Run the appropriate copy command to copy `sports_
absence_1.ps1` and `absence_form_template.docx` files from the course notes into the lab folder.
3. Use `dir` or `ls` to confirm that the required files are in place.


## Task 4: Run the sample code

1. Run the sample code, filling in any information you like, and confirm that the sample works. 


## Task 5: Make your own

1. Choose a document that you might have to fill in often with different information (e.g. continuous assessment, coversheets, application forms). 
2. Start with the sports absence script by copying it to a new file `fill_form.ps1`. 
3. Save your starting template as `form_template.docx`. 
4. Modify the template file and script to open the new template, fill in the required fields and then save it (as something other than `form_template.docx`). 


## Task 6: Print / send / convert (optional)

**If you don't have time for this section, skip on ahead to the following tasks before leaving the lab.**

If you've go this far, see if you can automatically print or e-mail this file. 

On the lab computers emailing is going to be difficult unless you've got the local Microsoft Office Outlook application already set up with your e-mail account. 


## Task 7: Commit and push your work

1. Add the following files using `git add`:
   - `sports_absence_1.ps1`
   - `abscence_form_template.ps1`
   - `fill_form.ps1`
   - `form_template.docx`
2. Commit your work using `git commit -m 'lab work on office automation'` or a similarly concise commit message.
3. Push your work to gitlab using `git push`. 
4. Confirm with me on your way out that I've seen your commits in gitlab. 

