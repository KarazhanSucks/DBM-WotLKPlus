local mod	= DBM:NewMod("Gilnid", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728151500")
mod:SetCreatureID(1763)
mod:SetModelID(622) -- temporary model, to prevent HD client crash on model preview

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 5213",
	"SPELL_AURA_APPLIED 5213"
)

local warningMoltenMetal	= mod:NewTargetNoFilterAnnounce(5213, 2)

local timerMoltenMetalCD	= mod:NewAITimer(180, 5213, nil, nil, nil, 3)

function mod:OnCombatStart(delay)
	timerMoltenMetalCD:Start(1-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 5213 then
		timerMoltenMetalCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 5213 then
		warningMoltenMetal:Show(args.destName)
	end
end