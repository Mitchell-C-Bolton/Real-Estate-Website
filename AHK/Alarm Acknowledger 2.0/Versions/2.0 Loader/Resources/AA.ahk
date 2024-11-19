/* Information 
Version: 2.0
Name: Mitchell Bolton
Date: 08/29/2019
Changes: Complete rework from AA V1.0
SIM: 
- https://t.corp.amazon.com/CORPSEC-3664/communication
- https://issues.amazon.com/issues/P27694545
- https://issues.amazon.com/issues/P25486504
*/

#SingleInstance force

;---------------------------------------------------------------------------------------- Presets

SetKeyDelay, 50
FormatTime, Date,, MM/dd/yyyy
FormatTime, Time,, HHmm
SetNumLockState, AlwaysOn

;---------------------------------------------------------------------------------------- AA Background Generator


SetWorkingDir, C:\ProgramData\AlarmAcknowledger\Resources

Random, PictureNumber , 1, 20

If (PictureNumber = 1)
{
BackgroundImmage = AAcknowledgerGUI1.png
}
Else If (PictureNumber = 2)
{
BackgroundImmage = AAcknowledgerGUI2.png
}
Else If (PictureNumber = 3)
{
BackgroundImmage = AAcknowledgerGUI3.png
}
Else If (PictureNumber = 4)
{
BackgroundImmage = AAcknowledgerGUI4.png
}
Else If (PictureNumber = 5)
{
BackgroundImmage = AAcknowledgerGUI5.png
}
Else If (PictureNumber = 6)
{
BackgroundImmage = AAcknowledgerGUI6.png
}
Else If (PictureNumber = 7)
{
BackgroundImmage = AAcknowledgerGUI7.png
}
Else If (PictureNumber = 8)
{
BackgroundImmage = AAcknowledgerGUI8.png
}
Else If (PictureNumber = 9)
{
BackgroundImmage = AAcknowledgerGUI9.png
}
Else If (PictureNumber = 10)
{
BackgroundImmage = AAcknowledgerGUI10.png
}
Else If (PictureNumber = 11)
{
BackgroundImmage = AAcknowledgerGUI11.png
}
Else If (PictureNumber = 12)
{
BackgroundImmage = AAcknowledgerGUI12.png
}
Else If (PictureNumber = 13)
{
BackgroundImmage = AAcknowledgerGUI13.png
}
Else If (PictureNumber = 14)
{
BackgroundImmage = AAcknowledgerGUI14.png
}
Else If (PictureNumber = 15)
{
BackgroundImmage = AAcknowledgerGUI15.png
}
Else If (PictureNumber = 16)
{
BackgroundImmage = AAcknowledgerGUI16.png
}
Else If (PictureNumber = 17)
{
BackgroundImmage = AAcknowledgerGUI17.png
}
Else If (PictureNumber = 18)
{
BackgroundImmage = AAcknowledgerGUI18.png
}
Else If (PictureNumber = 19)
{
BackgroundImmage = AAcknowledgerGUI19.png
}
Else If (PictureNumber = 20)
{
BackgroundImmage = AAcknowledgerGUI20.png
}

;---------------------------------------------------------------------------------------- Making All GUI's 

WM_MOUSEMOVE( wparam, lparam, msg, hwnd )
{
	if wparam = 1 ; LButton
		PostMessage, 0xA1, 2,,, A ; WM_NCLBUTTONDOWN
}

OnMessage( 0x200, "WM_MOUSEMOVE" )

;---------------------------------------------------------------------------------------- Groups

GroupAdd, Lenel, ahk_class RAIL_WINDOW
GroupAdd, Lenel, ahk_class TscShellContainerClass

GroupAdd, AlarmAcknowledgment, Alarm Acknowledgment (BAC-RDS.CORP.AMAZON.COM)
GroupAdd, AlarmAcknowledgment, Alarm Acknowledgment (GS-TS-BR-NA.CORP.AMAZON.COM)
GroupAdd, AlarmAcknowledgment, Alarm Acknowledgment (gs-app-ue1d022p.ant.amazon.com)
GroupAdd, AlarmAcknowledgment, ahk_class TscShellContainerClass


