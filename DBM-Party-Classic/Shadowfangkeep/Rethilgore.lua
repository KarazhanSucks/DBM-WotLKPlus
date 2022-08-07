local mod	= DBM:NewMod("Rethilgore", "DBM-Party-Classic", 14)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(3914)

mod:RegisterCombat("combat")