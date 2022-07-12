local mod	= DBM:NewMod(577, "DBM-Party-BC", 5, 262)
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224953KSA")
mod:SetCreatureID(18105)

mod:SetModelID(17528)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 15716"
)

local warnEnrage	= mod:NewSpellAnnounce(15716, 4)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 15716 then
		warnEnrage:Show()
	end
end