GroupAdd, FastGroup, Fast/Group Acknowledge (BAC-RDS.CORP.AMAZON.COM)
GroupAdd, FastGroup, Fast/Group Acknowledge (GS-TS-BR-NA.CORP.AMAZON.COM)
GroupAdd, FastGroup, Fast/Group Acknowledge (gs-app-ue1d022p.ant.amazon.com)
GroupAdd, FastGroup, ahk_class TscShellContainerClass

GroupAdd, Acknowledgeselectedalarms, Acknowledge selected alarms (BAC-RDS.CORP.AMAZON.COM)
GroupAdd, Acknowledgeselectedalarms, Acknowledge selected alarms (GS-TS-BR-NA.CORP.AMAZON.COM)
GroupAdd, Acknowledgeselectedalarms, Acknowledge selected alarms (gs-app-ue1d022p.ant.amazon.com)
GroupAdd, Acknowledgeselectedalarms, ahk_class TscShellContainerClass


;---------------------------------------------------------------------------------------- Acknowledge GUI

acknowledgeX = 816
acknowledgeY = 437

^0::
^Numpad0::

Gui, Destroy
Gui, Color, Black,White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Picture, x0 y0 h199 w160,  %A_WorkingDir%\%BackgroundImmage%
Gui, Add, Text,x10 y7 BackgroundTrans, Responder
Gui, Add, DropDownList, W137 vResponder, Alarm Responder||Fixed Post|Security Manager|IT Representative|ACS Operator|Other
Gui, Add, Text, BackgroundTrans, Alarm Cause
Gui, Add, DropDownList, W137 vCause, Improper Device Use||Device Malfunction|Planned Work|Unplanned Work|Policy Violation|Incident|Other
Gui, Add, Checkbox, Color  yp+30 w13 h13  vPriority, Priority Alarm
Gui, Add, Text, BackgroundTrans yp x27, Priority Alarm
Gui, Add, Checkbox, Color x10 yp+20 w13 h13 vDay0, Day 0
Gui, Add, Text, BackgroundTrans yp x27, Day 0
Gui, Add, Checkbox, Color x10 yp+20 w13 h13 vSLA, SLA
Gui, Add, Text, BackgroundTrans yp x27, SLA
Gui, Add, Button, -Background x10 yp+20 Default gContinue, Acknowledge
Gui, Add, Button, yp x100, Cancel
GuiControl, focus, Acknowledge

Gui, Margin , x0, Y0
Gui, Show, x%acknowledgeX% y%acknowledgeY% , Alarm Acknowledger

return

;---------------------------------------------------------------------------------------- SLA GUI

Continue:

WinGetPos, acknowledgeX, acknowledgeY,,,Alarm Acknowledger

ReloadSLAInformation:

Gui, submit
Gui, destroy

