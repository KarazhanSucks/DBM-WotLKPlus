local mod	= DBM:NewMod("OldSerrakis", "DBM-Party-Classic", 1)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(4830)

mod:RegisterCombat("combat")