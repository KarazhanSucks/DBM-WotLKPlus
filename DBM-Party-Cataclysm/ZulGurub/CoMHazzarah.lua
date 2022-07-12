local mod	= DBM:NewMod(178, "DBM-Party-Cataclysm", 11, 76, 1)
local L		= mod:GetLocalizedStrings()

mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712225019KSA")
mod:SetCreatureID(52271)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
--	"SPELL_AURA_APPLIED"
)

