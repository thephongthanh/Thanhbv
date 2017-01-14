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

	Setlog(" »» Simple Quick Train")

	Local $CheckTroop[4] = [810, 186, 0xCFCFC8, 15] ; the gray background

	If $Runstate = False Then Return

	If IsTrainPage() And ISArmyWindow(False, $TrainTroopsTAB) = False Then OpenTrainTabNumber($TrainTroopsTAB)
	If _Sleep(500) Then Return
	If ISArmyWindow(True, $TrainTroopsTAB) = False Then Return

	Local $ArmyCamp = GetOCRCurrent(48, 160)

	If $ichkFillArcher = 1 Then
		$iFillArcher = GUICtrlRead($txtFillArcher)
	Else
		$iFillArcher = 0
	EndIf

	Switch $ArmyCamp[0] - $ArmyCamp[1]
		Case -$ArmyCamp[1] To -$iFillArcher-1
			SetLog(" »» Not Full Troop Camp")
			If _Sleep(500) Then Return

		Case -$iFillArcher To 0
			If $ArmyCamp[0] - $ArmyCamp[1] < 0 Then
				SetLog(" »» Fill some Archers")
				Local $ArchToMake = $ArmyCamp[1] - $ArmyCamp[0]
				If ISArmyWindow(False, $TrainTroopsTAB) Then TrainIt($eArch, $ArchToMake, 500)
				SetLog(" » Trained " & $ArchToMake & " archer(s)!")
				If _Sleep(500) Then Return
			Else
				SetLog(" »» Zero Queued")
				If _Sleep(500) Then Return
			EndIf

		Case 1 To $ArmyCamp[1] - $iFillArcher - 1
			SetLog(" »» Not Full Queued. Delete Queued Troops")
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

		Case $ArmyCamp[1] -$iFillArcher To $ArmyCamp[1]
			If $ArmyCamp[0] - $ArmyCamp[1] < $ArmyCamp[1] Then
				SetLog(" »» Fill some Archers")
				Local $ArchToMake = $ArmyCamp[1]*2 - $ArmyCamp[0]
				If ISArmyWindow(False, $TrainTroopsTAB) Then TrainIt($eArch, $ArchToMake, 500)
				SetLog(" » Trained " & $ArchToMake & " archer(s)!")
				If _Sleep(500) Then Return
			Else
				SetLog(" »» Full Queued")
				If _Sleep(500) Then Return
			EndIf
	EndSwitch

	If IsTrainPage() And ISArmyWindow(False, $BrewSpellsTAB) = False Then OpenTrainTabNumber($BrewSpellsTAB)
	If _Sleep(1500) Then Return
	If ISArmyWindow(True, $BrewSpellsTAB) = False Then Return

	Local $SpellCamp = GetOCRCurrent(48, 160)

	Switch $SpellCamp[0] - $SpellCamp[1]
		Case -$SpellCamp[1] To -1
			If $ichkFillEQ = 0 OR $SpellCamp[0] - $SpellCamp[1] < -1 Then
				SetLog(" »» Not Full Spell Camp")
				If _Sleep(500) Then Return
			Else
				SetLog(" »» Fill with 1 EQ Spell")
				If ISArmyWindow(False, $BrewSpellsTAB) Then TrainIt($eESpell, 1, 500)
				SetLog(" » Brewed 1 EQ Spell!")
				If _Sleep(500) Then Return
			EndIf

		Case 0
			SetLog(" »» Full Spell Camp, Zero Queued")
			If _Sleep(500) Then Return

		Case 1 To $SpellCamp[1] - 1

			If $ichkFillEQ = 0 OR $SpellCamp[0] - $SpellCamp[1] < $SpellCamp[1] - 1 Then
				SetLog(" »» Not Full Queued, Delete Queued Spells")
				If ISArmyWindow(False, $BrewSpellsTAB) Then
					SetLog(" »» Spell Tab Open")
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
			Else
				SetLog(" »» Fill with 1 EQ Spell")
				If ISArmyWindow(False, $BrewSpellsTAB) Then TrainIt($eESpell, 1, 500)
				SetLog(" » Brewed 1 EQ Spell!")
				If _Sleep(500) Then Return
			EndIf

		Case $SpellCamp[1]
			SetLog(" »» Full Queued")
			If _Sleep(500) Then Return
	EndSwitch

	MakeQuickTrain()

EndFunc

Func MakeQuickTrain()

	Local $Num = 0
	If $iChkQuickArmy1 = 1 Then $Num = 1
	If $iChkQuickArmy2 = 1 Then $Num = 2
	If $iChkQuickArmy3 = 1 Then $Num = 3
	OpenTrainTabNumber($QuickTrainTAB)
	If _Sleep(1000) Then Return
	If $Num > 0 Then
		TrainArmyNumber($Num)
	Else
		Setlog(" » Quick Train Combo Army")
		If $Runstate = False Then Return
		If ISArmyWindow(True, $QuickTrainTAB) Then
			For $i = 1 to 3
				Setlog(" » TrainArmy Number: " & $i, $COLOR_ORANGE)
				Click(817, 248 + 118*$i)
				If $i = 2 And GUICtrlRead($hRadio_Army12)  = $GUI_CHECKED Then ExitLoop
			Next
		Else
			Setlog(" » Error Clicking On Army! You are not on Quick Train Window", $COLOR_RED)
		EndIf
	EndIf
	ClickP($aAway, 2, 0, "#0346") ;Click Away

EndFunc
