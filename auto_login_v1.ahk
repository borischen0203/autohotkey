LunchApp()
{
    ; Run the application
    Run, C:\KGIAP\daqKGIAP.exe
    ; skeep 3s
    Sleep, 3000

    ; Wait window pop up
    WinWait, 凱基全球理財王
    WinActivate
}

SetEnglishInput()
{
    ; 切换到英文输入法 (美式键盘布局)
    DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)  ; 00000409 是美式英文输入法的代码
}

Login()
{
    ; clean account field
    ; Loop, 15
    ; {
    ;     Send, {Del}
    ; }

    SetEnglishInput()

    ; enter account number
    Send,

    ; jump next line
    Send, {Tab}

    ; enter password
    Send,

    ; login
    ; Send, {Enter}
}

AutoLogin(){
    Process, Exist, daqKGIAP.exe
    if (ErrorLevel)
    {
        ; if running, then enter id and password
        IfWinExist, 凱基全球理財王
        {
            WinActivate
            Login()
        }
    }
    else
    {
        ; lunch the application and login
        LunchApp()
        Login()
    }
}

AutoLogin()