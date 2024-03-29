---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DELL.
--- DateTime: 2020/12/22 11:16
---

local UserDataModel = {}
UserDataModel.curUser = { username = '', password = '' }

function UserDataModel.init()
    local userdata = IOManager.load('userdata')
    if userdata == nil then
        Users = { { username = 'admin', password = 'admin', remember = false, autoLogin = false } }
        CurUser = { username = '', password = '', remember = false, autoLogin = false }
        UserDataModel.saveUser()
    else
        CurUser = userdata.cur
        Users = userdata.users
    end
end

function UserDataModel.getCurUser()
    return UserDataModel.curUser
end

function UserDataModel.addUser(mName, mPwd)
    print("adduser")
    local user = {}
    user.username = mName
    user.password = mPwd
    user.remember = false
    user.autoLogin = false
    table.insert(Users, user)
    UserDataModel.saveUser()
end

function UserDataModel.getUser(mName)
    print("getuser:" .. #Users)
    for key, value in pairs(Users) do
        print("key:" .. key .. "value.username:" .. value.username .. "value.password:" .. value.password)
        if value.username == mName then
            return true
        end
    end

    return false
end

function UserDataModel.checkUser(mName, mPwd)
    print("checkUser")
    for key, value in pairs(Users) do
        if value.username == mName and value.password == mPwd then
            return true
        end
    end

    return false
end

function UserDataModel.setCurUserState(usr, pwd, remember, autoLogin)
    for key, value in pairs(Users) do
        if value.username == usr then
            value.remember = remember
            value.autoLogin = autoLogin
        end
    end

    CurUser = { username = usr, password = pwd, remember = remember, autoLogin = autoLogin }
    UserDataModel.saveUser()
end

function UserDataModel.saveUser()
    local userdata = { cur = CurUser, users = Users }
    IOManager.save('userdata', userdata)
end

return UserDataModel