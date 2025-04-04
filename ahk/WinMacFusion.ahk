#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "Input"
SetWorkingDir A_ScriptDir

; ===== 检查管理员权限并重启 =====
if !A_IsAdmin {
    MsgBox "需要以管理员权限运行脚本来拦截 F1 键。即将以管理员重新启动...", "权限不足", "Icon! T3"
    Run '*RunAs "' A_ScriptFullPath '"'
    ExitApp
}

; ===== 初始化状态变量 =====
global blockF1 := true
global f1MenuName := "关闭 F1 屏蔽"  ; 初始菜单项名称
global lastChromeWin := ""


SetTimer(UpdateTrayTooltip, 1000)

; ===== 创建托盘菜单 =====
; A_TrayMenu.Delete() ; 清空默认菜单
A_TrayMenu.Add() ; 分隔线
f1MenuIndex := A_TrayMenu.Add(f1MenuName, ToggleF1)
A_TrayMenu.Add("退出", (*) => ExitApp())


; ✅ 主功能：Chrome 中拦截 F1，跳出再发 F1，再回来
#HotIf WinActive("ahk_class Chrome_WidgetWin_1") && blockF1
F1:: {
    /* do nothing, disable F1 */
    /* TrayTip("Chrome F1 Disabled") */
    ; Send("{Blind}{F1}")  ; 关键：Blind 模式保留修饰键状态

    global lastChromeWin
    lastChromeWin := WinExist("A")  ; 保存当前 Chrome 窗口

    SetTimer(SendF1FromExplorer, -20)
    return
}
#HotIf

SendF1FromExplorer() {
    global lastChromeWin

    ; 尝试找到桌面窗口或资源管理器窗口
    altTarget := WinExist("ahk_class Progman")   ; 桌面
    if !altTarget
        altTarget := WinExist("ahk_class CabinetWClass") ; Explorer 窗口

    if altTarget {
        WinActivate(altTarget)
        Sleep(10)
        Send("{F1}")
        Sleep(10)

        ; 切回 Chrome
        if lastChromeWin
            WinActivate(lastChromeWin)
    } else {
        TrayTip("未找到可转发的窗口", "无法模拟系统级 F1", 2)
    }
}

; ===== 切换拦截状态 =====
ToggleF1(*) {
    global blockF1, f1MenuName, f1MenuIndex
    blockF1 := !blockF1
    newLabel := blockF1 ? "关闭 F1 屏蔽" : "启用 F1 屏蔽"

    try A_TrayMenu.Rename(f1MenuName, newLabel)  ; 精确用旧名字换新名字
    catch {
        ; 如果菜单项被误删，不做处理（也可重建）
        TrayTip("菜单项不存在", "无法重命名托盘菜单项，请重新启动脚本。", 1)
    }

    f1MenuName := newLabel  ; 更新当前菜单项名称
    TrayTip("Block F1 status: ", blockF1, 1000)
    UpdateTrayTooltip()
}

UpdateTrayTooltip(*) {
    global blockF1
    A_IconTip := blockF1 ? "Chrome F1 拦截已启用" : "F1 拦截已禁用"
}

/*
Swith Virtual Desktop with "Ctrl + Arrow" 
instead of "Ctrl + Win + Arrow"
*/
; ===== 虚拟桌面切换 =====
; ~（波浪符）：表示 ​​不屏蔽原按键的默认行为​​。
~^Left:: {
    Send "^#{Left}"
    Return
}


~^Right:: {
    Send "^#{Right}"
    Return
}