If (SLA = 1)
{
Gui, Color, Black,White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Picture, x0 y0 h280 w397,  %A_WorkingDir%\%BackgroundImmage%

Gui, Add, Text, BackgroundTrans x80 y7, BAC
Gui, Add, Text, BackgroundTrans x280 yp, System
Gui, Add, Text, BackgroundTrans x80 y127, Guard
Gui, Add, Text, BackgroundTrans x280 yp, Facility

Gui, Add, GroupBox, Color x10 y20 w175 h100
Gui, Add, GroupBox, Color x210 y20 w175 h100
Gui, Add, GroupBox, Color x10 y140 w175 h100
Gui, Add, GroupBox, Color x210 y140 w175 h100

Gui, Add, Checkbox, color w13 h13 x20 y37 vOversightSLA, Oversight
Gui, Add, Text, BackgroundTrans x37 yp, Operator oversight
Gui, Add, Checkbox, color w13 h13 x20 yp+20 vTriageSLA, Event triage
Gui, Add, Text, BackgroundTrans x37 yp, Event triage


Gui, Add, Checkbox, color w13 h13 x220 y37 vCameraSLA, Camera
Gui, Add, Text, BackgroundTrans x237 yp, Camera outage
Gui, Add, Checkbox, color w13 h13 x220 yp+20  vAlarmLatencySLA, Latency
Gui, Add, Text, BackgroundTrans x237 yp, Alarm latency
Gui, Add, Checkbox, color w13 h13 x220 yp+20  vLenelOutageSLA, Outage
Gui, Add, Text, BackgroundTrans x237 yp, Lenel outage

Gui, Add, Checkbox, color w13 h13 x20 y157  vLocationSLA, Location
Gui, Add, Text, BackgroundTrans x37 yp, Couldn't reach location
Gui, Add, Checkbox, color w13 h13 x20 yp+20  vBadgeSLA, Badge
Gui, Add, Text, BackgroundTrans x37 yp, Did not scan badge
Gui, Add, Checkbox, color w13 h13 x20 yp+20  vCallbackSLA, Callback
Gui, Add, Text, BackgroundTrans x37 yp, Did not callback
Gui, Add, Checkbox, color w13 h13 x20 yp+20  vLateSLA, Late
Gui, Add, Text, BackgroundTrans x37 yp, Late / No show

Gui, Add, Checkbox, color w13 h13 x220 y157  vPWorkSLA, PWork
Gui, Add, Text, BackgroundTrans x237 yp, Planned work
Gui, Add, Checkbox, color w13 h13 x220 yp+20  vUPWorkSLA, UWork
Gui, Add, Text, BackgroundTrans x237 yp, Unplanned work
Gui, Add, Checkbox, color w13 h13 x220 yp+20  vPWorkMSLA, PWorkM
Gui, Add, Text, BackgroundTrans x237 yp, Planned work (mitigated)
Gui, Add, Checkbox, color w13 h13 x220 yp+20  vUPWorkMSLA, UPWorkM
Gui, Add, Text, BackgroundTrans x237 yp, Unlanned work (mitigated)

Gui, Add, Button, x10 yp+30 Default gContinue2, Acknowledge
Gui, Add, Button, yp x100, Cancel
GuiControl, focus, Acknowledge
Gui, Margin , x0, Y0
Gui, Show, Center x%acknowledgeX% y%acknowledgeY%, SLA Information

Return
}

Continue2:

If (SLA = 1)
{
WinGetPos, acknowledgeX, acknowledgeY,,,SLA Information
}

Gui, submit
Gui, destroy

;---------------------------------------------------------------------------------------- SLA Failure Required Boxes

If (SLA = 1 and LocationSLA = 0 and OversightSLA = 0 and TriageSLA = 0 and CameraSLA = 0 and AlarmLatencySLA = 0 and LenelOutageSLA = 0 and LocationSLA = 0 and BadgeSLA = 0 and CallbackSLA = 0 and LateSLA = 0 and PWorkSLA = 0 and UPWorkSLA = 0 and PWorkMSLA = 0 and UPWorkMSLA = 0)
{
MsgBox,48,Error,Missing Information
Gosub, ReloadSLAInformation
return
}

;---------------------------------------------------------------------------------------- Variable Clearing GUI

ReloadVariableClearingGUI:

