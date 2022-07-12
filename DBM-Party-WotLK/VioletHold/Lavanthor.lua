local mod	= DBM:NewMod("Lavanthor", "DBM-Party-WotLK", 12)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712225008KSA")
mod:SetCreatureID(29312)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)