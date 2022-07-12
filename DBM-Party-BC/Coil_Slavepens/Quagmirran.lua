local mod	= DBM:NewMod(572, "DBM-Party-BC", 4, 260)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224953KSA")
mod:SetCreatureID(17942)

mod:SetModelID(18224)
mod:SetModelOffset(-2, 0.4, -1)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)