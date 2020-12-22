---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DELL.
--- DateTime: 2020/12/22 11:16
---

local users = {}
local UserDataModel = {}

function UserDataModel.addUser(mName, mPwd)
    print("adduser")
    local user = {}
    user.username = mName
    user.password = mPwd
    table.insert(users, user)
    print(#users)
end

function UserDataModel.getUser(mName)
    print("getuser:" .. #users)
    for key, value in pairs(users) do
        print("key:" .. key .. "value.username:" .. value.username .. "value.password:" .. value.password)
        if value.username == mName then
            return true
        end
    end

    return false
end

function UserDataModel.checkUser(mName, mPwd)
    print("checkUser")
    for key, value in pairs(users) do
        if value.username == mName and value.password == mPwd then
            return true
        end
    end

    return false
end

return UserDataModel