#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; AutoHotkey
; make capslock do control
Capslock::Ctrl
Ctrl::Capslock

#c::
run, chrome.exe
Return

; ^-Ctrl !-Alt
^q::Send !{F4}

^f::WinMaximize, A
