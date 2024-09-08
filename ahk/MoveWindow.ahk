#Requires AutoHotkey v2.0
#SingleInstance Force

SetWorkingDir A_ScriptDir

; https://wyagd001.github.io/v2/docs/lib/CoordMode.htm
CoordMode "Pixel", "Screen"
SendMode "Event"


MoveWindow() {
    ; https://www.autohotkey.com/docs/v2/misc/WinTitle.htm
    active_id := WinGetID("Calculator ahk_class ApplicationFrameWindow ahk_exe ApplicationFrameHost.exe")    
    WinActivate("ahk_id " active_id)
    WinWait("ahk_id " active_id)
    ; Move the window to the top left of the screen
    WinMove(0,0) 
}


F4::{
ExitApp
}

MoveWindow()