if GetLocale() ~= "ruRU" then return end

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
	RangeFrame	= "Окно проверки дистанции (5м)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "Ауг"
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
	specWarnPhase2Soon	= "2-ая фаза через 5 сек"
}

L:SetOptionLocalization{
	specWarnPhase2Soon	= "Показывать особое предупреждение перед началом 2-ой фазы (5 сек)"
}