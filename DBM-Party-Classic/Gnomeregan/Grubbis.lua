local mod	= DBM:NewMod(419, "DBM-Party-Classic", 7, 231)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(7361)

mod:RegisterCombat("combat")