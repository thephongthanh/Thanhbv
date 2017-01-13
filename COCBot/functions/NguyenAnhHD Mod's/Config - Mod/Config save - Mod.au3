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
		IniWrite($profile, "Switch Account", "Pre-train", 1)
	Else
		IniWrite($profile, "Switch Account", "Pre-train", 0)
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

	; Profile Switch Settings
	If GUICtrlRead($chkGoldSwitchMax) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkGoldSwitchMax", 1)
	Else
		IniWrite($config, "profiles", "chkGoldSwitchMax", 0)
	EndIf
	IniWrite($config, "profiles", "cmbGoldMaxProfile", _GUICtrlComboBox_GetCurSel($cmbGoldMaxProfile))
	IniWrite($config, "profiles", "txtMaxGoldAmount", GUICtrlRead($txtMaxGoldAmount))

	If GUICtrlRead($chkGoldSwitchMin) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkGoldSwitchMin", 1)
	Else
		IniWrite($config, "profiles", "chkGoldSwitchMin", 0)
	EndIf
	IniWrite($config, "profiles", "cmbGoldMinProfile", _GUICtrlComboBox_GetCurSel($cmbGoldMinProfile))
	IniWrite($config, "profiles", "txtMinGoldAmount", GUICtrlRead($txtMinGoldAmount))

	If GUICtrlRead($chkElixirSwitchMax) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkElixirSwitchMax", 1)
	Else
		IniWrite($config, "profiles", "chkElixirSwitchMax", 0)
	EndIf
	IniWrite($config, "profiles", "cmbElixirMaxProfile", _GUICtrlComboBox_GetCurSel($cmbElixirMaxProfile))
	IniWrite($config, "profiles", "txtMaxElixirAmount", GUICtrlRead($txtMaxElixirAmount))

	If GUICtrlRead($chkElixirSwitchMin) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkElixirSwitchMin", 1)
	Else
		IniWrite($config, "profiles", "chkElixirSwitchMin", 0)
	EndIf
	IniWrite($config, "profiles", "cmbElixirMinProfile", _GUICtrlComboBox_GetCurSel($cmbElixirMinProfile))
	IniWrite($config, "profiles", "txtMinElixirAmount", GUICtrlRead($txtMinElixirAmount))

	If GUICtrlRead($chkDESwitchMax) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkDESwitchMax", 1)
	Else
		IniWrite($config, "profiles", "chkDESwitchMax", 0)
	EndIf
	IniWrite($config, "profiles", "cmbDEMaxProfile", _GUICtrlComboBox_GetCurSel($cmbDEMaxProfile))
	IniWrite($config, "profiles", "txtMaxDEAmount", GUICtrlRead($txtMaxDEAmount))

	If GUICtrlRead($chkDESwitchMin) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkDESwitchMin", 1)
	Else
		IniWrite($config, "profiles", "chkDESwitchMin", 0)
	EndIf
	IniWrite($config, "profiles", "cmbDEMinProfile", _GUICtrlComboBox_GetCurSel($cmbDEMinProfile))
	IniWrite($config, "profiles", "txtMinDEAmount", GUICtrlRead($txtMinDEAmount))

	If GUICtrlRead($chkTrophySwitchMax) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkTrophySwitchMax", 1)
	Else
		IniWrite($config, "profiles", "chkTrophySwitchMax", 0)
	EndIf
	IniWrite($config, "profiles", "cmbTrophyMaxProfile", _GUICtrlComboBox_GetCurSel($cmbTrophyMaxProfile))
	IniWrite($config, "profiles", "txtMaxTrophyAmount", GUICtrlRead($txtMaxTrophyAmount))

	If GUICtrlRead($chkTrophySwitchMin) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkTrophySwitchMin", 1)
	Else
		IniWrite($config, "profiles", "chkTrophySwitchMin", 0)
	EndIf
	IniWrite($config, "profiles", "cmbTrophyMinProfile", _GUICtrlComboBox_GetCurSel($cmbTrophyMinProfile))
	IniWrite($config, "profiles", "txtMinTrophyAmount", GUICtrlRead($txtMinTrophyAmount))

	; SimpleQuicktrain - DEMEN
	If GUICtrlRead($chkSimpleQuickTrain) = $GUI_CHECKED Then
		$ichkSimpleQuickTrain = 1
	Else
		$ichkSimpleQuickTrain = 0
	EndIf
	IniWriteS($config, "troop", "SimpleQuickTrain", $ichkSimpleQuickTrain)

	If GUICtrlRead($chkFillArcher) = $GUI_CHECKED Then
		$ichkFillArcher = 1
	Else
		$ichkFillArcher = 0
	EndIf
	IniWriteS($config, "troop", "ChkFillArcher", $ichkFillArcher)

	$iFillArcher = GUICtrlRead($txtFillArcher)
	IniWriteS($config, "troop", "FillArcher", GUICtrlRead($txtFillArcher))

	If GUICtrlRead($chkFillEQ) = $GUI_CHECKED Then
		$ichkFillEQ = 1
	Else
		$ichkFillEQ = 0
	EndIf
	IniWriteS($config, "troop", "FillEQ", $ichkFillEQ)

	If GUICtrlRead($chkTrainDonated) = $GUI_CHECKED Then
		$ichkTrainDonated = 1
	Else
		$ichkTrainDonated = 0
	EndIf
	IniWriteS($config, "troop", "TrainDonated", $ichkTrainDonated)

	; Clan Hop Setting
	If GUICtrlRead($chkClanHop) = $GUI_CHECKED Then
		IniWrite($config, "Others", "ClanHop", 1)
	Else
		IniWrite($config, "Others", "ClanHop", 0)
	EndIf

    ; Forecast Added by rulesss
	IniWrite($config, "forecast", "txtForecastBoost", GUICtrlRead($txtForecastBoost))

	If GUICtrlRead($chkForecastBoost) = $GUI_CHECKED Then
		IniWrite($config, "forecast", "chkForecastBoost", 1)
	Else
		IniWrite($config, "forecast", "chkForecastBoost", 0)
	EndIf

	If GUICtrlRead($chkForecastHopingSwitchMax) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkForecastHopingSwitchMax", 1)
	Else
		IniWrite($config, "profiles", "chkForecastHopingSwitchMax", 0)
	EndIf
	IniWrite($config, "profiles", "cmbForecastHopingSwitchMax", _GUICtrlComboBox_GetCurSel($cmbForecastHopingSwitchMax))
	IniWrite($config, "profiles", "txtForecastHopingSwitchMax", GUICtrlRead($txtForecastHopingSwitchMax))

	If GUICtrlRead($chkForecastHopingSwitchMin) = $GUI_CHECKED Then
		IniWrite($config, "profiles", "chkForecastHopingSwitchMin", 1)
	Else
		IniWrite($config, "profiles", "chkForecastHopingSwitchMin", 0)
	EndIf
	IniWrite($config, "profiles", "cmbForecastHopingSwitchMin", _GUICtrlComboBox_GetCurSel($cmbForecastHopingSwitchMin))
	IniWrite($config, "profiles", "txtForecastHopingSwitchMin", GUICtrlRead($txtForecastHopingSwitchMin))

	; Added Multi Switch Language by rulesss and Kychera
	$icmbSwLang = _GUICtrlComboBox_GetCurSel($cmbSwLang)
    IniWriteS($config, "Lang", "cmbSwLang", $icmbSwLang)
