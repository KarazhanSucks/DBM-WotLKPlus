local mod	= DBM:NewMod(424, "DBM-Party-Classic", 8, 232)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(12258)

mod:RegisterCombat("combat")

--Nothing to see here, puncture seems to be randomly cast, and not that important