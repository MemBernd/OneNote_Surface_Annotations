#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe ONENOTE.EXE
XButton1::
XButton2::

timeWait := 1000
textToAdd := ">>"
slideHeight := 1500

ZoomElement(1500, 1500)
return

ZoomElement(X, Y) {
	Click Right %X%, %Y%
	SendInput, {Down 5}{Enter}
}