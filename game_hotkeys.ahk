#NoEnv
#SingleInstance Force
#InstallMouseHook
#UseHook On
SendMode Event
SetTitleMatchMode, 2

shiftMode := false   ; true only while RButton is physically held

RemoveTip:
    Tooltip
return

#IfWinActive ahk_exe gunz.exe

; RButton acts as a temporary modifier (momentary shift mode).
~*RButton::
    shiftMode := true
return

~*RButton Up::
    shiftMode := false
return

; LButton does different output based on the temporary shift state.
~*LButton::
    if (shiftMode)
        SendInput, {2}
    else
        SendInput, {r}
return

#IfWinActive
