local mod	= DBM:NewMod("BruegalIronknuckle", "DBM-Party-Classic-1", 6)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220803141822")
mod:SetCreatureID(1720)

mod:RegisterCombat("combat")