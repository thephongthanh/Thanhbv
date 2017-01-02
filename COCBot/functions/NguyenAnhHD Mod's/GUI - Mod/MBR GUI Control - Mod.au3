; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control - Mod
; Description ...: Extended GUI Control for Mod
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; GUI Control for SwitchAcc Mode - DEMEN
Func btnUpdateProfile()

	saveConfig()
	readConfig()
	applyConfig()

	$ProfileList = _GUICtrlComboBox_GetListArray($cmbProfile)
	$nTotalProfile = _GUICtrlComboBox_GetCount($cmbProfile)

	For $i = 0 To 7
		If $i <= $nTotalProfile - 1 Then
			GUICtrlSetData($lblProfileName[$i], $ProfileList[$i+1])
			For $j = $lblProfileNo[$i] To $cmbProfileType[$i]
				GUICtrlSetState($j, $GUI_SHOW)
			Next

			; Update stats GUI
			If $i <= 3 Then
				For $j = $aStartHide[$i] To $aEndHide[$i]
					GUICtrlSetState($j, $GUI_SHOW)
				Next

				Switch $aProfileType[$i]
					Case 1
						GUICtrlSetData($grpVillageAcc[$i], "Village: " & $ProfileList[$i+1] & " (Active)")

					Case 2
						GUICtrlSetData($grpVillageAcc[$i], "Village: " & $ProfileList[$i+1] & " (Donate)")
						For $j = $aSecondHide[$i] To $aEndHide[$i]
							GUICtrlSetState($j, $GUI_HIDE)
						Next
					Case Else
						GUICtrlSetData($grpVillageAcc[$i], "Village: " & $ProfileList[$i+1] & " (Idle)")
						For $j = $aSecondHide[$i] To $aEndHide[$i]
							GUICtrlSetState($j, $GUI_HIDE)
						Next
				EndSwitch
			EndIf
		Else
			GUICtrlSetData($lblProfileName[$i], "")
			_GUICtrlComboBox_SetCurSel($cmbAccountNo[$i], -1)
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$i], -1)
			For $j = $lblProfileNo[$i] To $cmbProfileType[$i]
				GUICtrlSetState($j, $GUI_HIDE)
			Next
		EndIf
	Next

EndFunc

Func btnClearProfile()
	For $i = 0 To 7
		_GUICtrlComboBox_SetCurSel($cmbAccountNo[$i], -1)
		_GUICtrlComboBox_SetCurSel($cmbProfileType[$i], -1)
	Next
EndFunc

Func chkSwitchAcc()
	If GUICtrlRead($chkSwitchAcc) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCount($cmbProfile) <= 1 Then
			GUICtrlSetState($chkSwitchAcc, $GUI_UNCHECKED)
			MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,89, "Cannot enable SwitchAcc Mode") & @CRLF & GetTranslated(655,90, "You have only ") & _GUICtrlComboBox_GetCount($cmbProfile) & " Profile", 30, $hGUI_BOT)
		EndIf
	EndIf
EndFunc   ;==>chkSwitchAcc

Func chkTrain()
	If GUICtrlRead($chkTrain) = $GUI_CHECKED Then
		$ichkTrain = 1
	Else
		$ichkTrain = 0
	EndIf
EndFunc

Func radNormalSwitch()
	If GUICtrlRead($radNormalSwitch) = $GUI_CHECKED Then
		GUICtrlSetState($chkUseTrainingClose, $GUI_UNCHECKED)
		GUICtrlSetState($chkUseTrainingClose, $GUI_DISABLE)
		For $i = $radCloseCoC To $radCloseAndroid
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	Else
		GUICtrlSetState($chkUseTrainingClose, $GUI_ENABLE)
		For $i = $radCloseCoC To $radCloseAndroid
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
	EndIf
EndFunc   ;==>radNormalSwitch  - Normal Switch is not on the same boat with Sleep Combo


Func cmbMatchProfileAcc1()
	MatchProfileAcc(0)
EndFunc
Func cmbMatchProfileAcc2()
	MatchProfileAcc(1)
EndFunc
Func cmbMatchProfileAcc3()
	MatchProfileAcc(2)
EndFunc
Func cmbMatchProfileAcc4()
	MatchProfileAcc(3)
EndFunc
Func cmbMatchProfileAcc5()
	MatchProfileAcc(4)
EndFunc
Func cmbMatchProfileAcc6()
	MatchProfileAcc(5)
EndFunc
Func cmbMatchProfileAcc7()
	MatchProfileAcc(6)
EndFunc
Func cmbMatchProfileAcc8()
	MatchProfileAcc(7)
EndFunc


