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
		btnUpdateProfile()
	EndIf

	If _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) >= 0 Then
		If _ArraySearch($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1) <> -1 Then
			MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,91, "Account [") & _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1 & GetTranslated(655,93, "] has been assigned to Profile [")_
				& _ArraySearch($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1) + 1 & "]" ,30, $hGUI_BOT)
			_GUICtrlComboBox_SetCurSel($cmbAccountNo[$Num], -1)
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], -1)
			btnUpdateProfile()
		ElseIf UBound(_ArrayFindAll($aMatchProfileAcc,_GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num])+1)) > 1 Then
			MsgBox($MB_OK, GetTranslated(655,88, "SwitchAcc Mode"), GetTranslated(655,91, "Account [") & _GUICtrlComboBox_GetCurSel($cmbAccountNo[$Num]) & GetTranslated(655,94, "] has been assigned to another profile") ,30, $hGUI_BOT)
			_GUICtrlComboBox_SetCurSel($cmbAccountNo[$Num], -1)
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], -1)
			btnUpdateProfile()
		Else
			_GUICtrlComboBox_SetCurSel($cmbProfileType[$Num], 0)
			btnUpdateProfile()
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

; GUI Control for SimpleQuickTrain
Global Const $grpTrainTroops2=$grpTrainTroopsGUI&"#"&$icnBarb&"#"&$txtLevBarb&"#"&$icnArch&"#"&$txtLevArch&"#"&$icnGiant&"#"&$txtLevGiant&"#"&$icnGobl&"#"&$txtLevGobl&"#"&$icnWall&"#"&$txtLevWall&"#"&$icnBall&"#"&$txtLevBall&"#"&$icnWiza&"#"&$txtLevWiza&"#"&$icnHeal&"#"&$txtLevHeal&"#"&$icnDrag&"#"&$txtLevDrag&"#"&$icnPekk&"#"&$txtLevPekk&"#"&$icnBabyD&"#"&$txtLevBabyD&"#"&$icnMine&"#"&$txtLevMine&"#"&$icnMini&"#"&$txtLevMini&"#"&$icnHogs&"#"&$txtLevHogs&"#"&$icnValk&"#"&$txtLevValk&"#"&$icnGole&"#"&$txtLevGole&"#"&$icnWitc&"#"&$txtLevWitc&"#"&$icnLava&"#"&$txtLevLava&"#"&$icnBowl&"#"&$txtLevBowl
Global Const $grpSimpleQT=$grpSimpleQuickTrain&"#"&$chkSimpleQuickTrain&"#"&$chkFillArcher&"#"&$txtFillArcher&"#"&$chkFillEQ&"#"&$chkTrainDonated
Func GUIControlForSimpleQTrain()
	If GUICtrlRead($hChk_UseQTrain) = $GUI_CHECKED Then
		_GUI_Value_STATE("SHOW", $hRadio_Army12 & "#" & $hRadio_Army123 & "#" & $grpSimpleQT)
		_GUI_Value_STATE("ENABLE", $hRadio_Army12 & "#" & $hRadio_Army123)
		_GUI_Value_STATE("HIDE", $LblRemovecamp & "#" & $icnRemovecamp & "#" & $grpTrainTroops & "#" & $grpTrainTroops2)
		_GUI_Value_STATE("ENABLE", $chkSimpleQuickTrain & "#" & $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
		chkSimpleQuickTrain()
	Else
		_GUI_Value_STATE("DISABLE", $hRadio_Army12 & "#" & $hRadio_Army123)
		_GUI_Value_STATE("HIDE", $hRadio_Army12 & "#" & $hRadio_Army123 & "#" & $grpSimpleQT)
		_GUI_Value_STATE("SHOW", $LblRemovecamp & "#" &  $icnRemovecamp & "#" & $grpTrainTroops & "#" & $grpTrainTroops2)
		_GUI_Value_STATE("DISABLE", $chkSimpleQuickTrain & "#" & $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
	EndIf
EndFunc		;==>GUIControlForSimpleQTrain - additional Control to Func chkUseQTrain()

Func chkSimpleQuickTrain()
	If GUICtrlRead($chkSimpleQuickTrain) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)

	Else
		_GUI_Value_STATE("DISABLE", $chkFillArcher & "#" & $txtFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)
		_GUI_Value_STATE("UNCHECKED", $chkFillArcher & "#" & $chkFillEQ & "#" & $chkTrainDonated)

	EndIf
EndFunc   ;==>chkSimpleQuickTrain
; ======================== SimpleQuickTrain ========================

; Switch Profile
; IceCube (Misc v1.0)
Func btnRecycle()
	FileDelete($config)
	SaveConfig()
	SetLog(GetTranslated(637, 20, "Profile ") & $sCurrProfile & GetTranslated(637, 21, " was recycled with success"), $COLOR_GREEN)
	SetLog(GetTranslated(637, 22, "All unused settings were removed"), $COLOR_GREEN)
EndFunc   ;==>btnRecycle
; IceCube (Misc v1.0)
Func setupProfileComboBoxswitch()
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbGoldMaxProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbGoldMaxProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbGoldMinProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbGoldMinProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbElixirMaxProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbElixirMaxProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbElixirMinProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbElixirMinProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbDEMaxProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbDEMaxProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbDEMinProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbDEMinProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbTrophyMaxProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbTrophyMaxProfile, $profileString, "<No Profiles>")
		; Clear the combo box current data in case profiles were deleted
		GUICtrlSetData($cmbTrophyMinProfile, "", "")
		; Set the new data of available profiles
		GUICtrlSetData($cmbTrophyMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox

; GUI Control for Forecast
Func chkForecastBoost()
	If GUICtrlRead($chkForecastBoost) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastBoost, False)
		GUICtrlSetState($txtForecastBoost, $GUI_ENABLE)
		GUICtrlSetState($txtForecastBoost, $GUI_SHOW)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastBoost, True)
		GUICtrlSetState($txtForecastBoost, $GUI_DISABLE)
		GUICtrlSetState($txtForecastBoost, $GUI_HIDE)
	EndIf
