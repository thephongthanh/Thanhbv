; #FUNCTION# ====================================================================================================================
; Name ..........: Config save - Mod.au3
; Description ...: Extension of saveConfig() for Mod
; Syntax ........: saveConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	; Multi Finger (LunaEclipse)
	IniWrite($config, "MultiFinger", "Select", $iMultiFingerStyle)

	; Config save for SwitchAcc Mode - DEMEN
	If GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED Then
		IniWrite($profile, "Switch Account", "Enable", 1)
	Else
		IniWrite($profile, "Switch Account", "Enable", 0)
	EndIf

	If GUICtrlRead($chkTrain) = $GUI_CHECKED Then
		IniWrite($profile, "Switch Account", "Train", 1)
	Else
		IniWrite($profile, "Switch Account", "Train", 0)
	EndIf

	IniWrite($profile, "Switch Account", "Total Coc Account", _GUICtrlCombobox_GetCurSel($cmbTotalAccount)+1)		; 1 = 1 Acc, 2 = 2 Acc, etc.

	If GUICtrlRead($radSmartSwitch) = $GUI_CHECKED Then
		IniWrite($profile, "Switch Account", "Smart Switch", 1)
	Else
		IniWrite($profile, "Switch Account", "Smart Switch", 0)
	EndIf

	If GUICtrlRead($chkUseTrainingClose) = $GUI_CHECKED Then
		If GUICtrlRead($radCloseCoC) = $GUI_CHECKED Then
			IniWrite($profile, "Switch Account", "Sleep Combo", 1)		; Sleep Combo = 1 => Close CoC
		Else
			IniWrite($profile, "Switch Account", "Sleep Combo", 2)		; Sleep Combo = 2 => Close Android
		EndIf
	Else
		IniWrite($profile, "Switch Account", "Sleep Combo", 0)
	EndIf

	For $i = 1 to 8
		IniWriteS($profile, "Switch Account", "MatchProfileAcc." & $i, _GUICtrlCombobox_GetCurSel($cmbAccountNo[$i-1])+1)		; 1 = Acc 1, 2 = Acc 2, etc.
	Next

	For $i = 1 to 8
		IniWriteS($profile, "Switch Account", "ProfileType." & $i, _GUICtrlCombobox_GetCurSel($cmbProfileType[$i-1])+1)			; 1 = Active, 2 = Donate, 3 = Idle
	Next

	; Config for Adding Quicktrain Combo - DEMEN
	If GUICtrlRead($hRadio_Army12) = $GUI_CHECKED Then
		IniWriteS($config, "troop", "QuickTrain12", 1)
	Else
		IniWriteS($config, "troop", "QuickTrain12", 0)
	EndIf

	If GUICtrlRead($hRadio_Army123) = $GUI_CHECKED Then
		IniWriteS($config, "troop", "QuickTrain123", 1)
	Else
		IniWriteS($config, "troop", "QuickTrain123", 0)
	EndIf

	; Check Collectors Outside
	If GUICtrlRead($chkDBMeetCollOutside) = $GUI_CHECKED Then
		IniWriteS($config, "search", "DBMeetCollOutside", 1)
	Else
		IniWriteS($config, "search", "DBMeetCollOutside", 0)
	EndIf
	IniWriteS($config, "search", "DBMinCollOutsidePercent", GUICtrlRead($txtDBMinCollOutsidePercent))

	; Auto Hide
	If GUICtrlRead($chkAutoHide) = $GUI_CHECKED Then
		$ichkAutoHide = 1
	Else
		$ichkAutoHide = 0
	EndIf
	$ichkAutoHideDelay = GUICtrlRead($txtAutoHideDelay)

	IniWriteS($config, "general", "AutoHide", $ichkAutoHide)
	IniWriteS($config, "general", "AutoHideDelay", $ichkAutoHideDelay)

	; CSV Deployment Speed Mod
	IniWriteS($config, "attack", "CSVSpeedDB", $isldSelectedCSVSpeed[$DB])
	IniWriteS($config, "attack", "CSVSpeedAB", $isldSelectedCSVSpeed[$LB])

	If GUICtrlRead($chkDontRemoveTroops) = $GUI_CHECKED Then
		IniWrite($config, "MOD", "DontRemoveTroops", 1)
	Else
		IniWrite($config, "MOD", "DontRemoveTroops", 0)
	EndIf
