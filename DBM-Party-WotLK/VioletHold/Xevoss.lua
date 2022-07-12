local mod	= DBM:NewMod("Xevoss", "DBM-Party-WotLK", 12)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712225008KSA")
mod:SetCreatureID(29266)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)