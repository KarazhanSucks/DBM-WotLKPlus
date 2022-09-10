local L
--------------------------------
--  Lost City of the Tol'vir  --
--------------------------------
-- General Husam --
-------------------
L= DBM:GetModLocalization(117)

L:SetGeneralLocalization({
	name		= "General Husam"
})

--------------
-- Lockmaw --
--------------
L= DBM:GetModLocalization(118)

L:SetGeneralLocalization({
	name		= "Lockmaw"
})

L:SetOptionLocalization{
	RangeFrame	= "Show Range Frame (5 yards)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name		= "Augh"
})

L:SetGeneralLocalization({
	name = "Augh"		-- he is fightable after Lockmaw :o
})

------------------------
-- High Prophet Barim --
------------------------
L= DBM:GetModLocalization(119)

L:SetGeneralLocalization({
	name		= "High Prophet Barim"
})

------------------------------------
-- Siamat, Lord of the South Wind --
------------------------------------
L= DBM:GetModLocalization(122)

L:SetGeneralLocalization({
	name		= "Siamat, Lord of the South Wind"
})

L:SetWarningLocalization{
	specWarnPhase2Soon	= "Phase 2 in 5 seconds"
}

L:SetOptionLocalization{
	specWarnPhase2Soon	= "Show special warning for phase 2 soon (5 seconds)"
}