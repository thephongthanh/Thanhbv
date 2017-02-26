; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015), CodeSlinger69 [2017]
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Func cmbDBGoldElixir()
	If _GUICtrlComboBox_GetCurSel($g_hCmbDBMeetGE) < 2 Then
		GUICtrlSetState($g_hTxtDBMinGold, $GUI_SHOW)
		GUICtrlSetState($g_hPicDBMinGold, $GUI_SHOW)
		GUICtrlSetState($g_hTxtDBMinElixir, $GUI_SHOW)
		GUICtrlSetState($g_hPicDBMinElixir, $GUI_SHOW)
		GUICtrlSetState($g_hTxtDBMinGoldPlusElixir, $GUI_HIDE)
		GUICtrlSetState($g_hPicDBMinGPEGold, $GUI_HIDE)
	Else
		GUICtrlSetState($g_hTxtDBMinGold, $GUI_HIDE)
		GUICtrlSetState($g_hPicDBMinGold, $GUI_HIDE)
		GUICtrlSetState($g_hTxtDBMinElixir, $GUI_HIDE)
		GUICtrlSetState($g_hPicDBMinElixir, $GUI_HIDE)
		GUICtrlSetState($g_hTxtDBMinGoldPlusElixir, $GUI_SHOW)
		GUICtrlSetState($g_hPicDBMinGPEGold, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbDBGoldElixir

Func chkDBMeetDE()
	_GUICtrlEdit_SetReadOnly($g_hTxtDBMinDarkElixir, GUICtrlRead($g_hChkDBMeetDE) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkDBMeetDE

Func chkDBMeetTrophy()
	_GUICtrlEdit_SetReadOnly($g_hTxtDBMinTrophy, GUICtrlRead($g_hChkDBMeetTrophy) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkDBMeetTrophy

Func chkDBMeetTH()
	GUICtrlSetState($g_hCmbDBTH, GUICtrlRead($g_hChkDBMeetTH) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkDBMeetTH

Func chkDBWeakBase()
	GUICtrlSetState($g_ahCmbWeakMortar[$DB], GUICtrlRead($g_ahChkMaxMortar[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakWizTower[$DB], GUICtrlRead($g_ahChkMaxWizTower[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakAirDefense[$DB], GUICtrlRead($g_ahChkMaxAirDefense[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakXBow[$DB], GUICtrlRead($g_ahChkMaxXBow[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakInferno[$DB], GUICtrlRead($g_ahChkMaxInferno[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakEagle[$DB], GUICtrlRead($g_ahChkMaxEagle[$DB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkDBWeakBase

Func cmbABGoldElixir()
	If _GUICtrlComboBox_GetCurSel($g_hCmbABMeetGE) < 2 Then
		GUICtrlSetState($g_hTxtABMinGold, $GUI_SHOW)
		GUICtrlSetState($g_hPicABMinGold, $GUI_SHOW)
		GUICtrlSetState($g_hTxtABMinElixir, $GUI_SHOW)
		GUICtrlSetState($g_hPicABMinElixir, $GUI_SHOW)
		GUICtrlSetState($g_hTxtABMinGoldPlusElixir, $GUI_HIDE)
		GUICtrlSetState($g_hPicABMinGPEGold, $GUI_HIDE)
	Else
		GUICtrlSetState($g_hTxtABMinGold, $GUI_HIDE)
		GUICtrlSetState($g_hPicABMinGold, $GUI_HIDE)
		GUICtrlSetState($g_hTxtABMinElixir, $GUI_HIDE)
		GUICtrlSetState($g_hPicABMinElixir, $GUI_HIDE)
		GUICtrlSetState($g_hTxtABMinGoldPlusElixir, $GUI_SHOW)
		GUICtrlSetState($g_hPicABMinGPEGold, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbABGoldElixir

Func chkABMeetDE()
	_GUICtrlEdit_SetReadOnly($g_hTxtABMinDarkElixir, GUICtrlRead($g_hChkABMeetDE) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkABMeetDE

Func chkABMeetTrophy()
	_GUICtrlEdit_SetReadOnly($g_hTxtABMinTrophy, GUICtrlRead($g_hChkABMeetTrophy) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkABMeetTrophy

Func chkABMeetTH()
	GUICtrlSetState($g_hCmbABTH, GUICtrlRead($g_hChkABMeetTH) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkABMeetTH

Func chkABWeakBase()
	GUICtrlSetState($g_ahCmbWeakMortar[$LB], GUICtrlRead($g_ahChkMaxMortar[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakWizTower[$LB], GUICtrlRead($g_ahChkMaxWizTower[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakAirDefense[$LB], GUICtrlRead($g_ahChkMaxAirDefense[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakXBow[$LB], GUICtrlRead($g_ahChkMaxXBow[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakInferno[$LB], GUICtrlRead($g_ahChkMaxInferno[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
	GUICtrlSetState($g_ahCmbWeakEagle[$LB], GUICtrlRead($g_ahChkMaxEagle[$LB]) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkABWeakBase

Func chkRestartSearchLimit()
	GUICtrlSetState($g_hTxtRestartSearchlimit, GUICtrlRead($g_hChkRestartSearchLimit) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkRestartSearchLimit


Func btnConfigureCollectors()
;~ 	OpenGUI2()
EndFunc   ;==>btnConfigureCollectors

Func btnConfigureReduction()
;~ 	OpenGUISearchReduction()
EndFunc   ;==>btnConfigureReduction

Func btnConfigureTHBully()
;~ 	OpenGUITHBully()
EndFunc   ;==>btnConfigureTHBully

Func btnConfigureDBWeakBase()
;~ 	OpenGUIWeakbase($DB)
EndFunc   ;==>btnConfigureDBWeakBase

Func btnConfigureABWeakBase()
;~ 	OpenGUIWeakbase($LB)
EndFunc   ;==>btnConfigureABWeakBase

Func chkDBActivateSearches()
	If GUICtrlRead($g_hChkDBActivateSearches) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtDBSearchesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblDBSearches, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtDBSearchesMax, $GUI_ENABLE)
		;DBPanel($GUI_SHOW)
		;_GUI_Value_STATE("SHOW", $groupSearchDB)
		;cmbDBGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosDB)
	Else
		GUICtrlSetState($g_hTxtDBSearchesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblDBSearches, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtDBSearchesMax, $GUI_DISABLE)
		;DBPanel($GUI_HIDE)
		;_GUI_Value_STATE("HIDE", $groupSearchDB)
		;_GUI_Value_STATE("HIDE", $groupHerosDB)
	EndIf
	;EnableSearchPanels($DB)
	dbCheckall()
EndFunc   ;==>chkDBActivateSearches

Func chkDBActivateTropies()
	If GUICtrlRead($g_hChkDBActivateTropies) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtDBTropiesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblDBTropies, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtDBTropiesMax, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchDB)
		;cmbDBGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosDB)
	Else
		GUICtrlSetState($g_hTxtDBTropiesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblDBTropies, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtDBTropiesMax, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchDB)
		;_GUI_Value_STATE("HIDE", $groupHerosDB)
	EndIf
	;EnableSearchPanels($DB)
	dbCheckall()
EndFunc   ;==>chkDBActivateTropies

Func chkDBActivateCamps()
	If GUICtrlRead($g_hChkDBActivateCamps) = $GUI_CHECKED Then
		GUICtrlSetState($g_hLblDBArmyCamps, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtDBArmyCamps, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchDB)
		;cmbDBGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosDB)
	Else
		GUICtrlSetState($g_hLblDBArmyCamps, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtDBArmyCamps, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchDB)
		;_GUI_Value_STATE("HIDE", $groupHerosDB)
	EndIf
	;EnableSearchPanels($DB)
	dbCheckall()
EndFunc   ;==>chkDBActivateCamps

Func EnableSearchPanels($mode)
	;_GUI_Value_STATE("HIDE", $groupAttackDBSpell&"#"&$groupIMGAttackDBSpell&"#"&$groupAttackABSpell&"#"&$groupIMGAttackABSpell)
	Switch $mode
		Case $DB
			If GUICtrlRead($g_hChkDBActivateSearches) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBActivateTropies) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBActivateCamps) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBKingWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBQueenWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBWardenWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkDBSpellsWait) = $GUI_CHECKED Then
				_GUI_Value_STATE("SHOW", $groupHerosDB)
				;search
				_GUI_Value_STATE("SHOW", $groupSearchDB)
				;spells
				_GUI_Value_STATE("SHOW", $groupSpellsDB)

				cmbDBGoldElixir()
				;attack
				;_GUI_Value_STATE("SHOW", $groupAttackDB)
				;_GUI_Value_STATE("SHOW", $groupIMGAttackDB)
				;end battle
				;_GUI_Value_STATE("SHOW", $groupEndBattkeDB)
				;cmbDBAlgorithm()
			Else
				_GUI_Value_STATE("HIDE", $groupHerosDB)
				;search
				_GUI_Value_STATE("HIDE", $groupSearchDB)
				;attack

				;Spells
				_GUI_Value_STATE("HIDE", $groupSpellsDB)

				;_GUI_Value_STATE("HIDE", $groupAttackDB)
				;_GUI_Value_STATE("HIDE", $groupIMGAttackDB)
				;end battle
				;_GUI_Value_STATE("HIDE", $groupEndBattkeDB)
			EndIf
		Case $LB
			If GUICtrlRead($g_hChkABActivateSearches) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABActivateTropies) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABActivateCamps) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABKingWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABQueenWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABWardenWait) = $GUI_CHECKED Or _
			   GUICtrlRead($g_hChkABSpellsWait) = $GUI_CHECKED Then
				_GUI_Value_STATE("SHOW", $groupHerosAB)
				;search
				_GUI_Value_STATE("SHOW", $groupSearchAB)
				;Spells
				_GUI_Value_STATE("SHOW", $groupSpellsAB)

				cmbABGoldElixir()
				;attack
				;_GUI_Value_STATE("SHOW", $groupAttackAB)
				;_GUI_Value_STATE("SHOW", $groupIMGAttackAB)
				;end battle
				;_GUI_Value_STATE("SHOW", $groupEndBattkeAB)
				;cmbABAlgorithm()
			Else
				_GUI_Value_STATE("HIDE", $groupHerosAB)
				;search
				_GUI_Value_STATE("HIDE", $groupSearchAB)
				;attack

				;Spells
				_GUI_Value_STATE("HIDE", $groupSpellsAB)

				;_GUI_Value_STATE("HIDE", $groupAttackAB)
				;_GUI_Value_STATE("HIDE", $groupIMGAttackAB)
				;end battle
				;_GUI_Value_STATE("HIDE", $groupEndBattkeAB)
			EndIf
		Case $TS
			If GUICtrlRead($g_hChkTSActivateSearches) = $GUI_CHECKED Or GUICtrlRead($g_hChkTSActivateTropies) = $GUI_CHECKED Or GUICtrlRead($g_hChkTSActivateCamps) = $GUI_CHECKED Then
				;search
				_GUI_Value_STATE("SHOW", $groupSearchTS)
				cmbTSGoldElixir()
				;attack
				;_GUI_Value_STATE("SHOW", $groupAttackTS)
				;_GUI_Value_STATE("SHOW", $groupIMGAttackTS)
				;_GUI_Value_STATE("SHOW", $groupAttackTSSpell)
				;_GUI_Value_STATE("SHOW", $groupIMGAttackTSSpell)
				;end battle
				;_GUI_Value_STATE("SHOW", $groupEndBattkeTS)
			Else
				;search
				_GUI_Value_STATE("HIDE", $groupSearchTS)
				;attack
				;_GUI_Value_STATE("HIDE", $groupAttackTS)
				;_GUI_Value_STATE("HIDE", $groupIMGAttackTS)
				;_GUI_Value_STATE("HIDE", $groupAttackTSSpell)
				;_GUI_Value_STATE("HIDE", $groupIMGAttackTSSpell)
				;end battle
				;_GUI_Value_STATE("HIDE", $groupEndBattkeTS)
			EndIf
	EndSwitch
	;tabAttack()
EndFunc   ;==>EnableSearchPanels




Func chkABActivateSearches()
	If GUICtrlRead($g_hChkABActivateSearches) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtABSearchesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblABSearches, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtABSearchesMax, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchAB)
		;cmbABGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosAB)
	Else
		GUICtrlSetState($g_hTxtABSearchesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblABSearches, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtABSearchesMax, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchAB)
		;_GUI_Value_STATE("HIDE", $groupHerosAB)
	EndIf
	;EnableSearchPanels($LB)
	abCheckall()
EndFunc   ;==>chkABActivateSearches

Func chkABActivateTropies()
	If GUICtrlRead($g_hChkABActivateTropies) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtABTropiesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblABTropies, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtABTropiesMax, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchAB)
		;cmbABGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosAB)
	Else
		GUICtrlSetState($g_hTxtABTropiesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblABTropies, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtABTropiesMax, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchAB)
		;_GUI_Value_STATE("HIDE", $groupHerosAB)
	EndIf
	;EnableSearchPanels($LB)
	abCheckall()
EndFunc   ;==>chkABActivateTropies

Func chkABActivateCamps()
	If GUICtrlRead($g_hChkABActivateCamps) = $GUI_CHECKED Then
		GUICtrlSetState($g_hLblABArmyCamps, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtABArmyCamps, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchAB)
		;cmbABGoldElixir()
		;_GUI_Value_STATE("SHOW", $groupHerosAB)
	Else
		GUICtrlSetState($g_hLblABArmyCamps, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtABArmyCamps, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchAB)
		;_GUI_Value_STATE("HIDE", $groupHerosAB)
	EndIf
	;EnableSearchPanels($LB)
	abCheckall()
EndFunc   ;==>chkABActivateCamps

Func chkTSActivateSearches()
	If GUICtrlRead($g_hChkTSActivateSearches) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtTSSearchesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblTSSearches, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtTSSearchesMax, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchTS)
		;cmbTSGoldElixir()
	Else
		GUICtrlSetState($g_hTxtTSSearchesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblTSSearches, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtTSSearchesMax, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchTS)
	EndIf
	;EnableSearchPanels($TS)
	tsCheckall()
EndFunc   ;==>chkTSActivateSearches

Func chkTSActivateTropies()
	If GUICtrlRead($g_hChkTSActivateTropies) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtTSTropiesMin, $GUI_ENABLE)
		GUICtrlSetState($g_hLblTSTropies, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtTSTropiesMax, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchTS)
		;cmbTSGoldElixir()
	Else
		GUICtrlSetState($g_hTxtTSTropiesMin, $GUI_DISABLE)
		GUICtrlSetState($g_hLblTSTropies, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtTSTropiesMax, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchTS)
	EndIf
	;EnableSearchPanels($TS)
	tsCheckAll()
EndFunc   ;==>chkTSActivateTropies

Func chkTSActivateCamps()
	If GUICtrlRead($g_hChkTSActivateCamps) = $GUI_CHECKED Then
		GUICtrlSetState($g_hLblTSArmyCamps, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtTSArmyCamps, $GUI_ENABLE)
		;_GUI_Value_STATE("SHOW", $groupSearchTS)
		;cmbTSGoldElixir()
	Else
		GUICtrlSetState($g_hLblTSArmyCamps, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtTSArmyCamps, $GUI_DISABLE)
		;_GUI_Value_STATE("HIDE", $groupSearchTS)
	EndIf
	;EnableSearchPanels($TS)
	tsCheckAll()
EndFunc   ;==>chkTSActivateCamps

Func chkDBKingWait()
	If $iTownHallLevel > 6 Or $iTownHallLevel = 0 Then ; Must be TH7 or above to have King
		If GUICtrlRead($g_hChkDBKingWait) = $GUI_CHECKED Then
			If $g_bUpgradeKingEnable = False Then
				GUICtrlSetState($g_hChkDBKingAttack, $GUI_CHECKED)
			Else
				GUICtrlSetState($g_hChkDBKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeKingEnable = False Then
				GUICtrlSetState($g_hChkDBKingWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkDBKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkDBKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkDBKingAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkDBKingWait

Func chkDBQueenWait()
	If $iTownHallLevel > 8 Or $iTownHallLevel = 0 Then ; Must be TH9 or above to have Queen
		If GUICtrlRead($g_hChkDBQueenWait) = $GUI_CHECKED Then
			If $g_bUpgradeQueenEnable = False Then
				GUICtrlSetState($g_hChkDBQueenAttack, $GUI_CHECKED)
			Else
				GUICtrlSetState($g_hChkDBQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeQueenEnable = False Then
				GUICtrlSetState($g_hChkDBQueenWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkDBQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkDBQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkDBQueenAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkDBQueenWait

Func chkDBWardenWait()
	If $iTownHallLevel > 10 Or $iTownHallLevel = 0 Then ; Must be TH11 to have warden
		If GUICtrlRead($g_hChkDBWardenWait) = $GUI_CHECKED Then
			If $g_bUpgradeWardenEnable = False Then
				GUICtrlSetState($g_hChkDBWardenAttack, $GUI_CHECKED)
				GUICtrlSetState($g_hPicDBWardenWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkDBWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeWardenEnable = False Then
				GUICtrlSetState($g_hChkDBWardenWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkDBWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkDBWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkDBWardenAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkDBWardenWait

Func chkABKingWait()
	If $iTownHallLevel > 6 Or $iTownHallLevel = 0 Then ; Must be TH7 or above to have King
		If GUICtrlRead($g_hChkABKingWait) = $GUI_CHECKED Then
			If $g_bUpgradeKingEnable = False Then
				GUICtrlSetState($g_hChkABKingAttack, $GUI_CHECKED)
			Else
				GUICtrlSetState($g_hChkABKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeKingEnable = False Then
				GUICtrlSetState($g_hChkABKingWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkABKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkABKingWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkABKingAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkABKingWait

Func chkABQueenWait()
	If $iTownHallLevel > 8 Or $iTownHallLevel = 0 Then ; Must be TH9 or above to have Queen
		If GUICtrlRead($g_hChkABQueenWait) = $GUI_CHECKED Then
			If $g_bUpgradeQueenEnable = False Then
				GUICtrlSetState($g_hChkABQueenAttack, $GUI_CHECKED)
			Else
				GUICtrlSetState($g_hChkABQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeQueenEnable = False Then
				GUICtrlSetState($g_hChkABQueenWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkABQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkABQueenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkABQueenAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkABQueenWait

Func chkABWardenWait()
	If $iTownHallLevel > 10 Or $iTownHallLevel = 0 Then ; Must be TH11 to have warden
		If GUICtrlRead($g_hChkABWardenWait) = $GUI_CHECKED Then
			If $g_bUpgradeWardenEnable = False Then
				GUICtrlSetState($g_hChkABWardenAttack, $GUI_CHECKED)
			Else
				GUICtrlSetState($g_hChkABWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		Else
			If $g_bUpgradeWardenEnable = False Then
				GUICtrlSetState($g_hChkABWardenWait, $GUI_ENABLE)
			Else
				GUICtrlSetState($g_hChkABWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
			EndIf
		EndIf
	Else
		GUICtrlSetState($g_hChkABWardenWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		GUICtrlSetState($g_hChkABWardenAttack, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
	EndIf
EndFunc   ;==>chkABWardenWait

Func chkDBWaitForCCSpell()
	If GUICtrlRead($g_hChkDBWaitForCastleSpell) = $GUI_CHECKED Then
		GUICtrlSetState($g_hCmbDBWaitForCastleSpell, $GUI_ENABLE)
		cmbDBWaitForCCSpell()
	Else
		GUICtrlSetState($g_hCmbDBWaitForCastleSpell, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtDBWaitForCastleSpell, $GUI_DISABLE)
		GUICtrlSetState($g_hCmbDBWaitForCastleSpell2, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkDBWaitForCCSpell

Func chkABWaitForCCSpell()
	If GUICtrlRead($g_hChkABWaitForCastleSpell) = $GUI_CHECKED Then
		GUICtrlSetState($g_hCmbABWaitForCastleSpell, $GUI_ENABLE)
		cmbABWaitForCCSpell()
	Else
		GUICtrlSetState($g_hCmbABWaitForCastleSpell, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtABWaitForCastleSpell, $GUI_DISABLE)
		GUICtrlSetState($g_hCmbABWaitForCastleSpell2, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABWaitForCCSpell

Func cmbDBWaitForCCSpell()
	Local $iSpellSelection = _GUICtrlComboBox_GetCurSel($g_hCmbDBWaitForCastleSpell)
	If $iSpellSelection > 0 And  $iSpellSelection < 6 Then
		GUICtrlSetState($g_hCmbDBWaitForCastleSpell2, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtDBWaitForCastleSpell, $GUI_DISABLE)
	Else
		GUICtrlSetState($g_hCmbDBWaitForCastleSpell2, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtDBWaitForCastleSpell, $GUI_ENABLE)
	EndIf
EndFunc

Func cmbABWaitForCCSpell()
	Local $iSpellSelection = _GUICtrlComboBox_GetCurSel($g_hCmbABWaitForCastleSpell)
	If $iSpellSelection > 0 And  $iSpellSelection < 6 Then
		GUICtrlSetState($g_hCmbABWaitForCastleSpell2, $GUI_DISABLE)
		GUICtrlSetState($g_hTxtABWaitForCastleSpell, $GUI_DISABLE)
	Else
		GUICtrlSetState($g_hCmbABWaitForCastleSpell2, $GUI_ENABLE)
		GUICtrlSetState($g_hTxtABWaitForCastleSpell, $GUI_ENABLE)
	EndIf
EndFunc

Func chkDBSpellsWait()
	If $iTownHallLevel > 4 Or $iTownHallLevel = 0 Then ; Must be TH5+ to have spells
		For $i = $g_hPicDBLightSpellWait To $g_hPicDBHasteSpellWait
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		If GUICtrlRead($g_hChkDBSpellsWait) = $GUI_CHECKED Then
			$g_abSearchSpellsWaitEnable[$DB] = True
			chkSpellWaitError()
			If @error Then
				GUICtrlSetState($g_hChkDBSpellsWait, $GUI_UNCHECKED)
				$g_abSearchSpellsWaitEnable[$DB] = False
				Setlog("Wait for Spells disabled due training count error", $COLOR_ERROR)
			EndIf
		Else
			$g_abSearchSpellsWaitEnable[$DB] = False
		EndIf
	Else
		GUICtrlSetState($g_hChkDBSpellsWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		For $i = $g_hPicDBLightSpellWait To $g_hPicDBHasteSpellWait
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf
EndFunc

Func chkABSpellsWait()
	If $iTownHallLevel > 4 Or $iTownHallLevel = 0 Then ; Must be TH5+ to have spells
		For $i = $g_hPicABLightSpellWait To $g_hPicABHasteSpellWait
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		If GUICtrlRead($g_hChkABSpellsWait) = $GUI_CHECKED Then
			$g_abSearchSpellsWaitEnable[$LB] = True
			chkSpellWaitError()
			If @error Then
				GUICtrlSetState($g_hChkABSpellsWait, $GUI_UNCHECKED)
				$g_abSearchSpellsWaitEnable[$LB] = False
				Setlog("Wait for Spells disabled due training count error", $COLOR_ERROR)
			EndIf
		Else
			$g_abSearchSpellsWaitEnable[$LB] = False
		EndIf
	Else
		GUICtrlSetState($g_hChkABSpellsWait, BitOR($GUI_DISABLE, $GUI_UNCHECKED))
		For $i = $g_hPicABLightSpellWait To $g_hPicABHasteSpellWait
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf
EndFunc

Func chkSpellWaitError()

	Local Static $bHaveBeenWarned = False
	Local $bErrorCondition = False
	Local $sErrorText, $sText, $MsgBox1, $MsgBox2, $MsgBox3

	; Check if spell total GUI is larger than spell count trained for wait for spells to work properly!
	If $iTotalTrainSpaceSpell > GUICtrlRead($g_hTxtTotalCountSpell) Then  ; we have an error!
		$sErrorText = GetTranslated(625,110, "Total number of trained spells exceeds total set in GUI!") & @CRLF & _
			GetTranslated(625,111, "Reduce number of trained spells,") & @CRLF & _
			GetTranslated(625,112, "OR ELSE BOT WILL NEVER ATTACK!!") & @CRLF
		$bErrorCondition = True
	Else
		Return
	EndIf

	If $bHaveBeenWarned = True And $bErrorCondition = True Then
		SetError(1)
		Return
	ElseIf $bErrorCondition = False Then
		Return
	EndIf

	Local $iCount = 0
	While 1
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0xE00000, 0xFFFF00, 12, "Comic Sans MS", 480)
		$sText = $sErrorText & @CRLF & GetTranslated(625,113,"Click YES to close this warning message") & @CRLF
		$MsgBox1 = _ExtMsgBox(48, GetTranslated(625,114,"YES, I Understand Warning|No"), GetTranslated(625,115,"Wait for Spells Warning!"), $sText, 30, $g_hFrmBot)
		Switch $MsgBox1
			Case 1
				$bHaveBeenWarned = True
				ExitLoop
			Case Else
				_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0xFFFF00 , 0xE00000, 12, "Comic Sans MS", 480)
				$stext = GetTranslated(625,116,"Sorry, must understand warning and click Yes!") & @CRLF
				$MsgBox2 = _ExtMsgBox(16, GetTranslated(625,117,"OK"), GetTranslated(625,118,"User Input Error"), $stext, 15, $g_hFrmBot)
				If $iCount = 1 And $MsgBox1 = 9 And $MsgBox2 = 9 Then ExitLoop  ; If time out on both error messages happens twice then exit loop to avoid stuck
		EndSwitch
		$iCount += 1
		If $iCount > 2 Then  ; You want to be crazy?  OK, then start the madness
			$sText = GetTranslated(625,119,"CONGRATULATIONS!!") & @CRLF & GetTranslated(625,120,"You found the secret message in Bot!") & @CRLF & _
				GetTranslated(625,121,"Can you find the randomly selected button to close this message?") & @CRLF & _
				GetTranslated(625,122, "HaHaHaHa...") & @CRLF & @CRLF & @CRLF
			Local $sFunnyText = $sText
			Local $iControl = 0
			$iCount = 1
			_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 480)
			While 1
				$MsgBox3 = _ExtMsgBox(128, "1|2|3|4|5|6|7", GetTranslated(625,123,"You are a WINNER!!"), $sFunnyText, 900, $g_hFrmBot)
				If @error Then Setlog("_ExtMsgBox error: " & @error, $COLOR_ERROR)
				If $iCount > 7 And Int($MsgBox3) = Random(1,8,1) Then
					ExitLoop
				Else
					If $iCount <= 7 Then
						$iControl = $iCount
					Else
						$iControl = $MsgBox3
					EndIf
					Switch $iControl
						Case 1
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x61FF00, 0x020028, 12, "Arial", 480)
							$sFunnyText = $sText & GetTranslated(625,124,"Sorry not that button!") & @CRLF
						Case 2
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0xDC00FF, 0x011E00, 12, "Comic Sans MS", 480)
							$sFunnyText = $sText & GetTranslated(625,125,"Donate £5000 to MyBot.run while you wait 15 minutes for this to time out?") & @CRLF
						Case 3
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x000000, 0xFFFFFF, 12, "Tahoma", 480)
							$sFunnyText = $sText & GetTranslated(625,126,"Having trouble finding the exit button?") & @CRLF
						Case 4
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x4800FF, 0xD800FF, 12, "Comic Sans MS", 480)
							$sFunnyText = $sText & GetTranslated(625,127,"This is fun, can we keep going all day?") & @CRLF
						Case 5
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Times New Roman", 480)
							$sFunnyText = $sText & GetTranslated(625,128,"Try four more times, you have to get lucky sooner or later!") & @CRLF
						Case 6
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x00FFED, 0x010051, 12, "Comic Sans MS", 480)
							$sFunnyText = $sText & GetTranslated(625,129,"Do you have a Banana? This code monkey is Hungry!") & @CRLF
						Case 7
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0xFF6600, 0x013000, 12, "Lucida Console", 480)
							$sFunnyText = $sText & GetTranslated(625,130,"Maybe try hitting same button till you and Mr. Random pick same?") & @CRLF
						Case 0
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x000000, 0xFFFFFF, 12, "Tahoma", 480)
							$sFunnyText = $sText & GetTranslated(625,131,"Sorry, can not 'escape' from this!") & @CRLF
						Case Else
							_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 480)
							$sFunnyText = $sText & GetTranslated(625,132,"Program error! Programmers can ruin a good joke.") & @CRLF
							ExitLoop 2
					EndSwitch
					$iCount += 1
				EndIf
			WEnd
		EndIf
	WEnd
	If $bErrorCondition = True Then
		SetError(1)
		Return
	EndIf
EndFunc

