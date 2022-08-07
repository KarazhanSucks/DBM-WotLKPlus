local mod	= DBM:NewMod("ArchmageArugal", "DBM-Party-Classic", 14)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(4275)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 7621 7587 7803",
	"SPELL_AURA_APPLIED 7621 7803",
	"SPELL_CAST_START 22709 7803"
)

local warningArugalsCurse			= mod:NewTargetNoFilterAnnounce(7621, 2)
local warningShadowPort				= mod:NewSpellAnnounce(7587, 2)
local warningVoidBolt			= mod:NewSpellAnnounce(22709, 2)
local warningThundershock			= mod:NewTargetNoFilterAnnounce(7803, 2)


local timerArugalsCurseCD			= mod:NewAITimer(180, 7621, nil, nil, nil, 3, nil, DBM_COMMON_L.CURSE_ICON)
local timerShadowPortCD				= mod:NewAITimer(180, 7587, nil, nil, nil, 6)
local timerThundershockCD				= mod:NewAITimer(180, 7803, nil, nil, nil, 6)
local timerVoidBoltCD				= mod:NewAITimer(180, 22709, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)

function mod:OnCombatStart(delay)
	timerArugalsCurseCD:Start(1-delay)
	timerShadowPortCD:Start(1-delay)
	timerVoidBoltCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 7621 then
		timerArugalsCurseCD:Start()
	elseif args.spellId == 7587 then
		warningShadowPort:Show()
		timerShadowPortCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 7621 then
		warningArugalsCurse:Show(args.destName)
	elseif args.spellId == 7803 then
		warningThundershock:Show(args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 22709 then
		timerVoidBoltCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			warningVoidBolt:Show(args.sourceName)
			warningVoidBolt:Play("kickcast")
		end
	elseif args.spellId == 7803 then
		timerThundershockCD:Start()
	end
end

