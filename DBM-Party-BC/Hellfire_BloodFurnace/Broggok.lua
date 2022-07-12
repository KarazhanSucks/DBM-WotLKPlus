local mod	= DBM:NewMod(556, "DBM-Party-BC", 2, 256)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224953KSA")
mod:SetCreatureID(17380)

mod:SetModelID(19372)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)