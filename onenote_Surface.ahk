#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


timeWaitLong := 500
timeWaitShort := 80
textToAdd := ">>"
slideHeight := 1500
leftMargin := 200
mode = 0	;0 for marking, 1 for reviewing/browsing

;custom menu, other components can be found at the bottom
Menu, tray, nostandard
Menu, tray, add, ReviewMode, ChangeMode
Menu, tray, add, Show last executed &Commands, MyListLines
Menu, tray, add, Show last used &Keys, MyKeyHistory
Menu, tray, add, Show defined &Hotkeys, MyListHotkeys
Menu, tray, add, Show &Variables, MyListVars
Menu, tray, add, &Help, MyHelp
Menu, tray, add ; separator
Menu, tray, add, Window &Spy, MyWinSpy
Menu, tray, add, &Reload This Script, MyReload
Menu, tray, add, &Edit This Script, MyEdit
Menu, tray, add ; separator
Menu, tray, add, &Suspend Hotkeys, MySuspend
Menu, tray, add, &Pause executing script, MyPause
Menu, tray, add, E&xit this script, MyExit ; added exit script option
Menu, tray, Default, Show &Variables

ChangeMode:
	if mode = 1 
	{
		mode = 0
		Menu, tray, Uncheck, ReviewMode
	}
	else 
	{ 
		mode = 1
		Menu, tray, Check, ReviewMode
	}
return


#IfWinActive ahk_exe ONENOTE.EXE
XButton2::
	ZoomPrevious(leftMargin, 500)
return
XButton1::
	if mode = 0
	{
		;zoom on current slide
		ZoomElement(leftMargin, 500)
		Sleep, timeWaitLong
	}

	;zoom next slide
	ZoomNext(leftMargin, 1500)
	
	if mode = 0
	{
		;write on left bottom
		Click %leftMargin%, 1500, 2
		SendInput {Raw}%textToAdd%
	}
return

ZoomPrevious(X, Y) {
	SendInput {WheelUp 4}
	ZoomElement(X, Y)
}

ZoomNext(X, Y) {
	SendInput {WheelDown 3}
	ZoomElement(X, Y)
}

ZoomElement(X, Y) {
	Click Right %X%, %Y%
	Sleep, timeWaitShort
	SendInput, {Down 5}{Enter}
}



;autohotkey menu recreation
; found on https://autohotkey.com/board/topic/92260-autohotkey-right-click-menu/

AHKDIR := A_AhkPath    ; to get the AHK folder
StringGetPos, BackslashVar, AHKDIR, \, R
StringLeft, AHKDIR, AHKDIR, BackslashVar+1
Return

MyListLines:
	ListLines
Return

MyKeyHistory:
	KeyHistory
Return

MyListHotkeys:
	ListHotkeys
Return

MyListVars:
	ListVars
Return

MyHelp:
    Run, %AHKDIR%AutoHotkey.chm
Return

MyWinSpy:
    Run, %AHKDIR%AU3_Spy.exe
Return

MyReload:
    Reload
Return

MyEdit:
    Edit
Return

MySuspend:
    Suspend Toggle
Return

MyPause:
    Pause Toggle
Return

MyExit: ; exit script label
    ExitApp
Return