If (Responder = "Other" or Cause = "Other" or Cause = "Device Malfunction"  or Cause = "Incident" or (TriageSLA= 1 and SLA = 1) or (CameraSLA= 1 and SLA = 1) or (AlarmLatencySLA= 1 and SLA = 1) or (LenelOutageSLA= 1 and SLA = 1) or (LocationSLA= 1 and SLA = 1))
{

VariableClearing = True
Gosub VariableClearingGUISize
Gui, Color, Black, White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Picture, icon x0 y0 h%Height% w%Width%, %A_WorkingDir%\%BackgroundImmage%
Gui, Add, Edit, h0 w0 x10 y0, GUIControllPosition

;---------------------------------------------------------------------------------------- Main Variables

If (Responder = "Other")
{
Gui, Add, Text, BackgroundTrans, Responder:
Gui, Add, Edit, w130 vResponder
}

If (Cause = "Other")
{
Gui, Add, Text, BackgroundTrans, Cause:
Gui, Add, Edit, w130 vCause
GuiControl, focus, Cause
}

If (Cause = "Device Malfunction")
{
Gui, Add, Text, BackgroundTrans, Device Reference#:
Gui, Add, DropDownList, vDeviceMalfuncitonType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vDeviceTT
GuiControl, focus, DeviceTT
}

If (Cause = "Incident" and IncidentD3Number = "")
{
Gui, Add, Text,BackgroundTrans, Incident D3#:
Gui, Add, Edit, w130 vIncidentD3Number
GuiControl, focus, IncidentD3Number
}

;---------------------------------------------------------------------------------------- SLA System


If (CameraSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Camera:
Gui, Add, DropDownList, vCameraSLAType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vCameraSLATT
GuiControl, focus, CameraSLATT
}

If (LenelOutageSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Lenel Outage:
Gui, Add, DropDownList, vLenelOutageType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vLenelOutageTT
GuiControl, focus, LenelOutageTT
}

If (AlarmLatencySLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Alarm Latency:
Gui, Add, DropDownList, vAlarmLatencyType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vAlarmLatencyTT
GuiControl, focus, AlarmLatencyTT
}

;---------------------------------------------------------------------------------------- SLA ACS

If (TriageSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Triage:
Gui, Add, DropDownList, vTriageType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vTriageTT
GuiControl, focus, TriageTT
}

;---------------------------------------------------------------------------------------- SLA Guard

If (LocationSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Access Request:
Gui, Add, DropDownList, vLocationType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vLocationTT
GuiControl, focus, LocationTT
}

;---------------------------------------------------------------------------------------- SLA end

Gui, Add, Button, Default gContinue3, Acknowledge
Gui, Add, Button, yp x95, Cancel

Gui, Margin , x0, Y0
Gui, Show, x%acknowledgeX% y%acknowledgeY%, Information

return

;---------------------------------------------------------------------------------------- Variabel Clearing Size/Picture

VariableClearingGUISize:

Gui, Color, Black, White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Edit, h0 w0 x10 y0, GUIControllPosition

;---------------------------------------------------------------------------------------- Main Variables

If (Responder = "Other")
{
Gui, Add, Text, BackgroundTrans, Responder:
Gui, Add, Edit, w130 vResponder
}

If (Cause = "Other")
{
Gui, Add, Text, BackgroundTrans, Cause:
Gui, Add, Edit, w130 vCause
GuiControl, focus, Cause
}

If (Cause = "Device Malfunction")
{
Gui, Add, Text, BackgroundTrans, Device Reference#:
Gui, Add, DropDownList, vDeviceMalfuncitonType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vDeviceTT
GuiControl, focus, DeviceTT
}

If (Cause = "Incident" and IncidentD3Number = "")
{
Gui, Add, Text,BackgroundTrans, Incident D3#:
Gui, Add, Edit, w130 vIncidentD3Number
GuiControl, focus, IncidentD3Number
}

;---------------------------------------------------------------------------------------- SLA System

If (CameraSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Camera:
Gui, Add, DropDownList, vCameraSLAType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vCameraSLATT
GuiControl, focus, CameraSLATT
}

If (LenelOutageSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Lenel Outage:
Gui, Add, DropDownList, vLenelOutageType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vLenelOutageTT
GuiControl, focus, LenelOutageTT
}

If (AlarmLatencySLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Alarm Latency:
Gui, Add, DropDownList, vAlarmLatencyType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vAlarmLatencyTT
GuiControl, focus, AlarmLatencyTT
}

;---------------------------------------------------------------------------------------- SLA Guard

If (TriageSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Triage:
Gui, Add, DropDownList, vTriageType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vTriageTT
GuiControl, focus, TriageTT
}

;---------------------------------------------------------------------------------------- SLA Guard

If (LocationSLA= 1 and SLA = 1)
{
Gui, Add, Text,BackgroundTrans, Guard Access Request:
Gui, Add, DropDownList, vLocationType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vLocationTT
GuiControl, focus, LocationTT
}

;---------------------------------------------------------------------------------------- SLA end

Gui, Add, Button, Default, Acknowledge
Gui, Add, Button, yp+4 x99, Cancel

Gui, Margin , x0, Y0

Gui, Show, x%acknowledgeX% y%acknowledgeY%, InformationSize

WinGetPos,,, Width, Height, InformationSize
WinGetPos, acknowledgeX, acknowledgeY,,, InformationSize

Gui, destroy

return
}

