if GetLocale() ~= "zhTW" then return end
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
	RangeFrame	= "顯示距離框(5碼)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "奧各"
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
	specWarnPhase2Soon	= "5秒後進入第2階段"
}

L:SetOptionLocalization{
	specWarnPhase2Soon	= "當第2階段即將到來(5秒)時顯示特別警告"
}