EndFunc

Func chkForecastHopingSwitchMax()
	If GUICtrlRead($chkForecastHopingSwitchMax) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMax, False)
		GUICtrlSetState($txtForecastHopingSwitchMax, $GUI_ENABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMax, $GUI_ENABLE)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMax, True)
		GUICtrlSetState($txtForecastHopingSwitchMax, $GUI_DISABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMax, $GUI_DISABLE)
	EndIf
EndFunc

Func chkForecastHopingSwitchMin()
	If GUICtrlRead($chkForecastHopingSwitchMin) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMin, False)
		GUICtrlSetState($txtForecastHopingSwitchMin, $GUI_ENABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMin, $GUI_ENABLE)
	Else
		_GUICtrlEdit_SetReadOnly($txtForecastHopingSwitchMin, True)
		GUICtrlSetState($txtForecastHopingSwitchMin, $GUI_DISABLE)
		GUICtrlSetState($cmbForecastHopingSwitchMin, $GUI_DISABLE)
	EndIf
EndFunc

;Added Multi Switch Language by rulesss and Kychera
Func setForecast()
	_IENavigate($oIE, "about:blank")
	_IEBodyWriteHTML($oIE, "<div style='width:440px;height:345px;padding:0;overflow:hidden;position: absolute;top:5x;left:-25px;z-index:0;'><center><img src='" & @ScriptDir & "\COCBot\Forecast\loading.gif'></center></div>")
EndFunc

Func setForecast2()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=english  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast3()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=russian  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast4()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=french  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast5()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=german  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast6()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=spanish  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast7()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=italian  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast8()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=portuguese  ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func setForecast9()
	RunWait("..\COCBot\Forecast\wkhtmltoimage.exe --width 3100 http://clashofclansforecaster.com/?lang=indonesian ..\COCBot\Forecast\forecast.jpg", "", @SW_HIDE)
	_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
EndFunc

Func _RoundDown($nVar, $iCount)
    Return Round((Int($nVar * (10 ^ $iCount))) / (10 ^ $iCount), $iCount)
EndFunc

Func redrawForecast()
	If GUICtrlRead($hGUI_MOD_TAB, 1) = $hGUI_MOD_TAB_ITEM3 Then
		_IENavigate($oIE, "about:blank")
		_IEBodyWriteHTML($oIE, "<img style='margin: -10px 0px -10px -100px;' src='" & @ScriptDir & "\COCBot\Forecast\forecast.jpg' width='1700'>")
	EndIf
EndFunc

Func readCurrentForecast()
	Local $return = getCurrentForecast()
	If $return > 0 Then Return $return

	Local $line = ""
	Local $filename = @ScriptDir & "\COCBot\Forecast\forecast.mht"

;	SetLog("Consultation de la météo...", $COLOR_BLUE)

	_INetGetMHT( "http://clashofclansforecaster.com", $filename)

	Local $file = FileOpen($filename, 0)
	If $file = -1 Then
		SetLog("     Error reading forecast !", $COLOR_RED)
		Return False
	EndIf

	ReDim $dtStamps[0]
	ReDim $lootMinutes[0]
	While 1
		$line = FileReadLine($file)
		If @error <> 0 Then ExitLoop
		if StringCompare(StringLeft($line, StringLen("<script language=""javascript"">var militaryTime")), "<script language=""javascript"">var militaryTime") = 0 Then
			Local $pos1
			Local $pos2
			$pos1 = StringInStr($line, "minuteNow")
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, ":", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, ",", 9, 1, $pos1 + 1)
					Local $minuteNowString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$timeOffset = Int($minuteNowString) - nowTicksUTC()
