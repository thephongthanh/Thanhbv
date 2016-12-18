; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Child Mod - Options2
; Description ...: This file Includes GUI Design
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

Global $txtPresetSaveFilename, $txtSavePresetMessage, $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf
Global $cmbPresetList, $txtPresetMessage,$btnGUIPresetLoadConf,  $lblLoadPresetMessage,$btnGUIPresetDeleteConf, $chkCheckDeleteConf

$hGUI_ModOptions2 = GUICreate("", $_GUI_MAIN_WIDTH - 28, $_GUI_MAIN_HEIGHT - 255 - 28, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $hGUI_MOD)
GUISetBkColor($COLOR_WHITE, $hGUI_ModOptions2)

GUISwitch($hGUI_ModOptions2)

$hGUI_ModOptions2_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 30, $_GUI_MAIN_HEIGHT - 255 - 30, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_ModOptions2_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslated(655,1, "Switch Accounts Option"))
	Local $x = 25, $y = 40
;	$grpProfiles = GUICtrlCreateGroup(GetTranslated(655,2, "Switch Profiles"), $x - 20, $y - 20, 427, 45)
;		$y -= 0
		$lblProfile = GUICtrlCreateLabel(GetTranslated(655,3, "Current Profile:"), $x - 10, $y, -1, -1)
		$cmbProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 220, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,4, "Use this to switch to a different profile") & @CRLF & GetTranslated(655,5, "Your profiles can be found in") & ": " & @CRLF &  $sProfilePath
			_GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput("MyVillage", $x + 75, $y - 4, 220, 20, BitOR($SS_CENTER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit (-1, 100, 0)
			GUICtrlSetFont(-1, 9, 400, 1)
			_GUICtrlSetTip(-1, GetTranslated(655,6, "Your village/profile's name"))
			GUICtrlSetState(-1, $GUI_HIDE)

		$bIconAdd = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_2.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd_4.bmp")
			_GUIImageList_AddBitmap($bIconAdd, @ScriptDir & "\images\Button\iconAdd.bmp")
		$bIconConfirm = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_2.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm_4.bmp")
			_GUIImageList_AddBitmap($bIconConfirm, @ScriptDir & "\images\Button\iconConfirm.bmp")
		$bIconDelete = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_2.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete_4.bmp")
			_GUIImageList_AddBitmap($bIconDelete, @ScriptDir & "\images\Button\iconDelete.bmp")
		$bIconCancel = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_2.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel_4.bmp")
			_GUIImageList_AddBitmap($bIconCancel, @ScriptDir & "\images\Button\iconCancel.bmp")
		$bIconEdit = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_2.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit_4.bmp")
			_GUIImageList_AddBitmap($bIconEdit, @ScriptDir & "\images\Button\iconEdit.bmp")
		; IceCube (Misc v1.0)
		$bIconRecycle = _GUIImageList_Create(22, 22, 4)
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_2.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle_4.bmp")
			_GUIImageList_AddBitmap($bIconRecycle, @ScriptDir & "\images\Button\iconRecycle.bmp")
		; IceCube (Misc v1.0)

		$btnAdd = GUICtrlCreateButton("", $x + 300, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnAdd, $bIconAdd, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(655,7, "Add New Profile"))
		$btnConfirmAdd = GUICtrlCreateButton("", $x + 300, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnConfirmAdd, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(655,8, "Confirm"))
		$btnConfirmRename = GUICtrlCreateButton("", $x + 300, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnConfirmRename, $bIconConfirm, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(655,8, "Confirm"))
		$btnDelete = GUICtrlCreateButton("", $x + 327, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnDelete, $bIconDelete, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(655,9, "Delete Profile"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf

		$btnCancel = GUICtrlCreateButton("", $x + 327, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnCancel, $bIconCancel, 4)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			GUICtrlSetState(-1, $GUI_HIDE)
			_GUICtrlSetTip(-1, GetTranslated(655,10, "Cancel"))
		$btnRename = GUICtrlCreateButton("", $x + 355, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnRename, $bIconEdit, 4)
			GUICtrlSetOnEvent(-1, "btnRenameConfirm")
			_GUICtrlSetTip(-1, GetTranslated(655,11, "Rename Profile"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
		; IceCube (Misc v1.0)
		$btnRecycle = GUICtrlCreateButton("", $x + 383, $y - 5, 22, 22)
			_GUICtrlButton_SetImageList($btnRecycle, $bIconRecycle, 4)
			GUICtrlSetOnEvent(-1, "btnRecycle")
			GUICtrlSetState(-1, $GUI_SHOW)
			_GUICtrlSetTip(-1, GetTranslated(655,12, "Recycle Profile by removing all settings no longer suported that could lead to bad behaviour"))
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
		; IceCube (Misc v1.0)

; Defining botting type of eachh profile - SwitchAcc - DEMEN
		$x -= 15
		$y += 35
		$lblProfile = GUICtrlCreateLabel(GetTranslated(655,50, "Profile Type:"), $x, $y + 1, -1, -1)
			$txtTip = GetTranslated(655,51, "Choosing type for this Profile") & @CRLF & GetTranslated(655,52, "Active Profile for botting") & @CRLF & GetTranslated(655,53, "Donate Profile for donating only") & @CRLF & GetTranslated(655,54, "Idle Profile for staying inactive")
			GUICtrlSetTip(-1, $txtTip)

		$radActiveProfile= GUICtrlCreateRadio(GetTranslated(655,55, "Active"), $x + 70 , $y, -1, 16)
			GUICtrlSetTip(-1, GetTranslated(655,56, "Set as Active Profile for training troops & attacking"))
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "radProfileType")

		$radDonateProfile = GUICtrlCreateRadio(GetTranslated(655,57, "Donate"), $x + 130, $y, -1, 16)
			GUICtrlSetTip(-1, GetTranslated(655,58, "Set as Donating Profile for training troops & donating only"))
			GUICtrlSetOnEvent(-1, "radProfileType")

		$radIdleProfile = GUICtrlCreateRadio(GetTranslated(655,59, "Idle"), $x + 190, $y, -1, 16)
			GUICtrlSetTip(-1, GetTranslated(655,60, "Set as Idle Profile. The Bot will ignore this Profile"))
			GUICtrlSetOnEvent(-1, "radProfileType")

		$lblMatchProfileAcc = GUICtrlCreateLabel(GetTranslated(655,61, "Matching Acc. No."), $x + 260, $y + 1 , -1, 16)
			$txtTip = GetTranslated(655,62, "Select the index of CoC Account to match with this Profile")
			GUICtrlSetTip(-1, $txtTip)

		$cmbMatchProfileAcc = GUICtrlCreateCombo("", $x + 360, $y -3, 60, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "---" & "|" & "Acc. 1" & "|" & "Acc. 2" & "|" & "Acc. 3" & "|" & "Acc. 4" & "|" & "Acc. 5" & "|" & "Acc. 6", "---")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbMatchProfileAcc")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

; SwitchAcc - DEMEN

	Local $x = 20, $y = 125
	$grpSwitchAcc = GUICtrlCreateGroup(GetTranslated(655,63, "Switch Account Mode"), $x - 15, $y - 20, 215, 255)
		$chkSwitchAcc = GUICtrlCreateCheckbox(GetTranslated(655,64, "Enable Switch Account"), $x, $y, -1, -1)
			$txtTip = GetTranslated(655,65, "Switch to another account & profile when troop training time is >= 3 minutes") & @CRLF & GetTranslated(655,66, "This function supports maximum 6 CoC accounts & 6 Bot profiles") & @CRLF & GetTranslated(655,67, "Make sure to create sufficient Profiles equal to number of CoC Accounts, and align the index of accounts order with profiles order")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSwitchAcc")

		$chkTrain = GUICtrlCreateCheckbox(GetTranslated(655,200, "Pre-train"), $x + 140, $y, -1, -1)
			GUICtrlSetTip(-1, GetTranslated(655,201, "Enable it to pre-train donated troops in quick train 3 before switch to next account.") & @CRLF & GetTranslated(655,202, "This function requires use Quick Train, not Custom Train.") & @CRLF & GetTranslated(655,203, "Use army 1 for farming troops, army 2 for spells and army 3 for donated troops."))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkTrain")

		$lblTotalAccount = GUICtrlCreateLabel(GetTranslated(655,68, "Total CoC Acc:"), $x + 15, $y + 29, -1, -1)
			$txtTip = GetTranslated(655,69, "Choose number of CoC Accounts pre-logged")
			GUICtrlSetState(-1, $GUI_DISABLE)

		$cmbTotalAccount= GUICtrlCreateCombo("", $x + 100, $y + 25, -1, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "--------" & "|" & "1 Account" & "|" & "2 Accounts" & "|" & "3 Accounts" & "|" & "4 Accounts" & "|" & "5 Accounts" & "|" & "6 Accounts")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$radSmartSwitch= GUICtrlCreateRadio(GetTranslated(655,70, "Smart switch"), $x + 15 , $y + 55, -1, 16)
			GUICtrlSetTip(-1, GetTranslated(655,71, "Switch to account with the shortest remain training time"))
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)

		$radNormalSwitch = GUICtrlCreateRadio(GetTranslated(655,72, "Normal switch"), $x + 100, $y + 55, -1, 16)
			GUICtrlSetTip(-1, GetTranslated(655,73, "Switching accounts continously"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "radNormalSwitch")

		$y += 80

		$chkUseTrainingClose = GUICtrlCreateCheckbox(GetTranslated(655,74, "Combo Sleep after Switch Account"), $x, $y, -1, -1)
			$txtTip = GetTranslated(655,75, "Close CoC combo with Switch Account when there is more than 3 mins remaining on training time of all accounts.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkUseTrainingClose")

		GUIStartGroup()
		$radCloseCoC= GUICtrlCreateRadio(GetTranslated(655,76, "Close CoC"), $x + 15 , $y + 30, -1, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)

		$radCloseAndroid = GUICtrlCreateRadio(GetTranslated(655,77, "Close Android"), $x + 100, $y + 30, -1, 16)

		$lblLocateAcc = GUICtrlCreateLabel(GetTranslated(655,78, "Manually Locate Account Coordinates"), $x, $y + 60, -1, -1)

		For $i = 1 to 6
			If $i <= 3 Then	GUICtrlCreateButton("Acc. " & $i, $x + 10 + 50 * ($i-1), $y + 85, 40, 25)
			If $i > 3 Then GUICtrlCreateButton("Acc. " & $i, $x + 10 + 50 * ($i-4), $y + 120, 40, 25)
			GUICtrlSetTip(-1, GetTranslated(655,79, "Locate Your CoC Account No. ") & $i)
			GUICtrlSetOnEvent(-1, "btnLocateAcc" & $i)
		Next

		GUICtrlCreateButton(GetTranslated(655,80, "Clear All"), $x + 159, $y + 95, 30, 40, $BS_MULTILINE)
			GUICtrlSetTip(-1, GetTranslated(655,81, "Clear Location Data Of All Accounts"))
			GUICtrlSetOnEvent(-1, "btnClearAccLocation")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

; Profiles & Account matching

	Local $x = 245, $y = 125
	$grpSwitchAccMapping = GUICtrlCreateGroup(GetTranslated(655,82, "Profiles"), $x - 20, $y - 20, 210, 255)
		$btnUpdateProfiles = GUICtrlCreateButton(GetTranslated(655,83, "Update Profiles/Acc matching"), $x, $y - 5 , 170, 25)
		GUICtrlSetOnEvent(-1, "btnUpdateProfile")

		Global $lblProfileList[8]

		$y += 25
		For $i = 0 To 7
			$lblProfileList[$i] = GUICtrlCreateLabel("", $x, $y + ($i) * 25, 190, 18, $SS_LEFT)
		Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)



$hGUI_ModOptions2_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(655,13, "Switch Profile Option"))
	; Switch Profile
	Local $xStart = 0, $yStart = 0
	Local $x = $xStart + 30, $y = $yStart + 50
	$grpGoldSwitch = GUICtrlCreateGroup(GetTranslated(655,14, "Gold Switch Profile Conditions"), $x - 20, $y - 20, 420, 75) ;Gold Switch
		$chkGoldSwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,16, "Enable this to switch profiles when gold is above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblGoldMax = GUICtrlCreateLabel(GetTranslated(655,18, "When Gold is Above"), $x + 145, $y, -1, -1)
		$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,19, "Set the amount of Gold to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)

	$y += 30
		$chkGoldSwitchMin = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,20, "Enable this to switch profiles when gold is below amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblGoldMin = GUICtrlCreateLabel(GetTranslated(655,21, "When Gold is Below"), $x + 145, $y, -1, -1)
		$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,19, "Set the amount of Gold to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileGold = GUICtrlCreatePic(@ScriptDir & "\Images\GoldStorage.jpg", $x + 335, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpElixirSwitch = GUICtrlCreateGroup(GetTranslated(655,22, "Elixir Switch Profile Conditions"), $x - 20, $y - 20, 420, 75) ; Elixir Switch
		$chkElixirSwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,23, "Enable this to switch profiles when Elixir is above amount.")
			_GUICtrlSetTip(-1, $txtTip)

		$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblElixirMax = GUICtrlCreateLabel(GetTranslated(655,24, "When Elixir is Above"), $x + 145, $y, -1, -1)
		$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,25, "Set the amount of Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
	$y += 30
		$chkElixirSwitchMin = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,26, "Enable this to switch profiles when Elixir is below amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblElixirMin = GUICtrlCreateLabel(GetTranslated(655,27, "When Elixir is Below"), $x + 145, $y, -1, -1)
		$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,25, "Set the amount of Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileElixir = GUICtrlCreatePic(@ScriptDir & "\Images\ElixirStorage.jpg", $x + 335, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpDESwitch = GUICtrlCreateGroup(GetTranslated(655,28, "Dark Elixir Switch Profile Conditions"), $x - 20, $y - 20, 420, 75) ;DE Switch
		$chkDESwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,29, "Enable this to switch profiles when Dark Elixir is above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblDEMax = GUICtrlCreateLabel(GetTranslated(655,30, "When Dark Elixir is Above"), $x + 145, $y, -1, -1)
		$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,31, "Set the amount of Dark Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
	$y += 30
		$chkDESwitchMin = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,32, "Enable this to switch profiles when Dark Elixir is below amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblDEMin = GUICtrlCreateLabel(GetTranslated(655,33, "When Dark Elixir is Below"), $x + 145, $y, -1, -1)
		$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,31, "Set the amount of Dark Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picProfileDE = GUICtrlCreatePic(@ScriptDir & "\Images\DEStorage.jpg", $x + 335, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpTrophySwitch = GUICtrlCreateGroup(GetTranslated(655,34, "Trophy Switch Profile Conditions"), $x - 20, $y - 20, 420, 75) ; Trophy Switch
		$chkTrophySwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,35, "Enable this to switch profiles when Trophies are above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblTrophyMax = GUICtrlCreateLabel(GetTranslated(655,36, "When Trophies are Above"), $x + 145, $y, -1, -1)
		$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,37, "Set the amount of Trophies to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
	$y += 30
		$chkTrophySwitchMin = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,38, "Enable this to switch profiles when Trophies are below amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblTrophyMin = GUICtrlCreateLabel(GetTranslated(655,39, "When Trophies are Below"), $x + 145, $y, -1, -1)
		$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 275, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,37, "Set the amount of Trophies to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
		$picProfileTrophy = GUICtrlCreatePic(@ScriptDir & "\Images\TrophyLeague.jpg", $x + 335, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
		setupProfileComboBoxswitch()
;GUICtrlCreateTabItem("")

Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]