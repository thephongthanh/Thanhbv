; #FUNCTION# ====================================================================================================================
; Name ..........: UpgradeWall
; Description ...: This file checks if enough resources to upgrade walls, and upgrades them
; Syntax ........: UpgradeWall()
; Parameters ....:
; Return values .: None
; Author ........: ProMac (2015), HungLe (2015)
; Modified ......: Sardo 2015-08, KnowJack (Aug 2105), MonkeyHunter(06-2016) , trlopes ( 2016 )
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: checkwall.au3
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func UpgradeWall()

	If $g_bAutoUpgradeWallsEnable = True Then
		SetLog("Checking Upgrade Walls", $COLOR_INFO)
		If SkipWallUpgrade() Then Return
		If $iFreeBuilderCount > 0 Then
			ClickP($aAway, 1, 0, "#0313") ; click away
			Local $MinWallGold = Number($iGoldCurrent - $g_iWallCost) > Number($g_iUpgradeWallMinGold) ; Check if enough Gold
			Local $MinWallElixir = Number($iElixirCurrent - $g_iWallCost) > Number($g_iUpgradeWallMinElixir) ; Check if enough Elixir

			Switch $g_iUpgradeWallLootType
				Case 0
					If $MinWallGold Then
						SetLog("Upgrading Wall using Gold", $COLOR_SUCCESS)
						If imglocCheckWall() Then UpgradeWallGold()
					Else
						SetLog("Gold is below minimum, Skipping Upgrade", $COLOR_ERROR)
					EndIf
				Case 1
					If $MinWallElixir Then
						Setlog("Upgrading Wall using Elixir", $COLOR_SUCCESS)
						If imglocCheckWall() Then UpgradeWallElixir()
					Else
						Setlog("Elixir is below minimum, Skipping Upgrade", $COLOR_ERROR)
					EndIf
				Case 2
					If $MinWallElixir Then
						SetLog("Upgrading Wall using Elixir", $COLOR_SUCCESS)
						If imglocCheckWall() And Not UpgradeWallElixir() Then
							SetLog("Upgrade with Elixir failed, attempt to upgrade using Gold", $COLOR_ERROR)
							UpgradeWallGold()
						EndIf
					Else
						SetLog("Elixir is below minimum, attempt to upgrade using Gold", $COLOR_ERROR)
						If $MinWallGold Then
							If imglocCheckWall() Then UpgradeWallGold()
						Else
							Setlog("Gold is below minimum, Skipping Upgrade", $COLOR_ERROR)
						EndIf
					EndIf
			EndSwitch

			; Check Builder/Shop if open by accident
			If _CheckPixel($g_aShopWindowOpen, $g_bCapturePixel, Default, "ChkShopOpen", $COLOR_DEBUG) = True Then
				Click(820, 40, 1, 0, "#0315") ; Close it
			EndIf

			ClickP($aAway, 1, 0, "#0314") ; click away
			If _Sleep(100) Then Return

		Else
			SetLog("No free builder, Upgrade Walls skipped..", $COLOR_ERROR)
		EndIf
	EndIf
	If _Sleep($iDelayUpgradeWall1) Then Return
	checkMainScreen(False) ; Check for errors during function

EndFunc   ;==>UpgradeWall


