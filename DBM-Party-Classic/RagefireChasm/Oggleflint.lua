local mod	= DBM:NewMod("Oggleflint", "DBM-Party-Classic", 9)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(11517)

mod:RegisterCombat("combat")