;---------------------------------------------------------------------------------------- SLA end end

Continue3:

If (VariableClearing = "True")
{
WinGetPos, acknowledgeX, acknowledgeY,,, Information
}

Gui, submit
Gui, destroy

;---------------------------------------------------------------------------------------- Variable Clearing GUI Required Boxes

If ((Cause = "Incident" and IncidentD3Number = "") or (Cause = "Device Malfunction" and DeviceTT = ""))
{
MsgBox,48,Error,Missing Information
Gosub, ReloadVariableClearingGUI
return
}

If ((SLA = 1 and TriageSLA = 1 and TriageTT = "") or (SLA = 1 and CameraSLA = 1 and CameraSLATT = "") or (SLA = 1 and AlarmLatencySLA = 1 and AlarmLatencyTT = "") (SLA = 1 and LenelOutageSLA = 1 and LenelOutageTT = "") or (SLA = 1 and LocationSLA = 1 and LocationTT = ""))
{
MsgBox,48,Error,Missing Information
Gosub, ReloadVariableClearingGUI
return
}

If (Cause = "")
{
MsgBox,48,Error,Missing Information
Cause = Other
Gosub, ReloadVariableClearingGUI
return
}

If (Responder = "")
{
MsgBox,48,Error,Missing Information
Responder = Other
Gosub, ReloadVariableClearingGUI
return
}

;---------------------------------------------------------------------------------------- ROS Logic

If (Responder = "ACS Operator")
{
Responder =%A_UserName%
ROS =CCTV Review;
}
Else
{
ROS =ROS;
}

;---------------------------------------------------------------------------------------- Day0 Logic

If (Day0 = 1)
{
Day0 =; Day 0
}
Else
{
Day0 =
}

;---------------------------------------------------------------------------------------- Priority Logic

If (Priority = 1)
{
PriorityText =; Responder has inspected the device; The responder stated they scanned their badge at the security device
}
else
{
PriorityText =
}

;---------------------------------------------------------------------------------------- Cause Logic

If (Cause = "Device Malfunction")
{
DTTText =; Device %DeviceMalfuncitonType%:%DeviceTT%
}
else
{
DTTText =
}

If (Cause = "Incident")
{
IncidentText =; D3:%IncidentD3Number%
}
Else
{
IncidentText =
}

;---------------------------------------------------------------------------------------- SLA Logic

If (SLA = 1)
{
	SLAText=; SLA
	Ownership =; Ownership
	Type =; Type
}
else
{
	SLAText=
	Ownership =
	Type =
}

;---------------------------------------------------------------------------------------- TRUE / FALSE Logic

If (OversightSLA = 1 or TriageSLA = 1 or AlarmLatencySLA = 1 or CallbackSLA = 1 or LateSLA = 1 or BadgeSLA = 1 or PWorkSLA or UPWorkSLA or LenelOutageSLA = 1)
{
	TF =; True
}
else if (CameraSLA = 1  or LocationSLA = 1 PWorkMSLA = 1 or UPWorkMSLA)
{
	TF =; False
}
else
{
TF =
}

;---------------------------------------------------------------------------------------- SLA Ownership Logic

If (OversightSLA = 1 or TriageSLA = 1)
{
	ACSOwnership =/ACS
}
Else
{
	ACSOwnership =
}

If (DeviceSLA = 1 or CameraSLA = 1 or AlarmLatencySLA = 1 or LenelOutageSLA = 1)
{
	SystemOwnership =/System
}
Else
{
	SystemOwnership =
}

If (LocationSLA = 1 or BadgeSLA = 1 or CallbackSLA = 1 or LateSLA = 1)
{
	GuardOwnership =/Guard
}
Else
{
	GuardOwnership =
}

If (PWorkSLA = 1 or UPWorkSLA or PWorkMSLA or UPWorkMSLA)
{
	FacilityOwnership =/Facility
}
Else
{
	FacilityOwnership =
}

;---------------------------------------------------------------------------------------- SLA Type Logic

