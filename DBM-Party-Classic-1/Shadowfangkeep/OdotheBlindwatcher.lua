local mod	= DBM:NewMod("OdotheBlindwatcher", "DBM-Party-Classic-1", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(4279)

mod:RegisterCombat("combat")