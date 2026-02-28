#NoEnv
#SingleInstance Force
#InstallKeybdHook
#UseHook On
SendMode event
SetTitleMatchMode, 2

enabled := true      ; true = active, false = disabled
toggle  := false     ; false -> send 4, true -> send 3

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

; tab, a,s, and x moves left-forward-back-right and also sends 1

*tab::tab
*a::a
*s::s
*c::c
return

; Alt key also sends 1.
~*LAlt::
    if (!enabled)
        return
    SendInput, {1}
return

; x alternates between 2 and 3.
*x::
    if (!enabled)
        return
    toggle := !toggle
    SendInput, % toggle ? "{2}" : "{3}"
return

; \ types the string slowly.
F1::
    delayMs := 20  ; delay between sends

    ; send as literal text
    SendInput, {Text}J3522722554

    Sleep, %delayMs%
return

shiftMode := false   ; true only while LButton is physically held

; LButton acts as a temporary modifier (momentary shift mode).
~*LButton::
    shiftMode := true
return

~$*LButton Up::
    shiftMode := false
return

; RButton does different output based on the temporary shift state.
~*RButton::
    ; If we're disabled and we'd otherwise do the shiftMode action, bail out BEFORE Shift down.
    if (shiftMode && !enabled)
        return

    SendInput, {Shift down}

    if (shiftMode) {
        toggle := !toggle
        SendInput, % toggle ? "{2}" : "{3}"
    } else {
        SendInput, f
    }
return

~*RButton up::
    SendInput, {Shift up}
return


#IfWinActive