If (OversightSLA = 1)
{
	SLAType1 =/Oversight
}
else
{
	SLAType1 =
}
If (TriageSLA = 1)
{
	SLAType2 =/Triage
}
else
{
	SLAType2 =
}
If (CameraSLA = 1)
{
	SLAType4 =/Camera
}
else
{
	SLAType4 =
}
If (AlarmLatencySLA = 1)
{
	SLAType5 =/Latency
}
else
{
	SLAType5 =
}
If (LenelOutageSLA = 1)
{
	SLAType6 =/Outage
}
else
{
	SLAType6 =
}
If (LocationSLA = 1)
{
	SLAType7 =/Location
}
else
{
	SLAType7 =
}
If (BadgeSLA = 1)
{
	SLAType8 =/Badge
}
else
{
	SLAType8 =
}
If (CallbackSLA = 1)
{
	SLAType9 =/Call
}
else
{
	SLAType9 =
}
If (LateSLA = 1)
{
	SLAType10 =/Late
}
else
{
	SLAType10 =
}
If (PWorkSLA = 1)
{
	SLAType11 =/Planned Work
}
else
{
	SLAType11 =
}
If (UPWorkSLA = 1)
{
	SLAType12 =/Unplanned Work
}
else
{
	SLAType12 =
}
If (PWorkMSLA = 1)
{
	SLAType13 =/Planed Work Mitigated
}
else
{
	SLAType13 =
}
If (UPWorkMSLA = 1)
{
	SLAType14 =/Unplanned Work Mitigated
}
else
{
	SLAType14 =
}

;---------------------------------------------------------------------------------------- SLA Reference Logic

If (CameraSLA = 1)
{
	CameraSLAText =; Camera %CameraSLAType%:%CameraSLATT%
}
Else
{
	CameraSLAText =
}

If (LenelOutageSLA = 1)
{
	LenelOutageText =; Lenel %LenelOutageType%:%LenelOutageTT%
}
Else
{
	LenelOutageText =
}

If (AlarmLatencySLA = 1)
{
	AlarmLatencyText =; Alarm %AlarmLatencyType%:%AlarmLatencyTT%
}
Else
{
	AlarmLatencyText =
}

If (TriageSLA = 1)
{
	TriageText =; Triage %TriageType%:%TriageTT%
}
Else
{
	TriageText =
}

If (LocationSLA = 1)
{
	LocationText =; Location %LocationType%:%LocationTT%
}
Else
{
	LocationText =
}

;---------------------------------------------------------------------------------------- Clipboard String

Clipboard =
(
%ROS% %Responder%; %Cause%%Day1%%DTTText%%IncidentText%%CameraSLAText%%LenelOutageText%%AlarmLatencyText%%TriageText%%LocationText%%SLAText%%TF%%Ownership%%ACSOwnership%%SystemOwnership%%GuardOwnership%%FacilityOwnership%%Type%%SLAType1%%SLAType2%%SLAType4%%SLAType5%%SLAType6%%SLAType7%%SLAType8%%SLAType9%%SLAType10%%SLAType11%%SLAType12%%SLAType13%%SLAType14%%PriorityText%
)

;---------------------------------------------------------------------------------------- Lenel Interaction

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel
}

Send,^{F12}

WinWait, ahk_group FastGroup,,1
if ErrorLevel
{
MsgBox,48,Error,Lenel Not Found.`nClear Results have been coppied to your clipboard.
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,a

WinWait, ahk_group Acknowledgeselectedalarms,,1
if ErrorLevel
{
MsgBox,48,Error,Acknowledge Box Not Found.`nClear Results have been coppied to your clipboard.
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

IfWinNotActive, ahk_group LenelAcknowledgeselectedalarms,,1
{
WinActivate, ahk_group Acknowledgeselectedalarms
}

SendInput,^v

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return

;---------------------------------------------------------------------------------------- Quck Clear Gui

^1::
^Numpad1::

Gui, Destroy
Gui, Color, Black,White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Picture, x0 y0 h138 w105, %A_WorkingDir%\%BackgroundImmage%
Gui, Add, Button, Default gConstruction W85 x10 y10, Construction
Gui, Add, Button, gNVR W85, NVR
Gui, Add, Button, gUCTCGUI W85, UCTC
Gui, Add, Button, W85, Cancel
Gui, Margin , x0, Y0
Gui, Show, x%acknowledgeX% y%acknowledgeY%, Quick Clear

Return

;--------------------------------------------------------------------------------------- UC Logic

Construction:

WinGetPos, acknowledgeX, acknowledgeY,,,Quick Clear

Gui, Submit
Gui, Destroy

Clipboard =
(
Under Construction
)

;--------------------------------------------------------------------------------------- UC Lenel Interaction

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel
}

