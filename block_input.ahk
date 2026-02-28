#NoEnv
#SingleInstance Force
#InstallKeybdHook
#UseHook On
#MenuMaskKey vkE8
SendMode Event
SetTitleMatchMode, 2

; ------------------------------
; Alt-based task switching/menu keys
; ------------------------------

; Block Alt+Tab reliably (repeat-proof)
*$!Tab::
    KeyWait, Tab
    SendInput {Blind}{Alt Up}
return

; Block Alt+Esc (window cycling)
*$!Esc::
    KeyWait, Esc
    SendInput {Blind}{Alt Up}
return

; Block Alt+z (custom combo request)
*$!z::
    KeyWait, z
    SendInput {Blind}{Alt Up}
return

; Optional hardening: common shell/menu escapes
*$!F4::Return
*$^Esc::Return

; ------------------------------
; Windows key and shell shortcuts
; ------------------------------

*$#Tab::Return
*$#D::Return
*$#M::Return

; Block both down and up events so Start menu does not appear on release
*$LWin::Return
*$LWin Up::Return
*$RWin::Return
*$RWin Up::Return
