#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force

;0 - Regular Gaming / Screen capture and video
;1 - Stream functions

switchIndex:=0

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
            MsgBox, TEST CLEAR
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