; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Tab Mod Option
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: LunaEclipse(February, 2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;==============================================================
; SmartZap - Added by DocOC team
;==============================================================
Func chkSmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		GUICtrlSetState($chkNoobZap, $GUI_ENABLE)
		$ichkSmartZap = 1
	Else
		GUICtrlSetState($chkSmartZapDB, $GUI_DISABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_DISABLE)
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		GUICtrlSetState($chkNoobZap, $GUI_DISABLE)
		$ichkSmartZap = 0
	EndIf
EndFunc   ;==>chkSmartLightSpell

Func chkNoobZap()
	If GUICtrlRead($chkNoobZap) = $GUI_CHECKED Then
		GUICtrlSetState($txtExpectedDE, $GUI_ENABLE)
		$ichkNoobZap = 1
	Else
		GUICtrlSetState($txtExpectedDE, $GUI_DISABLE)
		$ichkNoobZap = 0
	EndIf
EndFunc   ;==>chkDumbZap

Func chkSmartZapDB()
    If GUICtrlRead($chkSmartZapDB) = $GUI_CHECKED Then
        $ichkSmartZapDB = 1
    Else
        $ichkSmartZapDB = 0
    EndIf
EndFunc   ;==>chkSmartZapDB

Func chkSmartZapSaveHeroes()
    If GUICtrlRead($chkSmartZapSaveHeroes) = $GUI_CHECKED Then
        $ichkSmartZapSaveHeroes = 1
    Else
        $ichkSmartZapSaveHeroes = 0
    EndIf
EndFunc   ;==>chkSmartZapSaveHeroes

Func txtMinDark()
	$itxtMinDE = GUICtrlRead($txtMinDark)
EndFunc   ;==>txtMinDark

Func txtExpectedDE()
	$itxtExpectedDE = GUICtrlRead($txtExpectedDE)
EndFunc   ;==>TxtExpectedDE
;==========================END=================================
;			 SmartZap - Added by DocOC team
;==============================================================