Func MatchProfileAcc($Num)

	If _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) > _GUICtrlComboBox_GetCurSel($cmbTotalAccount) Then
		MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,91, "Account [") & _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) & GetTranslated(655,92, "] exceeds Total Account declared") ,30, $hGUI_BOT)
		_GUICtrlComboBox_SetCurSel($cmbAccountNo[$Num], -1)
		_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], -1)
		saveConfig()
	EndIf

	If _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) >= 0 Then
		If _ArraySearch($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1) <> -1 Then
			MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,91, "Account [") & _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1 & GetTranslated(655,93, "] has been assigned to Profile [")_
				& _ArraySearch($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1) + 1 & "]" ,30, $hGUI_BOT)
			_GUICtrlComboBox_SetCurSel($cmbAccountNo[$Num], -1)
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], -1)
			saveConfig()
		ElseIf UBound(_ArrayFindAll($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1)) > 1 Then
			MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,91, "Account [") & _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) & GetTranslated(655,94, "] has been assigned to another profile") ,30, $hGUI_BOT)
			_GUICtrlComboBox_SetCurSel($cmbAccountNo[$Num], -1)
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], -1)
			saveConfig()
		Else
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], 0)
		EndIf

	EndIf

EndFunc ;===> MatchProfileAcc

Func btnLocateAcc()

	Local $AccNo = _GUICtrlComboBox_GetCurSel($cmbLocateAcc) + 1
	Local $stext, $MsgBox
	Local $wasRunState = $RunState
	$RunState = True
	SetLog(GetTranslated(655,95, "Locating Y-Coordinate of CoC Account No. ") & $AccNo & GetTranslated(655,96, ", please wait..."), $COLOR_BLUE)
	WinGetAndroidHandle()

	Zoomout()

	Click(820, 585, 1, 0, "Click Setting")      ;Click setting
	Sleep(500)

	While 1
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 600)
		$stext = GetTranslated(655,97, "Click Connect/Disconnect on emulator to show the accout list") & @CRLF & @CRLF & _
				GetTranslated(655,98, "Click OK then click on your Account No. ") & $AccNo & @CRLF & @CRLF & _
				GetTranslated(655,99, "Do not move mouse quickly after clicking location") & @CRLF & @CRLF
		$MsgBox = _ExtMsgBox(0, GetTranslated(655,100, "Ok|Cancel"), GetTranslated(655,101, "Locate CoC Account No. ") & $AccNo, $stext, 60, $frmBot)
		If $MsgBox = 1 Then
			WinGetAndroidHandle()
			Local $aPos = FindPos()
			$aLocateAccConfig[$AccNo-1] = Int($aPos[1])
			ClickP($aAway, 1, 0, "#0379")
		Else
			SetLog(GetTranslated(655,102, "Locate CoC Account Cancelled"), $COLOR_BLUE)
			ClickP($aAway, 1, 0, "#0382")
			Return
		EndIf
		SetLog(GetTranslated(655,103, "Locate CoC Account Success: ") & "(383, " & $aLocateAccConfig[$AccNo-1] & ")", $COLOR_GREEN)

		ExitLoop
	WEnd
	Clickp($aAway, 2, 0, "#0207")
	IniWriteS($profile, "Switch Account", "AccLocation." & $AccNo, $aLocateAccConfig[$AccNo-1])
	$RunState = $wasRunState
	AndroidShield("LocateAcc") ; Update shield status due to manual $RunState

EndFunc   ;==>LocateAcc

Func btnClearAccLocation()
	For $i = 1 to 8
		$aLocateAccConfig[$i-1] = -1
		$aAccPosY[$i-1] = -1
	Next
	Setlog(GetTranslated(655,104, "Position of all accounts cleared"))
	saveConfig()
EndFunc
; ============= SwitchAcc Mode ============= - DEMEN


; GUI Control for Classic FourFinger Attack - DEMEN
Func cmbDeployAB() ; avoid conflict between FourFinger and SmartAttack - DEMEN
	If _GUICtrlComboBox_GetCurSel($cmbDeployAB) = 4 Or _GUICtrlComboBox_GetCurSel($cmbDeployAB) = 5 Then
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_UNCHECKED)
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_DISABLE)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_ENABLE)
	EndIf
	chkSmartAttackRedAreaAB()
EndFunc   ;==>cmbDeployAB

Func cmbDeployDB() ; avoid conflict between FourFinger and SmartAttack - DEMEN
	If _GUICtrlComboBox_GetCurSel($cmbDeployDB) = 4 Or _GUICtrlComboBox_GetCurSel($cmbDeployDB) = 5 Then
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_UNCHECKED)
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_DISABLE)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_ENABLE)
	EndIf
	chkSmartAttackRedAreaDB()
EndFunc   ;==>cmbDeployDB
; ============= Classic FourFinger Attack ============ - DEMEN

; GUI Control for Multi Finger Attack
Func Bridge()
	cmbDeployDB()
	cmbDBMultiFinger()
EndFunc   ;==>Bridge

