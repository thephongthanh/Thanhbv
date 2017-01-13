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

	; Profile Switch
	If $ichkGoldSwitchMax = 1 Then
		GUICtrlSetState($chkGoldSwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGoldSwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbGoldMaxProfile, $icmbGoldMaxProfile)
	GUICtrlSetData($txtMaxGoldAmount, $itxtMaxGoldAmount)
	If $ichkGoldSwitchMin = 1 Then
		GUICtrlSetState($chkGoldSwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGoldSwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbGoldMinProfile, $icmbGoldMinProfile)
	GUICtrlSetData($txtMinGoldAmount, $itxtMinGoldAmount)

	If $ichkElixirSwitchMax = 1 Then
		GUICtrlSetState($chkElixirSwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkElixirSwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbElixirMaxProfile, $icmbElixirMaxProfile)
	GUICtrlSetData($txtMaxElixirAmount, $itxtMaxElixirAmount)
	If $ichkElixirSwitchMin = 1 Then
		GUICtrlSetState($chkElixirSwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkElixirSwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbElixirMinProfile, $icmbElixirMinProfile)
	GUICtrlSetData($txtMinElixirAmount, $itxtMinElixirAmount)

	If $ichkDESwitchMax = 1 Then
		GUICtrlSetState($chkDESwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbDEMaxProfile, $icmbDEMaxProfile)
	GUICtrlSetData($txtMaxDEAmount, $itxtMaxDEAmount)
	If $ichkDESwitchMin = 1 Then
		GUICtrlSetState($chkDESwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbDEMinProfile, $icmbDEMinProfile)
	GUICtrlSetData($txtMinDEAmount, $itxtMinDEAmount)

	If $ichkTrophySwitchMax = 1 Then
		GUICtrlSetState($chkTrophySwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophySwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbTrophyMaxProfile, $icmbTrophyMaxProfile)
	GUICtrlSetData($txtMaxTrophyAmount, $itxtMaxTrophyAmount)
	If $ichkTrophySwitchMin = 1 Then
		GUICtrlSetState($chkTrophySwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophySwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbTrophyMinProfile, $icmbTrophyMinProfile)
	GUICtrlSetData($txtMinTrophyAmount, $itxtMinTrophyAmount)

	; SimpleQuicktrain - DEMEN
	If $ichkSimpleQuickTrain = 1 Then
		GUICtrlSetState($chkSimpleQuickTrain, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSimpleQuickTrain, $GUI_UNCHECKED)
	EndIf

	If $ichkFillArcher = 1 Then
		GUICtrlSetState($chkFillArcher, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFillArcher, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtFillArcher, $iFillArcher)

	If $ichkFillEQ = 1 Then
		GUICtrlSetState($chkFillEQ, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFillEQ, $GUI_UNCHECKED)
	EndIf

	If $ichkTrainDonated = 1 Then
		GUICtrlSetState($chkTrainDonated, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrainDonated, $GUI_UNCHECKED)
	EndIf

	; Clan Hop Setting
	If $ichkClanHop = 1 Then
		GUICtrlSetState($chkClanHop, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkClanHop, $GUI_UNCHECKED)
	EndIf

    ; Forecast Added by rulesss
	GUICtrlSetData($txtForecastBoost, $iTxtForecastBoost)
	If $iChkForecastBoost = 1 Then
		GUICtrlSetState($chkForecastBoost, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForecastBoost, $GUI_UNCHECKED)
	EndIf
	chkForecastBoost()

	If $ichkForecastHopingSwitchMax = 1 Then
		GUICtrlSetState($chkForecastHopingSwitchMax, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForecastHopingSwitchMax, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbForecastHopingSwitchMax, $icmbForecastHopingSwitchMax)
	GUICtrlSetData($txtForecastHopingSwitchMax, $itxtForecastHopingSwitchMax)
	chkForecastHopingSwitchMax()

	If $ichkForecastHopingSwitchMin = 1 Then
		GUICtrlSetState($chkForecastHopingSwitchMin, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForecastHopingSwitchMin, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbForecastHopingSwitchMin, $icmbForecastHopingSwitchMin)
	GUICtrlSetData($txtForecastHopingSwitchMin, $itxtForecastHopingSwitchMin)
	chkForecastHopingSwitchMin()

	; Added Multi Switch Language by rulesss and Kychera
	_GUICtrlComboBox_SetCurSel($cmbSwLang, $icmbSwLang)
	$icmbSwLang = _GUICtrlComboBox_GetCurSel($cmbSwLang)