;					SetLog("     timeOffset: " & $timeOffset, $COLOR_BLUE)
				EndIf
			EndIf

			$pos1 = StringInStr($line, "dtStamps")
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $dtStampsString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$dtStamps = StringSplit($dtStampsString, ",", 2)
				EndIf
			EndIf

			$pos1 = StringInStr($line, "lootMinutes", 0, 1, $pos1 + 1)
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $minuteString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$lootMinutes = StringSplit($minuteString, ",", 2)
				EndIf
			EndIf

			$pos1 = StringInStr($line, "lootIndexScaleMarkers", 0, 1, $pos1 + 1)
			If $pos1 > 0 Then
				$pos1 = StringInStr($line, "[", 0, 1, $pos1 + 1)
				If $pos1 > 0 Then
					$pos2 = StringInStr($line, "]", 9, 1, $pos1 + 1)
					Local $lootIndexScaleMarkersString = StringMid($line, $pos1 + 1, $pos2 - $pos1 - 1)
					$lootIndexScaleMarkers = StringSplit($lootIndexScaleMarkersString, ",", 2)
				EndIf
			EndIf
			ExitLoop
		EndIf
	WEnd
	FileClose($file)

;	SetLog("     Processed " & UBound($lootMinutes) & " loot minutes.", $COLOR_BLUE)

	$return = getCurrentForecast()
	If $return = 0 Then
		SetLog("Error reading forecast.")
	EndIf
	Return $return
EndFunc

Func _INetGetMHT( $url, $file )
	Local $msg = ObjCreate("CDO.Message")
	If @error Then Return False
	Local $ado = ObjCreate("ADODB.Stream")
	If @error Then Return False
	Local $conf = ObjCreate("CDO.Configuration")
	If @error Then Return False

	With $ado
		.Type = 2
		.Charset = "US-ASCII"
		.Open
	EndWith

	Local $flds = $conf.Fields
	$flds.Item("http://schemas.microsoft.com/cdo/configuration/urlgetlatestversion") = True
	$flds.Update()
	$msg.Configuration = $conf
	$msg.CreateMHTMLBody($url, 31)
	$msg.DataSource.SaveToObject($ado, "_Stream")
	FileDelete($file)
	$ado.SaveToFile($file, 1)
	$msg = ""
	$ado = ""
	Return True
EndFunc

Func getCurrentForecast()
	Local $return = 0
	Local $nowTicks = nowTicksUTC() + $timeOffset
	If UBound($dtStamps) > 0 And UBound($lootMinutes) > 0 And UBound($dtStamps) = UBound($lootMinutes) Then
	If $nowTicks >= Int($dtStamps[0]) And $nowTicks <= Int($dtStamps[UBound($dtStamps) - 1]) Then
			Local $i
			For $i = 0 To UBound($dtStamps) - 1
				If $nowTicks >= Int($dtStamps[$i]) Then
					$return = Int($lootMinutes[$i])
				Else
					ExitLoop
				EndIf
			Next
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf

	Return CalculateIndex($return)
EndFunc

