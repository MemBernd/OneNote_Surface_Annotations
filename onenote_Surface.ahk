#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#IfWinActive ahk_exe ONENOTE.EXE
XButton1::
XButton2::
	timeWait := 100
	textToAdd := ">>"
	slideHeight := 1500
	leftMargin := 200

	;zoom on current slide
	ZoomElement(leftMargin, 500)
	Sleep, timeWait

	;zoom next slide
	SendInput {WheelDown}
	SendInput {WheelDown}
	SendInput {WheelDown}
	ZoomElement(leftMargin, 1500)



	;write on left bottom
	Click %leftMargin%, 1500, 2
	SendInput {Raw}>>

return

ZoomElement(X, Y) {
	Click Right %X%, %Y%
	SendInput, {Down 5}{Enter}
}
