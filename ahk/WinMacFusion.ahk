#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Input"
SetWorkingDir A_ScriptDir

/*
Swith Virtual Desktop with "Ctrl + Arrow" 
instead of "Ctrl + Win + Arrow"
*/

~^Left:: {
    Send "^#{Left}"
    Return
}


~^Right:: {
    Send "^#{Right}"
    Return
}