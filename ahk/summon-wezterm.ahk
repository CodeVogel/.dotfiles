#`:: ; Hotkey: WIN + `

; Define the name of your executable and its path
exeName := "wezterm.exe"
exePath := "C:\Program Files\Wezterm\wezterm.exe"

IfWinExist, ahk_exe %exeName% ; Check if a window with your program exists
{
    IfWinActive, ahk_exe %exeName% ; Check if the window is active
    {
        WinHide, ahk_exe %exeName% ; If the window is active, hide it
    }
    else
    {
        WinShow, ahk_exe %exeName% ; If the window is not active (hidden or in the background), show it
        WinActivate, ahk_exe %exeName% ; Activate the window
    }
}
else
{
    Run, %exePath% ; If the window does not exist, launch the program
}
return ; End of hotkey

