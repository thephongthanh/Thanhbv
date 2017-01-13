; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
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
Global $FirstControlToHideMOD = GUICtrlCreateDummy()

$hGUI_MOD = GUICreate("", $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $frmBotEx)
;GUISetBkColor($COLOR_WHITE, $hGUI_MOD)

GUISwitch($hGUI_MOD)

$hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $_GUI_MAIN_WIDTH - 20, $_GUI_MAIN_HEIGHT - 255, BitOR($TCS_MULTILINE, $TCS_RIGHTJUSTIFY))

$hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslated(600,61, "Switch Account Options"))

	Local $x = 25, $y = 45
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

	#include "..\functions\NguyenAnhHD Mod's\GUI - Mod\MBR GUI Design - SwitchAcc.au3"									;	SwitchAcc Mode - Demen

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslated(600,62, "Switch Profile Options"))

	Local $x = 25, $y = 60
	$grpGoldSwitch = GUICtrlCreateGroup(GetTranslated(655,14, "Gold Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;Gold Switch
		$chkGoldSwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,16, "Enable this to switch profiles when gold is above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblGoldMax = GUICtrlCreateLabel(GetTranslated(655,18, "When Gold is Above"), $x + 145, $y, -1, -1)
		$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
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
		$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,19, "Set the amount of Gold to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileGold = GUICtrlCreatePic(@ScriptDir & "\Images\GoldStorage.jpg", $x + 350, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpElixirSwitch = GUICtrlCreateGroup(GetTranslated(655,22, "Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Elixir Switch
		$chkElixirSwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,23, "Enable this to switch profiles when Elixir is above amount.")
			_GUICtrlSetTip(-1, $txtTip)

		$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblElixirMax = GUICtrlCreateLabel(GetTranslated(655,24, "When Elixir is Above"), $x + 145, $y, -1, -1)
		$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
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
		$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,25, "Set the amount of Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileElixir = GUICtrlCreatePic(@ScriptDir & "\Images\ElixirStorage.jpg", $x + 350, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpDESwitch = GUICtrlCreateGroup(GetTranslated(655,28, "Dark Elixir Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ;DE Switch
		$chkDESwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,29, "Enable this to switch profiles when Dark Elixir is above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblDEMax = GUICtrlCreateLabel(GetTranslated(655,30, "When Dark Elixir is Above"), $x + 145, $y, -1, -1)
		$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
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
		$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,31, "Set the amount of Dark Elixir to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picProfileDE = GUICtrlCreatePic(@ScriptDir & "\Images\DEStorage.jpg", $x + 350, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 48
	$grpTrophySwitch = GUICtrlCreateGroup(GetTranslated(655,34, "Trophy Switch Profile Conditions"), $x - 20, $y - 20, 438, 75) ; Trophy Switch
		$chkTrophySwitchMax = GUICtrlCreateCheckbox(GetTranslated(655,15, "Switch To"), $x - 10, $y - 5, -1, -1)
			$txtTip = GetTranslated(655,35, "Enable this to switch profiles when Trophies are above amount.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 60, $y - 5, 75, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(655,17, "Select which profile to be switched to when conditions met")
			_GUICtrlSetTip(-1, $txtTip)
		$lblTrophyMax = GUICtrlCreateLabel(GetTranslated(655,36, "When Trophies are Above"), $x + 145, $y, -1, -1)
		$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
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
		$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 275, $y - 5, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(655,37, "Set the amount of Trophies to trigger switching Profile.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
		$picProfileTrophy = GUICtrlCreatePic(@ScriptDir & "\Images\TrophyLeague.jpg", $x + 350, $y - 40, 60, 60)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
		setupProfileComboBoxswitch()

;~ -------------------------------------------------------------
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.                   A LAISSER IMPERATIVEMENT !!!!!!!!!!!!!!
;~ -------------------------------------------------------------
Global $LastControlToHideMOD = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHideMOD + 1]
;~ -------------------------------------------------------------

GUICtrlCreateTabItem("")

$hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem(GetTranslated(600,63, "Forecast"))

Global $grpForecast
Global $ieForecast

Local $xStart = 0, $yStart = 0
Local $x = $xStart + 10, $y = $yStart + 25
	$ieForecast = GUICtrlCreateObj($oIE, $x , $y , 430, 310)

GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += + 318
	$chkForecastBoost = GUICtrlCreateCheckbox(GetTranslated(701,1, "Boost When >"), $x, $y, -1, -1)
		$txtTip = GetTranslated(701,2, "Boost Barracks,Heroes, when the loot index.")
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkForecastBoost")
	$txtForecastBoost = GUICtrlCreateInput("6.0", $x + 90, $y + 2, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
		$txtTip = GetTranslated(701,3, "Minimum loot index for boosting.")
		GUICtrlSetLimit(-1, 3)
		GUICtrlSetTip(-1, $txtTip)
		_GUICtrlEdit_SetReadOnly(-1, True)
		GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$y += - 27
	$chkForecastHopingSwitchMax = GUICtrlCreateCheckbox("", $x + 158, $y + 27, 13, 13)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMax")
			GUICtrlCreateLabel(GetTranslated(701,4, "Switch to"), $x + 177, $y + 27, -1, -1)
	$cmbForecastHopingSwitchMax = GUICtrlCreateCombo("", $x + 225, $y + 25, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMax = GUICtrlCreateLabel(GetTranslated(701,5, "When Index <"), $x + 325, $y + 28, -1, -1)
	$txtForecastHopingSwitchMax = GUICtrlCreateInput("2.5", $x + 400, $y + 26, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
	$chkForecastHopingSwitchMin = GUICtrlCreateCheckbox("", $x + 158, $y + 55, 13, 13)
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkForecastHopingSwitchMin")
			GUICtrlCreateLabel(GetTranslated(701,4, "Switch to"), $x + 177, $y + 55, -1, -1)
	$cmbForecastHopingSwitchMin = GUICtrlCreateCombo("", $x + 225, $y + 53, 95, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$lblForecastHopingSwitchMin = GUICtrlCreateLabel(GetTranslated(701,5, "When Index >"), $x + 325, $y + 58, -1, -1)
	$txtForecastHopingSwitchMin = GUICtrlCreateInput("2.5", $x + 400, $y + 54, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
			$txtTip = "" ; à renseigner
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetData(-1, 2.5)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
GUICtrlCreateGroup("", -99, -99, 1, 1)
setupProfileComboBox()
GUICtrlCreateGroup("", -99, -99, 1, 1)
	$cmbSwLang = GUICtrlCreateCombo("", $x, $y + 50, 45, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
             GUICtrlSetData(-1, "EN|RU|FR|DE|ES|IT|PT|IN", "EN")
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")
