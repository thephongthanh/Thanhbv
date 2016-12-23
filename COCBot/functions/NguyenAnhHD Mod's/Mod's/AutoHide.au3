; #FUNCTION# ====================================================================================================================
; Name ..........: AutoHide
; Description ...:
; Syntax ........: AutoHide()
; Parameters ....:
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func AutoHide()
	If $ichkAutoHide = 1 Then
		SetLog("Bot Auto Hide in " & $ichkAutoHideDelay & " seconds", $COLOR_RED)
		Sleep($ichkAutoHideDelay * 1000)
		btnHide()
	EndIf
EndFunc   ;==>AutoHide
