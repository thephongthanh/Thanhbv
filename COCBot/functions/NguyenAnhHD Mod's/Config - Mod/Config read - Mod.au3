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
#cs
		;Treasury Collect
		$ichkCollectTresory = IniRead($config, "other", "CollectTresory", "0")
		$itxtTreasuryGold = IniRead($config, "other", "treasuryGold", "0")
		$itxtTreasuryElixir = IniRead($config, "other", "treasuryElixir", "0")
		$itxtTreasuryDark = IniRead($config, "other", "treasuryDark", "0")
		$ichkCollectTresoryGold = IniRead($config, "other", "CollectTresoryGold", "0")
		$ichkCollectTresoryElixir = IniRead($config, "other", "CollectTresoryElixir", "0")
		$ichkCollectTresoryDark = IniRead($config, "other", "CollectTresoryDark", "0")
		$ichkTRFull = IniRead($config, "other", "chkTRFull", "0")

		; Smart Upgrade
		$ichkSmartUpgrade = IniRead($config, "upgrade", "chkSmartUpgrade", "0")
		$ichkIgnoreTH = IniRead($config, "upgrade", "chkIgnoreTH", "0")
		$ichkIgnoreKing = IniRead($config, "upgrade", "chkIgnoreKing", "0")
		$ichkIgnoreQueen = IniRead($config, "upgrade", "chkIgnoreQueen", "0")
		$ichkIgnoreWarden = IniRead($config, "upgrade", "chkIgnoreWarden", "0")
		$ichkIgnoreCC = IniRead($config, "upgrade", "chkIgnoreCC", "0")
		$ichkIgnoreLab = IniRead($config, "upgrade", "chkIgnoreLab", "0")
		$ichkIgnoreBarrack = IniRead($config, "upgrade", "chkIgnoreBarrack", "0")
		$ichkIgnoreDBarrack = IniRead($config, "upgrade", "chkIgnoreDBarrack", "0")
		$ichkIgnoreFactory = IniRead($config, "upgrade", "chkIgnoreFactory", "0")
		$ichkIgnoreDFactory = IniRead($config, "upgrade", "chkIgnoreDFactory", "0")
		$ichkIgnoreGColl = IniRead($config, "upgrade", "chkIgnoreGColl", "0")
		$ichkIgnoreEColl = IniRead($config, "upgrade", "chkIgnoreEColl", "0")
		$ichkIgnoreDColl = IniRead($config, "upgrade", "chkIgnoreDColl", "0")
		$iSmartMinGold = IniRead($config, "upgrade", "SmartMinGold", "0")
		$iSmartMinElixir = IniRead($config, "upgrade", "SmartMinElixir", "0")
		$iSmartMinDark = IniRead($config, "upgrade", "SmartMinDark", "0")
#ce