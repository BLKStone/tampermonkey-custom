; <COMPILER: v1.1.33.09>
#Persistent
#SingleInstance, Force
filename := "temp.ahk"
currQuestion := 1
questionsListNames := []
questionsList := []
IntroQs := []
arrr := IntroQs
questionsListNames.push("Introduction")
questionsList.push(arrr)
addQuestion(arrr
,
(LTrim 
"Welcome to the AHK Interactive tutorial!

Follow the intro to learn basics that will be used in later sections

The text area to the right is used to write your code

Edit the text to say
Hello World!

Then click Submit to run the script
Check your answer with the Solution

The script will be written to a temp.ahk file in the same directory
"
)
,
(LTrim 
"MsgBox, Hi
"
)
,
(LTrim 
"MsgBox, Hello World!
"
))
addMultipleChoice(arrr
,
(LTrim 
"Multiple choice questions

To answer these questions, change the number and click submit

1: AHK sucks
2: AHK is cool
"
)
,2)
addQuestion(arrr
,
(LTrim 
"Fix the typo type questions

AHK has some strange naming conventions and syntax structure

It's very common to make simple mistakes like this
"
)
,
(LTrim 
"MessageBox, Hi
"
)
,
(LTrim 
"MsgBox, Hi
"
))
addQuestion(arrr
,
(LTrim 
"Moving the mouse

The first number is the X coordinate or distance in pixels from the left of your screen
The second number is the Y coordinate or distance in pixels from the top of your screen

Currently the script will move the mouse to the top left of your screen
Try changing the numbers to make it move to a different position

See ""Mouse commands"" questions for more related questions
"
)
,
(LTrim 
"CoordMode, Mouse, Screen
MouseMove, 0, 0
"
)
,
(LTrim 
"CoordMode, Mouse, Screen
MouseMove, 400, 400
"
))
addQuestion(arrr
,
(LTrim 
"Hotkeys

Let's create a shortcut to trigger the script instead of running straight away

Add a hotkey by typing the shortcut key + :: before any code you want to be triggered e.g.
q::

After clicking submit, you will need to press the hotkey to trigger the script

Try to use other keys as the shortcut key!

See ""Hotkeys"" questions for more related questions
"
)
,
(LTrim 
"CoordMode, Mouse, Screen
MouseMove, 400, 400
"
)
,
(LTrim 
"CoordMode, Mouse, Screen
q::
MouseMove, 400, 400
"
))
addQuestion(arrr
,
(LTrim 
"Running programs

AHK can help automate running programs, for example Notepad

AHK can also open URLs
Try modifying the script to open the website https://www.google.com

<a href=""https://www.autohotkey.com/docs/commands/Run.htm"">AHK Docs - Run</a>
"
)
,
(LTrim 
"Run, notepad
"
)
,
(LTrim 
"Run, https://www.google.com
"
))
addQuestion(arrr
,
(LTrim 
"Sending key presses

Using Notepad, we can show key presses as they happen

WinActivate is used to bring Notepad into focus

Type Hello World into Notepad

See ""Keypressing"" questions for more related questions

<a href=""https://www.autohotkey.com/docs/commands/Send.htm"">AHK Docs - Send</a>
"
)
,
(LTrim 
"Run, notepad
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
Send, Hi
"
)
,
(LTrim 
"Run, notepad
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
Send, Hello World
"
))
addQuestion(arrr
,
(LTrim 
"Loops

Instead of repeating a command over and over, you can use a loop

Increase the number of times the script loops

<a href=""https://www.autohotkey.com/docs/commands/Loop.htm"">AHK Docs - Loop</a>
"
)
,
(LTrim 
"loop, 1 {
MsgBox, Hi
}
"
)
,
(LTrim 
"loop, 5 {
MsgBox, Hi
}
"
))
addQuestion(arrr
,
(LTrim 
"Functions

You can group multiple commands together into a function

Calling the function will run the commands one after another without repeating yourself

Add any commands you have learned into the function and run the script

<a href=""https://www.autohotkey.com/docs/commands/Loop.htm"">AHK Docs - Loop</a>
"
)
,
(LTrim 
"myFunction()

myFunction() {

}
"
)
,
(LTrim 
"myFunction()

myFunction() {
MsgBox, Hi
MouseMove, 400, 400
Run, notepad
}
"
))
addQuestion(arrr
,
(LTrim 
"Variables

Variables let you use a custom name for storing values

You can then repeat that name to use the value over and over

You can also modify the value stored while still using the same name

You should not use spaces or special characters in variable names

Try changing the value of the variable

<a href=""https://www.autohotkey.com/docs/Variables.htm"">AHK Docs - Variables</a>
"
)
,
(LTrim 
"myVariable = 1
MsgBox, myVariable is equal to %myVariable%
Tooltip, myVariable is equal to %myVariable%
"
)
,
(LTrim 
"myVariable = 1
myVariable = haha
MsgBox, myVariable is equal to %myVariable%
Tooltip, myVariable is equal to %myVariable%
"
))
addQuestion(arrr
,
(LTrim 
"Random

The Random command creates a new variable with a random value between the min and max values provided

The value of the variable will only change when you call Random again

Add another Random command so both message boxes show a new random value

" . doc("Random")
)
,
(LTrim 
"Random, myVariable, 0, 100
MsgBox, %myVariable%
MsgBox, %myVariable%
"
)
,
(LTrim 
"Random, myVariable, 0, 100
MsgBox, %myVariable%
Random, myVariable, 0, 100
MsgBox, %myVariable%
"
))
addQuestion(arrr
,
(LTrim 
"If statements

To run a script only if a condition is met e.g. variable is above another value, use If expressions

In an if-else block, the first block will run if the expression is true, otherwise the second block will run

Fill in the else block

" . doc("If")
)
,
(LTrim 
"Random, myVariable, 0, 100
If (myVariable > 50) {
MsgBox, You won with %myVariable%!
} else {

}
"
)
,
(LTrim 
"Random, myVariable, 0, 100
If (myVariable > 50) {
MsgBox, You won with %myVariable%!
} else {
MsgBox, You lost with %myVariable%!
}
"
))
addQuestion(arrr
,
(LTrim 
"Sleep

To delay a script, use the Sleep command

The argument is how long to delay in milliseconds and can also be a variable

Add a sleep for 1 second before the message box shows

" . doc("Sleep")
)
,
(LTrim 
"Sleep, 0
Msgbox, Hi
"
)
,
(LTrim 
"Sleep, 1000
Msgbox, Hi
"
))
choices := Join("|",questionsListNames)
questions := questionsList[1]
Join(sep, params) {
for index,param in params
str .= param . sep
return SubStr(str, 1, -StrLen(sep))
}
Gui, New, hwndhGui Resize MinSize
Gui, Font, s12, Calibri
Gui, Add, DropDownList,section vQuestionsChoice gLoadQuestions AltSubmit Choose1, %choices%
Gui, Add, Text, w300 vQuestionNumber,
Gui, Add, Link, w300 r20 vDescription, Description
Gui, Font, s18, Courier New
Gui, Add, Edit, section ys r17 w800 vUserEnteredCode, Enter code
Gui, Font, s12, Calibri
Gui, Add, Button, xs w180 h60 gRunCode, Submit
Gui, Add, Button, yp xp+200 w90 gResetText, Reset
Gui, Add, Button, yp xp+90 w90 gShowSolution, Solution
Gui, Add, Button, xp-90 yp+30 w90 gPreviousQuestion, Previous
Gui, Add, Button, yp xp+90 w90 gNextQuestion, Next
Gui, Show,, AHK Interactive Tutorial
GoSub, ResetText
return
addQuestion(ByRef arr, desc, initial, solution) {
arr.push({"desc":desc,"initial":initial,"solution":solution})
}
addMultipleChoice(ByRef arr, desc, solution) {
initial := "choice:="
initial .= "`n(`n0`n)"
loop, 20 {
initial .= "`n"
}
initial .= "Msgbox, % (choice == "
initial .= solution
initial .= " ? ""Correct"" : ""Incorrect"")"
arr.push({"desc":desc,"initial":initial,"solution":solution})
}
LoadQuestions:
Gui, Submit, NoHide
questions := questionsList[QuestionsChoice]
currQuestion := 1
GoSub, ResetText
return
PreviousQuestion:
currQuestion := max(1,currQuestion-1)
GoSub, ResetText
return
NextQuestion:
currQuestion := min(questions.length(),currQuestion+1)
GoSub, ResetText
return
ResetText:
Gui, Submit, NoHide
UpdateText("UserEnteredCode", "")
UpdateText("Description", questions[currQuestion].desc)
UpdateText("UserEnteredCode", questions[currQuestion].initial)
UpdateText("QuestionNumber", "Question " currQuestion "/" questions.length())
return
ShowSolution:
Gui, Submit, NoHide
UpdateText("UserEnteredCode", "")
UpdateText("UserEnteredCode", questions[currQuestion].solution)
return
RunCode:
Gui, Submit, NoHide
FileDelete, %filename%
UpdateText("Status", "Playing back")
ahk:=A_IsCompiled ? A_ScriptDir "\AutoHotkey.exe" : A_AhkPath
IfNotExist, %ahk%
{
MsgBox, 4096, Error, Can't Find %ahk% !
Exit
}
FileAppend, % UserEnteredCode, %filename%
Run, %ahk% /r "%filename%"
return
UpdateText(ControlID, NewText)
{
static OldText := {}
global hGui
if (OldText[ControlID] != NewText)
{
GuiControl, %hGui%:, % ControlID, % NewText
OldText[ControlID] := NewText
}
}
doc(name) {
retvalue := "<a href=""https://www.autohotkey.com/docs/"
retvalue .= name
retvalue .= ".htm"">AHK Docs - "
retvalue .= name
retvalue .= "</a>"
return retvalue
}
GuiClose:
GuiEscape:
ExitApp