#cs
	; Treasury Collect
	If GUICtrlRead($chkCollectTresory) = $GUI_CHECKED Then
		IniWrite($config, "other", "CollectTresory", 1)
		IniWrite($config, "other", "treasuryGold", GUICtrlRead($txtTreasuryGold))
		IniWrite($config, "other", "treasuryElixir", GUICtrlRead($txtTreasuryElixir))
		IniWrite($config, "other", "treasuryDark", GUICtrlRead($txtTreasuryDark))
	Else
		IniWrite($config, "other", "CollectTresory", 0)
		IniWrite($config, "other", "treasuryGold", GUICtrlRead($txtTreasuryGold))
		IniWrite($config, "other", "treasuryElixir", GUICtrlRead($txtTreasuryElixir))
		IniWrite($config, "other", "treasuryDark", GUICtrlRead($txtTreasuryDark))
	EndIf

	If GUICtrlRead($chkCollectTresoryGold) = $GUI_CHECKED Then
		IniWrite($config, "other", "CollectTresoryGold", 1)
	Else
		IniWrite($config, "other", "CollectTresoryGold", 0)
	EndIf

	If GUICtrlRead($chkCollectTresoryElixir) = $GUI_CHECKED Then
		IniWrite($config, "other", "CollectTresoryElixir", 1)
	Else
		IniWrite($config, "other", "CollectTresoryElixir", 0)
	EndIf

	If GUICtrlRead($chkCollectTresoryDark) = $GUI_CHECKED Then
		IniWrite($config, "other", "CollectTresoryDark", 1)
	Else
		IniWrite($config, "other", "CollectTresoryDark", 0)
	EndIf

	If GUICtrlRead($chkTRFull) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkTRFull", 1)
	Else
		IniWrite($config, "other", "chkTRFull", 0)
	EndIf

	; Smart Upgrade
	IniWrite($config, "upgrade", "chkSmartUpgrade", $ichkSmartUpgrade)
	IniWrite($config, "upgrade", "chkIgnoreTH", $ichkIgnoreTH)
	IniWrite($config, "upgrade", "chkIgnoreKing", $ichkIgnoreKing)
	IniWrite($config, "upgrade", "chkIgnoreQueen", $ichkIgnoreQueen)
	IniWrite($config, "upgrade", "chkIgnoreWarden", $ichkIgnoreWarden)
	IniWrite($config, "upgrade", "chkIgnoreCC", $ichkIgnoreCC)
	IniWrite($config, "upgrade", "chkIgnoreLab", $ichkIgnoreLab)
	IniWrite($config, "upgrade", "chkIgnoreBarrack", $ichkIgnoreBarrack)
	IniWrite($config, "upgrade", "chkIgnoreDBarrack", $ichkIgnoreDBarrack)
	IniWrite($config, "upgrade", "chkIgnoreFactory", $ichkIgnoreFactory)
	IniWrite($config, "upgrade", "chkIgnoreDFactory", $ichkIgnoreDFactory)
	IniWrite($config, "upgrade", "chkIgnoreGColl", $ichkIgnoreGColl)
	IniWrite($config, "upgrade", "chkIgnoreEColl", $ichkIgnoreEColl)
	IniWrite($config, "upgrade", "chkIgnoreDColl", $ichkIgnoreDColl)
	IniWrite($config, "upgrade", "SmartMinGold", GUICtrlRead($SmartMinGold))
	IniWrite($config, "upgrade", "SmartMinElixir", GUICtrlRead($SmartMinElixir))
	IniWrite($config, "upgrade", "SmartMinDark", GUICtrlRead($SmartMinDark))
#ce