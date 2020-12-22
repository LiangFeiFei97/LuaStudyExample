---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DELL.
--- DateTime: 2020/12/22 11:06
---


local LoginController = {}

function LoginController.loginClick(usr,pwd)
    local tipText = nil
    local avail = true
    if usr == "" and avail then
        tipText = "用户名为空"
        avail = false
    end

    if pwd == "" and avail then
        tipText = "密码为空"
        avail = false
    end

    if not UserDataModel.getUser(usr) and avail then
        tipText = "用戶不存在"
        avail = false
    end

    if not UserDataModel.checkUser(usr,pwd) and avail then
        tipText = "账号或者密码错误"
        avail = false
    end

    if avail then
        LoginController.loginSuccess()
    else
        NormalTipController.showTip(tipText)
    end
end

function LoginController.signupClick()
    LoginController.hidePanel()
    SignupController.showPanel()
end

function LoginController.showPanel()
    LoginView.show()
end

function LoginController.loginSuccess()
    
    LoginView.onSuccess()
end

function LoginController.hidePanel()
    LoginView.hide()
end

return LoginController