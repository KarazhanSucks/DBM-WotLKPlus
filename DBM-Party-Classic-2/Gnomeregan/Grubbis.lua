local mod	= DBM:NewMod(419, "DBM-Party-Classic-2", 2, 231)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220803141822")
mod:SetCreatureID(7361)

mod:RegisterCombat("combat")