; #FUNCTION# ====================================================================================================================
; Name ..........: SmartQuickTrain
; Description ...: This file contains the Sequence that runs all MBR Bot
; Author ........: DEMEN
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SimpleQuickTrain()

	Setlog("Simple Quick Train")

	IsWaitingForConnection()

	Local $CheckTroop[4] = [810, 186, 0xCFCFC8, 15] ; the gray background
	Local $CheckTroop1[4] = [390, 130, 0x78BE2B, 15] ; the Green Arrow on Troop Training tab

	If $Runstate = False Then Return

	If IsTrainPage() And ISArmyWindow(False, $TrainTroopsTAB) = False Then OpenTrainTabNumber($TrainTroopsTAB)
	If _Sleep(250) Then Return
	If ISArmyWindow(True, $TrainTroopsTAB) = False Then Return

	Local $ArmyCamp = GetOCRCurrent(48, 160)

	Switch $ArmyCamp[0] - $ArmyCamp[1]
		Case -$ArmyCamp[1] To -6
			SetLog(" »» Not full camp")
			If _Sleep(500) Then Return

		Case -5 To -1
			SetLog(" »» Fill some archers")
			Local $ArchToMake = $ArmyCamp[1] - $ArmyCamp[0]
			If ISArmyWindow(False, $TrainTroopsTAB) Then PureClick($TrainArch[0], $TrainArch[1], $ArchToMake, 500)
			SetLog(" » Trained " & $ArchToMake & " archer(s)!")
			If _Sleep(500) Then Return

		Case 0
			SetLog(" »» Zero queue")

		Case 1 To $ArmyCamp[1] - 6
			SetLog(" »» Delete excessive queued troops")
			If ISArmyWindow(False, $TrainTroopsTAB) Then
				For $i = 0 To 11
					If _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False Then
						Local $x = 0
						While _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False
							If _Sleep(20) Then Return
							If $Runstate = False Then Return
							PureClick($CheckTroop[0] - $i*70, 202, 2, 50)
							$x += 1
							If $x = 250 Then ExitLoop
						WEnd
						ExitLoop
					EndIf
				Next
			EndIf
			If _Sleep(500) Then Return

		Case $ArmyCamp[1] - 5 To $ArmyCamp[1] - 1
			SetLog(" »» Fill some archers")
			Local $ArchToMake = $ArmyCamp[1]*2 - $ArmyCamp[0]
			If ISArmyWindow(False, $TrainTroopsTAB) Then PureClick($TrainArch[0], $TrainArch[1], $ArchToMake, 500)
			SetLog(" » Trained " & $ArchToMake & " archer(s)!")
			If _Sleep(500) Then Return

	EndSwitch


	If IsTrainPage() And ISArmyWindow(False, $BrewSpellsTAB) = False Then OpenTrainTabNumber($BrewSpellsTAB)
	If _Sleep(250) Then Return
	If ISArmyWindow(True, $BrewSpellsTAB) = False Then Return

	Local $SpellCamp = GetOCRCurrent(48, 160)

	Switch $SpellCamp[0] - $SpellCamp[1]
		Case -$SpellCamp[1] To -2
			SetLog(" »» Not full camp")
			If _Sleep(500) Then Return

		Case -1
			SetLog(" »» Fill with 1 poison")
			If ISArmyWindow(False, $BrewSpellsTAB) Then PureClick($TrainPSpell[0], $TrainPSpell[1], 1, 500)
			SetLog(" » Trained 1 poison!")
			If _Sleep(500) Then Return

		Case 0
			SetLog(" »» Zero queue")

		Case 1 To $SpellCamp[1] - 2
			SetLog(" »» Delete excessive queued spells")
			If ISArmyWindow(False, $BrewSpellsTAB) Then
				SetLog(" »» Spell Tab open")
				For $i = 0 To 11
					If _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False Then
						Local $x = 0
						While _ColorCheck(_GetPixelColor($CheckTroop[0] - $i*70, $CheckTroop[1], True), Hex($CheckTroop[2], 6), $CheckTroop[3]) = False
							If _Sleep(20) Then Return
							If $Runstate = False Then Return
							PureClick($CheckTroop[0] - $i*70, 202, 2, 50)
							$x += 1
							If $x = 22 Then ExitLoop
						WEnd
						ExitLoop
					EndIf
				Next
			EndIf

		Case $SpellCamp[1] - 1
			SetLog(" »» Fill with 1 poison")
			If ISArmyWindow(False, $BrewSpellsTAB) Then PureClick($TrainPSpell[0], $TrainPSpell[1], 1, 500)
			SetLog(" » Trained 1 poison!")
			If _Sleep(500) Then Return

	EndSwitch

	MakeQuickTrain()

EndFunc

Func MakeQuickTrain()
	If IsTrainPage() And ISArmyWindow(False, $ArmyTAB) Then
		OpenArmyWindow()
		If _Sleep(500) Then Return
	EndIf
	Local $Num = 0
	Local $Num2 = 0									;============= Adding QuickTrainCombo - DEMEN
	Local $Num3 = 0									;============= Adding QuickTrainCombo - DEMEN
	If GUICtrlRead($hRadio_Army1) = $GUI_CHECKED Then $Num = 1
	If GUICtrlRead($hRadio_Army2) = $GUI_CHECKED Then $Num = 2
	If GUICtrlRead($hRadio_Army3) = $GUI_CHECKED Then $Num = 3
	If GUICtrlRead($hRadio_Army12) = $GUI_CHECKED Then			;============= Adding QuickTrainCombo - DEMEN
		$Num = 1
		$Num2 = 2
	EndIf
	If GUICtrlRead($hRadio_Army123) = $GUI_CHECKED Then			;============= Adding QuickTrainCombo - DEMEN
		$Num = 1
		$Num2 = 2
		$Num3 = 3
	EndIf

		OpenTrainTabNumber($QuickTrainTAB)
		If _Sleep(1000) Then Return
		TrainArmyNumber($Num)
		If $Num2 = 2 Then TrainArmyNumber($Num2)				;============= Adding QuickTrainCombo - DEMEN
		If $Num3 = 3 Then TrainArmyNumber($Num3)				;============= Adding QuickTrainCombo - DEMEN

		If _Sleep(700) Then Return

		ClickP($aAway, 2, 0, "#0346") ;Click Away
		If _Sleep(250) Then Return

EndFunc
