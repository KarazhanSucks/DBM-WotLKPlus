local mod	= DBM:NewMod(93, "DBM-Party-Cataclysm", 2, 63)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220831204601")
mod:SetCreatureID(47739)
-- mod:SetEncounterID(1060)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)