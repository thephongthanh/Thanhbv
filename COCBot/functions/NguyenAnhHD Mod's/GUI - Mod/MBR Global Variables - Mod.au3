; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Global Variables - Mod
; Description ...: Extension of MBR Global Variables for Mod
; Syntax ........: #include , Global
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

; Multi Finger Attack Style Setting
Global Enum $directionLeft, $directionRight
Global Enum $sideBottomRight, $sideTopLeft, $sideBottomLeft, $sideTopRight
Global Enum $mfRandom, $mfFFStandard, $mfFFSpiralLeft, $mfFFSpiralRight, $mf8FBlossom, $mf8FImplosion, $mf8FPinWheelLeft, $mf8FPinWheelRight
Global $iMultiFingerStyle = 1
Global Enum $eCCSpell = $eHaSpell + 1

;Variables for SwitchAcc Mode - DEMEN
Global $profile = $sProfilePath & "\Profile.ini"
Global $aconfig[8]
Global $ichkSwitchAcc = 0
Global $ichkTrain = 0

Global $icmbTotalCoCAcc		; 1 = 1 account, 2 = 2 accounts
Global $nTotalCoCAcc = 6
Global $ichkSmartSwitch = 1

Global $ichkCloseTraining = 0

Global $nCurProfile = 1
Global $ProfileList
Global $nTotalProfile = 1

Global $ProfileType			; Type of the Current Profile, 1 = active, 2 = donate, 3 = idle
Global $aProfileType[8]		; Type of the all Profiles, 1 = active, 2 = donate, 3 = idle

Global $MatchProfileAcc		; Account match with Current Profile
Global $aMatchProfileAcc[8]	; Accounts match with All Profiles

Global $DonateSwitchCounter = 0

Global $bReMatchAcc = False

Global $aTimerStart[8]
Global $aTimerEnd[8]
Global $aRemainTrainTime[8]
Global $aUpdateRemainTrainTime[8]
Global $nNexProfile
Global $nMinRemainTrain

Global $aCCRemainTime[8]
Global $aUpdateCCRemainTime[8]
Global $nMinCCRemain
Global $nNexProfileReqCC

Global $aAccPosY[6]

; Adding QuickTrainCombo - DEMEN
Global 	$iRadio_Army12, $iRadio_Army123

#region Check Collectors Outside
; collectors outside filter
Global $ichkDBMeetCollOutside, $iDBMinCollOutsidePercent, $iCollOutsidePercent ; check later if $iCollOutsidePercent obsolete

; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335 ; check later if $THEllipseWidth, $THEllipseHeigth obsolete
Global $hBitmapFirst
#endregion

Global $lastModversion = "" ;latest version from GIT
Global $lastModmessage = "" ;message for last version
Global $oldModversmessage = "" ;warning message for old bot

; Auto Hide
Global $ichkAutoHide ; AutoHide mode enabled disabled
Global $ichkAutoHideDelay

; CSV Speed
Global $cmbCSVSpeed[2] = [$LB, $DB]
Global $icmbCSVSpeed[2] = [$LB, $DB]
Global $Divider
