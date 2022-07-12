local mod	= DBM:NewMod("JedRunewatcher", "DBM-Party-Classic", 4)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(10509)

mod:RegisterCombat("combat")