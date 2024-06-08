#SingleInstance Force
#`::ToggleApp()
ToggleApp() {
    AppClass := "org.wezfurlong.wezterm"

    ifWinActive, ahk_class %AppClass%
    {
         WinMinimize, ahk_class %AppClass%
    }
    else
    {
         WinActivate, ahk_class %AppClass%
    }
    IfWinNotExist, ahk_class %AppClass%
    {
        Run, "C:\Program Files\WezTerm\wezterm-gui.exe" ; Replace with the actual path to your application
    }
    return
}