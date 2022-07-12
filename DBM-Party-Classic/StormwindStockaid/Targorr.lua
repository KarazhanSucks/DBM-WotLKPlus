local mod	= DBM:NewMod("Targorr", "DBM-Party-Classic", 15)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(1696)

mod:RegisterCombat("combat")