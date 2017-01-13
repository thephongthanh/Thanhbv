; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design - Simple QuickTrain
; Description ...: This is a part of MBR GUI Design Child Attack - Troops
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Demen
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$x = 10
$y = 45

$grpSimpleQuickTrain = GUICtrlCreateGroup(GetTranslated(701,100, "Options for Simple Quick Train"), $x, $y, 418, 195)
GUICtrlSetState(-1, $GUI_HIDE)

$x = 30
$y += 25

	$chkSimpleQuickTrain = GUICtrlCreateCheckbox(GetTranslated(701,101, "Only Remove Odd Queue Troops"), $x, $y, -1, 15)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlSetOnEvent(-1, "chkSimpleQuickTrain")

$y += 25
	$chkFillArcher = GUICtrlCreateCheckbox(GetTranslated(701,102, "Fill Barracks with Arch:"), $x, $y, 135, 15)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_HIDE)

	$txtFillArcher = GUICtrlCreateInput("5", $x + 140, $y-2, 20, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlSetLimit(-1, 2)

$y += 25
	$chkFillEQ = GUICtrlCreateCheckbox(GetTranslated(701,103, "Fill Barracks with 1 EQ"), $x, $y, -1, 15)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_HIDE)

$y += 25
	$chkTrainDonated = GUICtrlCreateCheckbox(GetTranslated(701,104, "Train Donated Troops"), $x, $y, -1, 15)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetState(-1, $GUI_HIDE)

GUICtrlCreateGroup("", -99, -99, 1, 1)
