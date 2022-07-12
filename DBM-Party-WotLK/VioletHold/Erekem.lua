local mod	= DBM:NewMod("Erekem", "DBM-Party-WotLK", 12)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712225008KSA")
mod:SetCreatureID(29315)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 54479 59471"
)

local warningES	= mod:NewSpellAnnounce(54479, 3)

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(54479, 59471)
	and mod:GetCIDFromGUID(args.sourceGUID) == 29315 then
		warningES:Show()
	end
end