Func UpgradeWallGold()

	;Click($WallxLOC, $WallyLOC)
	If _Sleep($iDelayRespond) Then Return

	Local $offColors[3][3] = [[0xD6714B, 47, 37], [0xF0E850, 70, 0], [0xF4F8F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563 + $g_iBottomOffsetY, 670, 650 + $g_iBottomOffsetY, 1, 1, Hex(0xF3F3F1, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		If $g_iDebugSetlog = 1 Then
			Setlog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_DEBUG) ;Debug
			Setlog("Color #1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 47, $ButtonPixel[1] + 37, True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 70, $ButtonPixel[1], True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 79, $ButtonPixel[1], True), $COLOR_DEBUG)
		EndIf
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20, 1, 0, "#0316") ; Click Upgrade Gold Button
		If _Sleep($iDelayUpgradeWallGold2) Then Return

		If _ColorCheck(_GetPixelColor(677, 150 + $g_iMidOffsetY, True), Hex(0xE1090E, 6), 20) Then ; wall upgrade window red x
			If isNoUpgradeLoot(False) = True Then
				SetLog("Upgrade stopped due no loot", $COLOR_ERROR)
				Return False
			EndIf
			If GemClick(440, 480 + $g_iMidOffsetY, 1, 0, "#0317") = False Then
				SetLog("Upgrade stopped due no loot", $COLOR_ERROR)
				Return False
			Else
				If _Sleep($iDelayUpgradeWallGold3) Then Return
				SetLog("Upgrade complete", $COLOR_SUCCESS)
				PushMsg("UpgradeWithGold")
				$iNbrOfWallsUppedGold += 1
				$iNbrOfWallsUpped += 1
				$iCostGoldWall += $g_iWallCost
				UpdateStats()
				Return True
			EndIf
		EndIf
	Else
		Setlog("No Upgrade Gold Button", $COLOR_ERROR)
		Pushmsg("NowUpgradeGoldButton")
		Return False
	EndIf

EndFunc   ;==>UpgradeWallGold

Func UpgradeWallElixir()

	;Click($WallxLOC, $WallyLOC)
	If _Sleep($iDelayRespond) Then Return

	Local $offColors[3][3] = [[0xBC5B31, 38, 32], [0xF84CF9, 72, 0], [0xF5F9F2, 79, 0]] ; 2nd pixel brown hammer, 3rd pixel gold, 4th pixel edge of button
	Global $ButtonPixel = _MultiPixelSearch(240, 563 + $g_iBottomOffsetY, 670, 650 + $g_iBottomOffsetY, 1, 1, Hex(0xF4F7F2, 6), $offColors, 30) ; first gray/white pixel of button
	If IsArray($ButtonPixel) Then
		Click($ButtonPixel[0] + 20, $ButtonPixel[1] + 20, 1, 0, "#0322") ; Click Upgrade Elixir Button

		If _Sleep($iDelayUpgradeWallElixir2) Then Return
		If _ColorCheck(_GetPixelColor(677, 150 + $g_iMidOffsetY, True), Hex(0xE1090E, 6), 20) Then
			If isNoUpgradeLoot(False) = True Then
				SetLog("Upgrade stopped due to insufficient loot", $COLOR_ERROR)
				Return False
			EndIf
			If GemClick(440, 480 + $g_iMidOffsetY, 1, 0, "#0318") = False Then
				SetLog("Upgrade stopped due to insufficient loot", $COLOR_ERROR)
				Return False
			Else
				If _Sleep($iDelayUpgradeWallElixir3) Then Return
				SetLog("Upgrade complete", $COLOR_SUCCESS)
				PushMsg("UpgradeWithElixir")
				$iNbrOfWallsUppedElixir += 1
				$iNbrOfWallsUpped += 1
				$iCostElixirWall += $g_iWallCost
				UpdateStats()
				Return True
			EndIf
		EndIf
	Else
		Setlog("No Upgrade Elixir Button", $COLOR_ERROR)
		Pushmsg("NowUpgradeElixirButton")
		Return False
	EndIf

EndFunc   ;==>UpgradeWallElixir

Func SkipWallUpgrade() ; Dynamic Upgrades

;	If _Sleep(500) Then Return
;	checkMainScreen(False)
;	If $g_bRestart = True Then Return
;	 $g_iUpgradeWallLootType = IniRead($g_sProfileConfigPath, "other", "use-storage", "0") ; Reset Variable to User Selection
	InireadS($g_iUpgradeWallLootType,$g_sProfileConfigPath, "upgrade", "use-storage", "0") ; Reset Variable to User Selection

	Local $iUpgradeAction = 0
	Local $iBuildingsNeedGold = 0
	Local $iBuildingsNeedElixir = 0
	Local $iAvailBuilderCount = 0

	If getBuilderCount() = False Then Return True ; update builder data, return true to skip if problem
	If _Sleep($iDelayRespond) Then Return True

	$iAvailBuilderCount = $iFreeBuilderCount ; capture local copy of free builders

	;;;;; Check building upgrade resouce needs .vs. available resources for walls
	For $iz = 0 To UBound($g_avBuildingUpgrades, 1) - 1  ; loop through all upgrades to see if any are enabled.
		If $g_abBuildingUpgradeEnable[$iz] = True Then $iUpgradeAction += 1  ; count number enabled
	Next
	If $iFreeBuilderCount > ($g_bUpgradeWallSaveBuilder ? 1 : 0) And $iUpgradeAction > 0 Then  ; check if builder available for bldg upgrade, and upgrades enabled
		For $iz = 0 To UBound($g_avBuildingUpgrades, 1) - 1
			; internal check if builder still available, if loop index upgrade slot is enabled, and if repeat upgrade is done/ready for next upgrade
			If $iAvailBuilderCount > ($g_bUpgradeWallSaveBuilder ? 1 : 0) And $g_abBuildingUpgradeEnable[$iz] = True And ($g_avBuildingUpgrades[$iz][7] = "" And $g_abUpgradeRepeatEnable[$iz]) Then
				Switch $g_avBuildingUpgrades[$iz][3]
					Case "Gold"
						$iBuildingsNeedGold += Number($g_avBuildingUpgrades[$iz][2])  ; sum gold required for enabled upgrade
						$iAvailBuilderCount -= 1  ; subtract builder from free count, as only need to save gold for upgrades where builder is available
					Case "Elixir"
						$iBuildingsNeedElixir += Number($g_avBuildingUpgrades[$iz][2])  ; sum elixir required for enabled upgrade
						$iAvailBuilderCount -= 1  ; subtract builder from free count, as only need to save elixir for upgrades where builder is available
				EndSwitch
			EndIf
		Next
		SetLog("SkipWall-Upgrade Summary: G:" & $iBuildingsNeedGold & ", E:" & $iBuildingsNeedElixir & ", Wall: " & $g_iWallCost & ", MinG: " & $g_iUpgradeWallMinGold  & ", MinE: " & $g_iUpgradeWallMinElixir)  ; debug
		If $iBuildingsNeedGold > 0 Or $iBuildingsNeedElixir > 0 Then  ; if upgrade enabled and building upgrade resource is required, log user messages.
			Switch $g_iUpgradeWallLootType
				Case 0 ; Using gold
					If $iGoldCurrent - ($iBuildingsNeedGold + $g_iWallCost + Number($g_iUpgradeWallMinGold)) < 0 Then
						SetLog("Skip Wall upgrade -insufficient gold for selected upgrades", $COLOR_WARNING)
						Return True
					EndIf
				Case 1 ; Using elixir
					If $iElixirCurrent - ($iBuildingsNeedElixir + $g_iWallCost + Number($g_iUpgradeWallMinElixir)) < 0 Then
						SetLog("Skip Wall upgrade - insufficient elixir for selected upgrades", $COLOR_WARNING)
						Return True
					EndIf
				Case 2 ; Using gold and elixir
					If $iGoldCurrent - ($iBuildingsNeedGold + $g_iWallCost + Number($g_iUpgradeWallMinGold)) < 0 Then
						SetLog("Wall upgrade: insufficient gold for selected upgrades", $COLOR_WARNING)
						If $iElixirCurrent - ($iBuildingsNeedElixir + $g_iWallCost + Number($g_iUpgradeWallMinElixir)) >= 0 Then
							Setlog("Using Elixir only for wall Upgrade", $COLOR_SUCCESS1)
							$g_iUpgradeWallLootType = 1
						Else
							SetLog("Skip Wall upgrade -insufficient resources for selected upgrades", $COLOR_WARNING)
							Return True
						EndIf
					EndIf
					If $iElixirCurrent - ($iBuildingsNeedElixir + $g_iWallCost + Number($g_iUpgradeWallMinElixir)) < 0 Then
						SetLog("Wall upgrade: insufficient elixir for selected upgrades", $COLOR_WARNING)
						If $iGoldCurrent - ($iBuildingsNeedGold + $g_iWallCost + Number($g_iUpgradeWallMinGold)) >= 0 Then
							Setlog("Using Gold only for wall Upgrade", $COLOR_SUCCESS1)
							$g_iUpgradeWallLootType = 0
						Else
							SetLog("Skip Wall upgrade -insufficient resources for selected upgrades", $COLOR_WARNING)
							Return True
						EndIf
					EndIf
			EndSwitch
		EndIf
		If _Sleep($iDelayRespond) Then Return True
	EndIf
	;;;;;;;;;;;;;;;;;;;;;;;;;;;End bldg upgrade value checking

	;;;;;;;;;;;;;;;;;;;;;;;;;;;##### Verify the Upgrade troop kind in Laboratory , if is elixir Spell/Troop , the Lab have priority #####;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Local $bMinWallElixir = Number($iElixirCurrent) > ($g_iWallCost + Number($iLaboratoryElixirCost) + Number($g_iUpgradeWallMinElixir)) ; Check if enough Elixir
	If $g_bAutoLabUpgradeEnable = True And $g_iCmbLaboratory >= 1 And $g_iCmbLaboratory <= 18 And $bMinWallElixir = False Then
		For $i = 1 To 18
			If $g_iCmbLaboratory = $i Then
				Local $sName = $aLabTroops[$i][3]
				ExitLoop
			EndIf
		Next
		Local $LabElixirNeeded = $iLaboratoryElixirCost
		If  $LabElixirNeeded = 0 Then  $LabElixirNeeded = "unknown" ; trap error condition of unknown value
		Switch $g_iUpgradeWallLootType
			Case 0 ; Using gold
				; do nothing
			Case 1 ; Using elixir
				Setlog("Laboratory needs " & $LabElixirNeeded & " Elixir to Upgrade:  " & $sName, $COLOR_SUCCESS1)
				Setlog("Skipping Wall Upgrade", $COLOR_SUCCESS1)
				Return True
			Case 2 ; Using gold and elixir
				Setlog("Laboratory needs " & $LabElixirNeeded & " Elixir to Upgrade:  " & $sName, $COLOR_SUCCESS1)
				Setlog("Using Gold only for wall Upgrade  ", $COLOR_SUCCESS1)
				$g_iUpgradeWallLootType = 0
		EndSwitch
	EndIf

EndFunc   ;==>SkipWallUpgrade