Send,^{F12}

WinWait, ahk_group FastGroup,,1
if ErrorLevel
{
MsgBox,48,Error,Lenel Not Found.`nClear Results have been coppied to your clipboard.
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,a

WinWait, ahk_group Acknowledgeselectedalarms,,1
if ErrorLevel
{
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}
Send,^v
Send,{Enter}
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
return

;--------------------------------------------------------------------------------------- Auto SHM TT Logic

NVR:

WinGetPos, acknowledgeX, acknowledgeY,,,Quick Clear

Gui, Submit
Gui, Destroy

Clipboard =
(
Auto System Health Ticket Generated
)

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel
}

Send,^{F12}

WinWait, ahk_group FastGroup,,1
if ErrorLevel
{
MsgBox,48,Error,Lenel Not Found.`nClear Results have been coppied to your clipboard.
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,a

WinWait, ahk_group Acknowledgeselectedalarms,,1
if ErrorLevel
{
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,^v

Send,{Enter}

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return

;---------------------------------------------------------------------------------------- UCTC Logic

UCTCGUI:

WinGetPos, acknowledgeX, acknowledgeY,,,Quick Clear

UCTCGUIReturn:

Gui, Submit
Gui, Destroy

Gui, Color, Black,White
Gui, +alwaysontop +ToolWindow -Border -Theme
Gui, Font, w800 s9, Calibri
Gui, Add, Picture, x0 y0 h100 w152,  %A_WorkingDir%\%BackgroundImmage%

Gui, Add, DropDownList, x10 y10 vUCTCWorkType W55, TT||MCM|SIM|D3
Gui, Add, Edit, w130 vUCTCReference
Gui, Add, Button, Default gUCTCLogic, Acknowledge
Gui, Add, Button, yp x95, Cancel
GuiControl, Focus, UCTCReference
Gui, Margin , x0, Y0

Gui, Show, x%acknowledgeX% y%acknowledgeY%, Update

Return

UCTCLogic:

WinGetPos, acknowledgeX, acknowledgeY,,,Update

Gui, Submit
Gui, Destroy

If (UCTCReference = "")
{
MsgBox,48,Missing Information,-  UCTC %UCTCReference%
Gosub, UCTCGUIReturn
return
}

Clipboard =
(
UCTC; %UCTCWorkType%:%UCTCReference%; %Date%; %Time%
)

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel
}

Send,^{F12}

WinWait, ahk_group FastGroup,,1
if ErrorLevel
{
MsgBox,48,Error,Lenel Not Found.`nClear Results have been coppied to your clipboard.
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,a

WinWait, ahk_group Acknowledgeselectedalarms,,1
if ErrorLevel
{
Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}
Reload
return
}

Send,^v

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return


;---------------------------------------------------------------------------------------- In Progress

^Up::
^6::

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel,,2
}

Send,^{F12}

Send,i

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return

;--------------------------------------------------------------------------------------- Delete

^Delete::

Gui, Destroy

IfWinNotActive, ahk_group Lenel
{
WinActivate, ahk_group Lenel
}

Send,^{F11}
Send,^{Delete}
Send,{Enter}
Send,{Enter}
Send,{Down}
Send,{Down}
Send,{Up}

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return

;--------------------------------------------------------------------------------------- Cancel button

ButtonCancel:

WinGetPos, acknowledgeX, acknowledgeY

Gui, Destroy

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return

;--------------------------------------------------------------------------------------- Emergency exit

^!Esc::
Gui, Destroy

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

ExitApp

;--------------------------------------------------------------------------------------- Restart Script

~Esc::

Gui, Destroy

Send,{LWin up}{RWin up}{Control up}{LControl up}{RControl up}{Alt up}{LAlt up}{RAlt up}

return