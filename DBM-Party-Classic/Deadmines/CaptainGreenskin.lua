local mod	= DBM:NewMod("CaptainGreenskin", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728131600")
mod:SetCreatureID(647)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 5208 40505",
	"SPELL_AURA_APPLIED 5208",
	"SPELL_CAST_START 5208"
)

--TODO, consider a cleave timer if not cast too often
local warningPoisonedHarpoon		= mod:NewTargetNoFilterAnnounce(5208, 2, nil, "RemovePoison")
local warningCleave					= mod:NewSpellAnnounce(40505, 2)

local specWarnPoisonedHarpoon		= mod:NewSpecialWarningInterrupt(5208, "HasInterrupt", nil, nil, 1, 2)

local timerPoisonedHarpoonCD		= mod:NewAITimer(30, 5208, nil, "RemovePoison", nil, 5, nil, DBM_COMMON_L.POISON_ICON)
local timerCleaveCD			= mod:NewAITimer(180, 40505, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)


function mod:OnCombatStart(delay)
	timerPoisonedHarpoonCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 40505 then
		timerCleaveCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 5208 then
		warningPoisonedHarpoon:Show(args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 5208 then
		timerPoisonedHarpoonCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnPoisonedHarpoon:Show(args.sourceName)
			specWarnPoisonedHarpoon:Play("kickcast")
		end
	end
end