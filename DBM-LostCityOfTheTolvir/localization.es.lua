if GetLocale() ~= "esES" and GetLocale() ~= "esMX" then return end
local L

-----------------------------------
-- Ciudad Perdida de los Tol'vir --
-----------------------------------
-------------------
-- General Husam --
-------------------
L= DBM:GetModLocalization(117)

-----------------
-- Cierrafauce --
-----------------
L= DBM:GetModLocalization(118)

L:SetOptionLocalization{
	RangeFrame	= "Mostrar marco de distancia (5 m)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "Augh"		-- he is fightable after Lockmaw :o
})

------------------------
-- Sumo profeta Barim --
------------------------
L= DBM:GetModLocalization(119)

------------
-- Siamat --
------------
L= DBM:GetModLocalization(122)

L:SetWarningLocalization{
	specWarnPhase2Soon	= "Fase 2 en 5 s"
}

L:SetOptionLocalization{
	specWarnPhase2Soon	= "Mostrar aviso especial 5 s antes de la fase 2"
}