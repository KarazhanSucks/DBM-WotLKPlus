-- Simplified Chinese by Diablohu(diablohudream@gmail.com)
-- Last update: 2/25/2012

if GetLocale() ~= "zhCN" then return end

local L

--------------------------------
--  Lost City of the Tol'vir  --
--------------------------------
-- General Husam --
-------------------
L= DBM:GetModLocalization(117)

--------------
-- Lockmaw --
--------------
L= DBM:GetModLocalization(118)

L:SetOptionLocalization{
	RangeFrame	= "距离监视器（5码）"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "奥弗"		-- he is fightable after Lockmaw :o
})

------------------------
-- High Prophet Barim --
------------------------
L= DBM:GetModLocalization(119)

------------------------------------
-- Siamat, Lord of the South Wind --
------------------------------------
L= DBM:GetModLocalization(122)

L:SetWarningLocalization{
	specWarnPhase2Soon	= "5秒后进入第2阶段"
}

L:SetOptionLocalization{
	specWarnPhase2Soon	= "特殊警报：第2阶段即将开始（约5秒）"
}