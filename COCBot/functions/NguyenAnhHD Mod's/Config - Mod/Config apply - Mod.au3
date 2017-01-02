; #FUNCTION# ====================================================================================================================
; Name ..........: Config apply - Mod.au3
; Description ...: Extension of applyConfig() for Mod
; Syntax ........: applyConfig()
; Parameters ....:
; Return values .:
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

	; Multi Finger (LunaEclipse)
	_GUICtrlComboBox_SetCurSel($cmbDBMultiFinger, $iMultiFingerStyle)
	cmbDBMultiFinger()

	cmbDeployAB()
	cmbDeployDB()

	; Config Apply for SwitchAcc Mode - DEMEN
	If $ichkSwitchAcc = 1 Then
		GUICtrlSetState($chkSwitchAcc, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSwitchAcc, $GUI_UNCHECKED)
	EndIf

	If $ichkTrain = 1 Then
		GUICtrlSetState($chkTrain, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrain, $GUI_UNCHECKED)
	EndIf

	If $ichkSmartSwitch = 1 Then
		GUICtrlSetState($radSmartSwitch, $GUI_CHECKED)
	Else
		GUICtrlSetState($radNormalSwitch, $GUI_CHECKED)
	EndIf

	radNormalSwitch()

	_GUICtrlCombobox_SetCurSel($cmbTotalAccount, $icmbTotalCoCAcc - 1)

	If $ichkCloseTraining >= 1 Then
		GUICtrlSetState($chkUseTrainingClose, $GUI_CHECKED)
		If $ichkCloseTraining = 1 Then
			GUICtrlSetState($radCloseCoC, $GUI_CHECKED)
		Else
			GUICtrlSetState($radCloseAndroid, $GUI_CHECKED)
		EndIf
	Else
		GUICtrlSetState($chkUseTrainingClose, $GUI_UNCHECKED)
	EndIf

	For $i = 0 to 7
		_GUICtrlCombobox_SetCurSel($cmbAccountNo[$i], $aMatchProfileAcc[$i]-1)
		_GUICtrlCombobox_SetCurSel($cmbProfileType[$i], $aProfileType[$i]-1)
	Next

	; Adding QuicktrainCombo - DEMEN
	If $iRadio_Army12 = 1 Then
		GUICtrlSetState($hRadio_Army12, $GUI_CHECKED)
	Else
		GUICtrlSetState($hRadio_Army12, $GUI_UNCHECKED)
	EndIf

	If $iRadio_Army123 = 1 Then
		GUICtrlSetState($hRadio_Army123, $GUI_CHECKED)
	Else
		GUICtrlSetState($hRadio_Army123, $GUI_UNCHECKED)
	EndIf

	; Check Collectors Outside
	If $ichkDBMeetCollOutside = 1 Then
		GUICtrlSetState($chkDBMeetCollOutside, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetCollOutside, $GUI_UNCHECKED)
	EndIf
	chkDBMeetCollOutside()
	GUICtrlSetData($txtDBMinCollOutsidePercent, $iDBMinCollOutsidePercent)

	; Auto Hide
	If $ichkAutoHide = 1 Then
		GUICtrlSetState($chkAutoHide, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAutoHide, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtAutoHideDelay, $ichkAutoHideDelay)
	chkAutoHide()

	; CSV Deployment Speed Mod
	GUICtrlSetData($sldSelectedSpeedDB, $isldSelectedCSVSpeed[$DB])
	GUICtrlSetData($sldSelectedSpeedAB, $isldSelectedCSVSpeed[$LB])
	sldSelectedSpeedDB()
	sldSelectedSpeedAB()

	; Change Android Shield Color
	_GUICtrlSlider_SetPos($sldrTransparancyShield, $AndroidShieldTransparency)
	_GUICtrlSlider_SetPos($sldrTransparancyIdleShield, $AndroidInactiveTransparency)

	; Don't Remove Troops
	If $ichkDontRemoveTroops = 1 Then
		GUICtrlSetState($chkDontRemoveTroops, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDontRemoveTroops, $GUI_UNCHECKED)
	EndIf
	chkDontRemoveTroops()
