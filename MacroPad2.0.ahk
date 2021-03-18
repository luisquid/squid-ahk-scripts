#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force

;0 - Regular Gaming / Screen capture and video
;1 - Stream functions

switchIndex:=0
toggleMic:= false

NumpadHome::
return

NumpadUp::
return

NumpadPgUp::
return

NumpadLeft::
switch switchIndex
    {
        ;SLEEP PC
        case 0:
            Send #xus
            return
       
        
        case 1: 
            Send, ^{F1}
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadClear::
switch switchIndex
    {
        ;TEST
        case 0:
            MsgBox, TEST CLEARus
            return
       
        
        case 1: 
            MsgBox, Stream Mode Key
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadRight::
switch switchIndex
    {
        ;SLEEP PC
        case 0:
            MsgBox, GAME MODE KEY
            return
       
        
        case 1: 
            MsgBox, Stream Mode Key
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadEnd::
switch switchIndex
    {
        ;NVIDIA GAME SCREENSHOT
        case 0:
            Send, +{F2}
            return
        
        ;VOICEMEETER MIC MUTE (WORKS WITH VOICEMEETER MACRO BUTTONS)
        case 1: 
            Send, ^{F9}
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadDown::
switch switchIndex
    {
        ;NVIDIA GAME VIDEO CAPTURE
        case 0:
            Send, +{F4}
            return
        case 1: 
            MsgBox, Stream Mode Key
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadPgDn::
switch switchIndex
    {
        ;NVIDIA OVERLAY SETTINGS
        case 0:
            Send, +{F1}
            return
        case 1: 
            MsgBox, Stream Mode Key
            return
        default:
            MsgBox, Default case. 
            return
    }
return

NumpadIns::
    Send, ^{F9}
    
    toggleMic := !toggleMic

    if(toggleMic)
    {
        TrayTip Mic Toggle, Mic has been unmuted,20, 17
        Sleep 3000   ; Let it display for 3 seconds.
        HideTrayTip()

    }

    else
    {
        TrayTip Mic Toggle, Mic has been muted,20, 17
        Sleep 3000   ; Let it display for 3 seconds.
        HideTrayTip()
    }
    
    ; Copy this function into your script to use it.
    HideTrayTip() {
        TrayTip  ; Attempt to hide it the normal way.
        if SubStr(A_OSVersion,1,3) = "10." {
            Menu Tray, NoIcon
            Sleep 200  ; It may be necessary to adjust this sleep.
            Menu Tray, Icon
        }
    }
return

;MODE SELECTION  
NumpadDel::
    switchIndex++
    if(switchIndex > 1)
        switchIndex:= 0

    switch switchIndex
    {
        case 0: 
            MsgBox, Game Mode Activated
            return
        case 1: 
            MsgBox, Stream Mode Activated
            return
    }
return