local mod	= DBM:NewMod("TheBeast", "DBM-Party-Classic", 4)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(10430)

mod:RegisterCombat("combat")