; Auto Hide
Func chkAutoHide()
	If GUICtrlRead($chkAutoHide) = $GUI_CHECKED Then
		GUICtrlSetState($txtAutohideDelay, $GUI_ENABLE)
	Else
		GUICtrlSetState($txtAutohideDelay, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkAutoHide

; CSV Deployment Speed Mod
Func sldSelectedSpeedDB()
	$isldSelectedCSVSpeed[$DB] = GUICtrlRead($sldSelectedSpeedDB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$DB]] & "x";
	IF $isldSelectedCSVSpeed[$DB] = 4 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedDB, $speedText & " speed")
EndFunc   ;==>sldSelectedSpeedDB

Func sldSelectedSpeedAB()
	$isldSelectedCSVSpeed[$LB] = GUICtrlRead($sldSelectedSpeedAB)
	Local $speedText = $iCSVSpeeds[$isldSelectedCSVSpeed[$LB]] & "x";
	IF $isldSelectedCSVSpeed[$LB] = 4 Then $speedText = "Normal"
	GUICtrlSetData($lbltxtSelectedSpeedAB, $speedText & " speed")
EndFunc   ;

Func AttackNowLB()
	Setlog("Begin Live Base Attack TEST")
	$iMatchMode = $LB			; Select Live Base As Attack Type
	$iAtkAlgorithm[$LB] = 1			; Select Scripted Attack
	$scmbABScriptName = GuiCtrlRead($cmbScriptNameAB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 1			; Select Live Base As Attack Type
	$RunState = True

	ForceCaptureRegion()
	_CaptureRegion2()

	If CheckZoomOut("VillageSearch", True, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($iDelayPrepareSearch3) Then Return ; wait 500 ms
			ForceCaptureRegion()
			$bMeasured = CheckZoomOut("VillageSearch", $i < 2, True)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then Return ; exit func
	EndIf

	PrepareAttack($iMatchMode)			; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack()			; Fire xD
	Setlog("End Live Base Attack TEST")
EndFunc   ;==>AttackNowLB

Func AttackNowDB()
	Setlog("Begin Dead Base Attack TEST")
	$iMatchMode = $DB			; Select Dead Base As Attack Type
	$iAtkAlgorithm[$DB] = 1			; Select Scripted Attack
	$scmbABScriptName = GuiCtrlRead($cmbScriptNameDB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$iMatchMode = 0			; Select Dead Base As Attack Type
	$RunState = True
	ForceCaptureRegion()
	_CaptureRegion2()

	If CheckZoomOut("VillageSearch", True, False) = False Then
		$i = 0
		Local $bMeasured
		Do
			$i += 1
			If _Sleep($iDelayPrepareSearch3) Then Return ; wait 500 ms
			ForceCaptureRegion()
			$bMeasured = CheckZoomOut("VillageSearch", $i < 2, True)
		Until $bMeasured = True Or $i >= 2
		If $bMeasured = False Then Return ; exit func
	EndIf

	PrepareAttack($iMatchMode)			; lol I think it's not needed for Scripted attack, But i just Used this to be sure of my code
	Attack()			; Fire xD
	Setlog("End Dead Base Attack TEST")
EndFunc   ;==>AttackNowLB

; Change Android Shield Color
Func btnColorShield()
	$sSelectedColor = _ChooseColor(2,0xFFFFFF,2,$frmBot)
	If $sSelectedColor <> -1 Then
	$sSelectedColor = StringTrimLeft($sSelectedColor,2)
	$AndroidShieldColor = Dec($sSelectedColor)
	SetLog("Shield color successfully chosen! Will be used now", $COLOR_INFO)
	Else
	SetLog("Shield color selection stopped, keeping the old one!",$COLOR_INFO)
	EndIf

EndFunc

Func sldrTransparancyShield()
	$ReadTransparancyShield = GUICtrlRead($sldrTransparancyShield)
	$AndroidShieldTransparency = Int($ReadTransparancyShield)

EndFunc

Func btnColorIdleShield()
	$sSelectedColor = _ChooseColor(2,0xFFFFFF,2,$frmBot)
	If $sSelectedColor <> -1 Then
	$sSelectedColor = StringTrimLeft($sSelectedColor,2)
	$AndroidInactiveColor = Dec($sSelectedColor)
	SetLog("Idle Shield color successfully chosen! Will be used now", $COLOR_INFO)
	Else
	SetLog("Idle Shield color selection stopped, keeping the old one!",$COLOR_INFO)
	EndIf

EndFunc

Func sldrTransparancyIdleShield()
	$ReadTransparancyIdle = GUICtrlRead($sldrTransparancyIdleShield)
	$AndroidInactiveTransparency = Int($ReadTransparancyIdle)

EndFunc

Func chkDontRemoveTroops()
	If GUICtrlRead($chkDontRemoveTroops) = $GUI_CHECKED Then
		$ichkDontRemoveTroops = 1
	Else
		$ichkDontRemoveTroops = 0
	EndIf
EndFunc
