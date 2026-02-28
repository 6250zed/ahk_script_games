diff --git a/game_hotkeys.ahk b/game_hotkeys.ahk
index 12f9f58ecb0e9947811a0675245ce0304b818af2..a2294bd4e24a9f4ca7fcd667701e9939c9d56600 100644
--- a/game_hotkeys.ahk
+++ b/game_hotkeys.ahk
@@ -1,66 +1,33 @@
 #NoEnv
 #SingleInstance Force
-#InstallKeybdHook
+#InstallMouseHook
 #UseHook On
-SendMode event
+SendMode Event
 SetTitleMatchMode, 2
 
-enabled := true      ; true = active, false = disabled
-toggle  := false     ; false -> send 4, true -> send 3
-
-; ---- Global toggle ----
-XButton2::
-    enabled := !enabled
-    Tooltip, % (enabled ? "ENABLED" : "DISABLED")
-    SetTimer, RemoveTip, -1000
-return
-
-; ---- Global exit (works anywhere) ----
-^+Esc::ExitApp
+shiftMode := false   ; true only while RButton is physically held
 
 RemoveTip:
     Tooltip
 return
 
 #IfWinActive ahk_exe gunz.exe
 
-; tab, a,s, and x moves left-forward-back-right and also sends 1
-
-*tab::tab
-*a::a
-*s::s
-*c::c
-return
-; Alt key also sends 1.
-~*LAlt::
-    if (!enabled)
-        return
-    SendInput, {1}
+; RButton acts as a temporary modifier (momentary shift mode).
+~*RButton::
+    shiftMode := true
 return
 
-; LButton also sends r.
-~*LButton::
-    if (!enabled)
-        return
-    SendInput, {r}
+~*RButton Up::
+    shiftMode := false
 return
 
-; x alternates between 2 and 3.
-*x::
-    if (!enabled)
-        return
-    toggle := !toggle
-    SendInput, % toggle ? "{2}" : "{3}"
-return
-
-; \ types the string slowly.
-\::
-    delayMs := 200  ; delay between sends
-
-    ; send as literal text
-    SendInput, {Text}J3522722554
-
-    Sleep, %delayMs%
+; LButton does different output based on the temporary shift state.
+~*LButton::
+    if (shiftMode)
+        SendInput, {2}
+    else
+        SendInput, {r}
 return
 
 #IfWinActive
