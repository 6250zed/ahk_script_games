#NoEnv
#SingleInstance Force
#InstallMouseHook
#UseHook On
#MaxHotkeysPerInterval 200
#HotkeyInterval 2000

SendMode Event
SetTitleMatchMode, 2

enabled := true      ; true = active, false = disabled
toggle  := false     ; false -> send 3, true -> send 2

; ---- Global toggle ----
F1::
    enabled := !enabled
    Tooltip, % (enabled ? "ENABLED" : "DISABLED")
    SetTimer, RemoveTip, -1000
return

; ---- Global exit (works anywhere) ----
^+Esc::ExitApp

RemoveTip:
    Tooltip
return

#IfWinActive ahk_exe gunz.exe

*tab::tab
*a::a
*s::s
*c::c
return

*XButton1::
    toggle := !toggle
    SendInput, % toggle ? "{2}" : "{3}"
    shiftEnabled := true
    shiftHeld := false
return

; F1 types the string quickly.
F2::
    delayMs := 20
    SendInput, {Text}J3522722554
    Sleep, %delayMs%
return

; Mode state
shiftEnabled := false
shiftHeld    := false

; Alt disables hold functionality and turns off toggle
~*XButton2::
    if (!enabled)
        return
    toggle := false
    shiftEnabled := false
    shiftHeld := false
    SendInput, {1}
return

; RButton only acts as hold-modifier when shift mode is enabled
~*RButton::
    if (!enabled || !shiftEnabled)
        return
    shiftHeld := true
return

~*RButton Up::
    if (!enabled)
        return
    shiftHeld := false
return

; LButton behavior depends on ON/OFF + hold state
~*LButton::
    if (!enabled)
        return
        SendInput, {e}
    if (shiftEnabled && shiftHeld) {
        toggle := !toggle
        SendInput, % toggle ? "{2}" : "{3}"
    } else {
        SendInput, {e}
    }
return
#IfWinActive#NoEnv
#SingleInstance Force
#InstallMouseHook
#UseHook On
#MaxHotkeysPerInterval 200
#HotkeyInterval 2000

SendMode Event
SetTitleMatchMode, 2

enabled := true      ; true = active, false = disabled
toggle  := false     ; false -> send 3, true -> send 2

; ---- Global toggle ----
XButton2::
    enabled := !enabled
    Tooltip, % (enabled ? "ENABLED" : "DISABLED")
    SetTimer, RemoveTip, -1000
return

; ---- Global exit (works anywhere) ----
^+Esc::ExitApp

RemoveTip:
    Tooltip
return

#IfWinActive ahk_exe gunz.exe

*tab::tab
*a::a
*s::s
*c::c
return

*z::
    toggle := !toggle
    SendInput, % toggle ? "{2}" : "{3}"
    shiftEnabled := true
    shiftHeld := false
return

; F1 types the string quickly.
F1::
    delayMs := 20
    SendInput, {Text}J3522722554
    Sleep, %delayMs%
return

; Mode state
shiftEnabled := false
shiftHeld    := false

; Alt disables hold functionality and turns off toggle
~*LAlt::
    if (!enabled)
        return
    toggle := false
    shiftEnabled := false
    shiftHeld := false
    SendInput, {1}
return

; LButton only acts as hold-modifier when shift mode is enabled
~*LButton::
    if (!enabled || !shiftEnabled)
        return
    shiftHeld := true
return

~*LButton Up::
    if (!enabled)
        return
    shiftHeld := false
return

; RButton behavior depends on ON/OFF + hold state
~*RButton::
    if (!enabled)
        return
        SendInput, {e}
    if (shiftEnabled && shiftHeld) {
        toggle := !toggle
        SendInput, % toggle ? "{2}" : "{3}"
    } else {
        SendInput, {e}
    }
return
#IfWinActive
