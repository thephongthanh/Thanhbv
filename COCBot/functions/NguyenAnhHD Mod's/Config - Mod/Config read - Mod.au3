; #FUNCTION# ====================================================================================================================
; Name ..........: Config read - Mod.au3
; Description ...: Extension of readConfig() for Mod
; Syntax ........: readConfig()
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
		$iMultiFingerStyle = IniRead($config, "MultiFinger", "Select", "2")

		; Config Read for SwitchAcc Mode - DEMEN
		IniReadS($ichkSwitchAcc, $profile, "Switch Account", "Enable", "0")
		$ichkTrain = IniRead($profile, "Switch Account", "Pre-train", "0")
		IniReadS($icmbTotalCoCAcc, $profile, "Switch Account", "Total Coc Account", "-1")
		IniReadS($ichkSmartSwitch, $profile, "Switch Account", "Smart Switch", "0")
		$ichkCloseTraining = Number(IniRead($profile, "Switch Account", "Sleep Combo", "0"))	; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep

		For $i = 0 to 7
			IniReadS($aMatchProfileAcc[$i],$profile, "Switch Account", "MatchProfileAcc." & $i+1, "-1")
			IniReadS($aProfileType[$i], $profile, "Switch Account", "ProfileType." & $i+1, "-1")
			IniReadS($aAccPosY[$i], $profile, "Switch Account", "AccLocation." & $i+1, "-1")
		Next

		; Config for Adding QuicktrainCombo - DEMEN
		IniReadS($iRadio_Army12, $config, "troop", "QuickTrain12", "0")
		IniReadS($iRadio_Army123, $config, "troop", "QuickTrain123", "0")

		; Check Collectors Outside
		$ichkDBMeetCollOutside = IniRead($config, "search", "DBMeetCollOutside", "0")
		$iDBMinCollOutsidePercent = IniRead($config, "search", "DBMinCollOutsidePercent", "50")

		; Auto Hide
		IniReadS($ichkAutoHide, $config, "general", "AutoHide", "0")
		IniReadS($ichkAutoHideDelay, $config, "general", "AutoHideDelay", "10")

		; CSV Deployment Speed Mod
		IniReadS($isldSelectedCSVSpeed[$DB], $config, "attack", "CSVSpeedDB", 4)
		IniReadS($isldSelectedCSVSpeed[$LB], $config, "attack", "CSVSpeedAB", 4)

		; Don't Remove Troops
		$ichkDontRemoveTroops = IniRead($config, "MOD", "DontRemoveTroops", "0")
