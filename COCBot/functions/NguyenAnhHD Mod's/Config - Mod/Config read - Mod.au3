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
		$ichkSwitchAcc = IniRead($profile, "Switch Account", "Enable", "0")
		$ichkTrain = IniRead($profile, "Switch Account", "Train", "0")
		$icmbTotalCoCAcc = IniRead($profile, "Switch Account", "Total Coc Account", "0")	; 0 = AutoDetect
		$ichkSmartSwitch = IniRead($profile, "Switch Account", "Smart Switch", "1")
		$ichkCloseTraining = Number(IniRead($profile, "Switch Account", "Sleep Combo", "0"))	; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep

		$ProfileType = IniRead($config, "Switch Account", "Profile Type", "")
		$MatchProfileAcc = IniRead($config, "Switch Account", "Match Profile Acc", "")

		For $i = 1 to 6
			IniReadS($aAccPosY[$i - 1], $profile, "Acc Location", "yAccNo." & $i, "-1")
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
		$icmbCSVSpeed[$LB] = IniRead($config, "DeploymentSpeed", "LB", "2")
		$icmbCSVSpeed[$DB] = IniRead($config, "DeploymentSpeed", "DB", "2")
