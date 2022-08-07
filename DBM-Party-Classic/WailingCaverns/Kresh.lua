local mod	= DBM:NewMod(477, "DBM-Party-Classic", 19, 240)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(3653)

mod:RegisterCombat("combat")