Func CalculateIndex($minutes)
	Local $index = 0
	Local $iRound1 = 0
	Local $index25 = 2.5
	Local $index4 = 4
	Local $index6 = 6
	Local $index8 = 8

	If $minutes < $lootIndexScaleMarkers[0] Then
		$index = $minutes / $lootIndexScaleMarkers[0]
	ElseIf $minutes < $lootIndexScaleMarkers[1] Then
		$index = (($minutes - $lootIndexScaleMarkers[0]) / ($lootIndexScaleMarkers[1] - $lootIndexScaleMarkers[0])) + 1
	ElseIf $minutes < $lootIndexScaleMarkers[2] Then
		$index = (($minutes - $lootIndexScaleMarkers[1]) / ($lootIndexScaleMarkers[2] - $lootIndexScaleMarkers[1])) + 2
	ElseIf $minutes < $lootIndexScaleMarkers[3] Then
		$index = (($minutes - $lootIndexScaleMarkers[2]) / ($lootIndexScaleMarkers[3] - $lootIndexScaleMarkers[2])) + 3
	ElseIf $minutes < $lootIndexScaleMarkers[4] Then
		$index = (($minutes - $lootIndexScaleMarkers[3]) / ($lootIndexScaleMarkers[4] - $lootIndexScaleMarkers[3])) + 4
	ElseIf $minutes < $lootIndexScaleMarkers[5] Then
		$index = (($minutes - $lootIndexScaleMarkers[4]) / ($lootIndexScaleMarkers[5] - $lootIndexScaleMarkers[4])) + 5
	ElseIf $minutes < $lootIndexScaleMarkers[6] Then
		$index = (($minutes - $lootIndexScaleMarkers[5]) / ($lootIndexScaleMarkers[6] - $lootIndexScaleMarkers[5])) + 6
	ElseIf $minutes < $lootIndexScaleMarkers[7] Then
		$index = (($minutes - $lootIndexScaleMarkers[6]) / ($lootIndexScaleMarkers[7] - $lootIndexScaleMarkers[6])) + 7
	ElseIf $minutes < $lootIndexScaleMarkers[8] Then
		$index = (($minutes - $lootIndexScaleMarkers[7]) / ($lootIndexScaleMarkers[8] - $lootIndexScaleMarkers[7])) + 8
	ElseIf $minutes < $lootIndexScaleMarkers[9] Then
		$index = (($minutes - $lootIndexScaleMarkers[8]) / ($lootIndexScaleMarkers[9] - $lootIndexScaleMarkers[8])) + 9
	Else
		$index = (($minutes - $lootIndexScaleMarkers[9]) / (44739594 - $lootIndexScaleMarkers[9])) + 10
	EndIf

    $iRound1 = Round($index, 1)

	SetLog(GetTranslated(107,10,"Viewing weather information ..."), $COLOR_PURPLE)
	If $iRound1 <= $index25 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Awful!", $COLOR_RED)
	Elseif $iRound1 > $index25 and $iRound1 <= $index4 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Bad", $COLOR_DEEPPINK)
	Elseif $iRound1 > $index4 and $iRound1 <= $index6 Then
	SetLog("Index of Loot  : " & $iRound1 & " ---> Fine", $COLOR_ORANGE)
	ElseIf $iRound1 > $index6 and $iRound1 <= $index8 Then
	SetLog("Index of Loot : " & $iRound1 & " ---> Good!", $COLOR_GREEN)
	ElseIf $iRound1 > $index8 Then
	SetLog("Index of Loot  : " & $iRound1 & " ---> Perfect !!", $COLOR_DARKGREEN)
	Endif
	Return _RoundDown($index, 1)
EndFunc


Func nowTicksUTC()
	Local $now = _Date_Time_GetSystemTime()
	Local $nowUTC = _Date_Time_SystemTimeToDateTimeStr($now)

	$nowUTC = StringMid($nowUTC, 7, 4) & "/" & StringMid($nowUTC, 1, 2) & "/" & StringMid($nowUTC, 4, 2) & StringMid($nowUTC, 11)
	Return _DateDiff('s', "1970/01/01 00:00:00", $nowUTC)
EndFunc

Func ForecastSwitch()
If $ichkForecastHopingSwitchMax	= 1 Or $ichkForecastHopingSwitchMin = 1 And $RunState Then
	$currentForecast = readCurrentForecast()
	Local $SwitchtoProfile = ""
	Local $aArray = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	_ArrayDelete($aArray,0)
	While True
		If $ichkForecastHopingSwitchMax = 1 Then
		If $currentForecast < Number($itxtForecastHopingSwitchMax, 3) And $sCurrProfile <> $icmbForecastHopingSwitchMax Then
		$SwitchtoProfile = $icmbForecastHopingSwitchMax
		Local $aNewProfile = $aArray[number($icmbForecastHopingSwitchMax)]
			SetLog("Weather index < " & $itxtForecastHopingSwitchMax & " !!", $COLOR_ORANGE)
			SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
		ExitLoop
		EndIf
		EndIf
		If $ichkForecastHopingSwitchMin = 1 Then
		If $currentForecast > Number($itxtForecastHopingSwitchMin, 3) And $sCurrProfile <> $icmbForecastHopingSwitchMin Then
		$SwitchtoProfile = $icmbForecastHopingSwitchMin
		Local $aNewProfile = $aArray[number($icmbForecastHopingSwitchMin)]
			SetLog("Weather index > " & $itxtForecastHopingSwitchMin & " !!", $COLOR_ORANGE)
			SetLog("Switching profile to : " & $aNewProfile, $COLOR_BLUE)
		ExitLoop
		EndIf
		EndIf
	ExitLoop
	WEnd
	If $SwitchtoProfile <> "" Then
		If $sCurrProfile <> $SwitchtoProfile Then
		_GUICtrlComboBox_SetCurSel($cmbProfile, $SwitchtoProfile)
		cmbProfile()
		EndIf
	EndIf
EndIf
EndFunc
