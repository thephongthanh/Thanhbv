; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design - SmartUpgrade
; Description ...: Extension of GUI Design Child Bot - Stats
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

$hGUI_UPGRADE_TAB_ITEM5 = GUICtrlCreateTabItem("SmartUpgrade")

Local $x = 25, $y = 45

$SmartUpgrade = GUICtrlCreateGroup("SmartUpgrade", $x - 20, $y - 20, 430, 335)

$chkSmartUpgrade = GUICtrlCreateCheckbox("Enable SmartUpgrade", $x - 5, $y, -1, -1)
	$txtTip = "Check box to enable automatically starting Upgrades from builders menu"
	_GUICtrlSetTip(-1, $txtTip)
	GUICtrlSetOnEvent(-1, "chkSmartUpgrade")

$IgnoreUpgrades = GUICtrlCreateGroup("Upgrades to ignore", $x - 15, $y + 30, 420, 155)

Local $x = 15, $y = 45

	$iconIgnoreTH = GUICtrlCreateIcon($pIconLib, $eIcnTH11, $x + 5, $y + 50, 40, 40)
	$chkIgnoreTH = GUICtrlCreateCheckbox("", $x + 20, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreTH")

	$iconIgnoreKing = GUICtrlCreateIcon($pIconLib, $eIcnKing, $x + 95, $y + 50, 40, 40)
	$chkIgnoreKing = GUICtrlCreateCheckbox("", $x + 110, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreKing")

	$iconIgnoreQueen = GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x + 140, $y + 50, 40, 40)
	$chkIgnoreQueen = GUICtrlCreateCheckbox("", $x + 155, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreQueen")

	$iconIgnoreWarden = GUICtrlCreateIcon($pIconLib, $eIcnWarden, $x + 185, $y + 50, 40, 40)
	$chkIgnoreWarden = GUICtrlCreateCheckbox("", $x + 200, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreWarden")

	$iconIgnoreCC = GUICtrlCreateIcon($pIconLib, $eIcnCC, $x + 275, $y + 50, 40, 40)
	$chkIgnoreCC = GUICtrlCreateCheckbox("", $x + 290, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreCC")

	$iconIgnoreLab = GUICtrlCreateIcon($pIconLib, $eIcnLaboratory, $x + 365, $y + 50, 40, 40)
	$chkIgnoreLab = GUICtrlCreateCheckbox("", $x + 380, $y + 90, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreLab")

	$iconIgnoreBarrack = GUICtrlCreateIcon($pIconLib, $eIcnBarrack, $x + 5, $y + 120, 40, 40)
	$chkIgnoreBarrack = GUICtrlCreateCheckbox("", $x + 20, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreBarrack")

	$iconIgnoreDBarrack = GUICtrlCreateIcon($pIconLib, $eIcnDarkBarrack, $x + 50, $y + 120, 40, 40)
	$chkIgnoreDBarrack = GUICtrlCreateCheckbox("", $x + 65, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreDBarrack")

	$iconIgnoreFactory = GUICtrlCreateIcon($pIconLib, $eIcnSpellFactory, $x + 140, $y + 120, 40, 40)
	$chkIgnoreFactory = GUICtrlCreateCheckbox("", $x + 155, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreFactory")

	$iconIgnoreDFactory = GUICtrlCreateIcon($pIconLib, $eIcnDarkSpellFactory, $x + 185, $y + 120, 40, 40)
	$chkIgnoreDFactory = GUICtrlCreateCheckbox("", $x + 200, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreDFactory")

	$iconIgnoreGColl = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 275, $y + 120, 40, 40)
	$chkIgnoreGColl = GUICtrlCreateCheckbox("", $x + 290, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreGColl")

	$iconIgnoreEColl = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 320, $y + 120, 40, 40)
	$chkIgnoreEColl = GUICtrlCreateCheckbox("", $x + 335, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreEColl")

	$iconIgnoreDColl = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 365, $y + 120, 40, 40)
	$chkIgnoreDColl = GUICtrlCreateCheckbox("", $x + 380, $y + 160, 17, 17)
	GUICtrlSetOnEvent(-1, "chkIgnoreDColl")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$SmartMinGold = GUICtrlCreateInput("200000", 162, 37, 57, 17, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
	GUICtrlCreateLabel("Gold to save", 224, 40, 64, 17)
	$SmartMinElixir = GUICtrlCreateInput("200000", 162, 57, 57, 17, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
	GUICtrlCreateLabel("Elixir to save", 224, 60, 63, 17)
	$SmartMinDark = GUICtrlCreateInput("1500", 290, 37, 65, 17, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
	GUICtrlCreateLabel("Dark to save", 360, 40, 65, 17)
	GUICtrlCreateLabel("... after launching upgrade", 296, 60, 128, 17)
	$SmartUpgradeLog = GUICtrlCreateEdit("", 10, 232, 420, 124, BitOR($GUI_SS_DEFAULT_EDIT,$ES_READONLY))
	GUICtrlSetData(-1, "                                        ----- SMART UPGRADE LOG -----")

GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")