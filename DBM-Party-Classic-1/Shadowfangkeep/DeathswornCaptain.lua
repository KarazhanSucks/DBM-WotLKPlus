local mod	= DBM:NewMod("DeathswornCaptain", "DBM-Party-Classic-1", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(3872)

mod:RegisterCombat("combat")