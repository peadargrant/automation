# Fill in sports absence form (simple version!)
# Peadar Grant

# Capture information (needn't come from user input!)
# (Could instead come from DB, XLSX, CSV, JSON, in a loop etc.)
Write-Host "Absence form information"
$Name = Read-Host "Enter student name"
$Date = Read-Host "Enter match date"
$Opponents = Read-Host "Enter opponent team name"

# Create new MS Word Object
# Essentially we start the MS word application and get a handle to it
$Word = New-Object -ComObject Word.Application

# Makes the program GUI Visible
# (optional, but handy to see when developing)
$Word.Visible=$True

# Open the original file to be edited
# (needs *full* path as the COM object doesn't know the current directory!)
$OpenFile = $Word.Documents.Open("C:\Users\GrantP\Desktop\absence_form_template.docx", $False, $True)

# Handle to the insertion point / cursor selection
$Selection = $Word.Selection

# Setup for Finding (largely matches GUI tick box options)
$FindContinue=1  
$MatchCase=$False
$MatchWholeWord=$true
$MatchWildcards=$false
$MatchSoundsLike=$false
$MatchAllWordForms=$False
$Forward=$True
$Wrap=$FindContinue
$Format=$True
$ReplaceNone=0
$FindContinue=1
$ReplaceAll=2                                                                                                                                              

# Replace Name
$FindText='<<NAME>>'  
$ReplaceWith=$Name
$Selection.Find.Execute($FindText,$MatchCase,$MatchWholeWord,$MatchWildCards,$MatchSoundsLike,$MatchAllWordForms,$Forward,$Wrap,$Format,$ReplaceWith,$ReplaceAll)

# Replace date
$FindText='<<DATE>>'
$ReplaceWith=$Date
$Selection.Find.Execute($FindText,$MatchCase,$MatchWholeWord,$MatchWildCards,$MatchSoundsLike,$MatchAllWordForms,$Forward,$Wrap,$Format,$ReplaceWith,$ReplaceAll)

# Replace Opponents
$FindText='<<OPPONENTS>>'
$ReplaceWith=$Opponents
$Selection.Find.Execute($FindText,$MatchCase,$MatchWholeWord,$MatchWildCards,$MatchSoundsLike,$MatchAllWordForms,$Forward,$Wrap,$Format,$ReplaceWith,$ReplaceAll)

# Make sure to update the fields (if any)
$word.ActiveDocument.Fields.Update() 

$word.ActiveDocument.saveas([ref]"C:\Users\GrantP\Desktop\absence_form_output.docx");

