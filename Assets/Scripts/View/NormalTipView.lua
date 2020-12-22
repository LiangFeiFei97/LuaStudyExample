---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DELL.
--- DateTime: 2020/12/22 15:17
---
local NormalTipView = {}

print("NormalTip")


local object = CS.UnityEngine.GameObject('Coroutine_Runner')
CS.UnityEngine.Object.DontDestroyOnLoad(object)
local cs_coroutine_runner = object:AddComponent(typeof(CS.XLuaTest.Coroutine_Runner))

local cs_coroutine = {
    start = function(...)
        return cs_coroutine_runner:StartCoroutine(Util.cs_generator(...))
    end;

    stop = function(coroutine)
        cs_coroutine_runner:StopCoroutine(coroutine)
    end
} 

local isShowing = false
local tip = CptCenter.tipBar
local tipText = CptCenter.tipText
local coroutine = function()
    isShowing = true
    tip:SetActive(true)
    coroutine.yield(CS.UnityEngine.WaitForSeconds(2))
    tip:SetActive(false)
    isShowing = false
end

function NormalTipView.showTip(message)
    if not isShowing then
        print('showTip:' .. message)
        tipText.text = message
        cs_coroutine.start(coroutine)
    else
        print("isHaveOtherShowing")
    end
end

return NormalTipView
