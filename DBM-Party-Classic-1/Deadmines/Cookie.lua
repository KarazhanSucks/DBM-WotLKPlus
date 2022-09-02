local mod	= DBM:NewMod("Cookie", "DBM-Party-Classic-1", 2)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728140700")
mod:SetCreatureID(645)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 5174 6306",
	"SPELL_AURA_APPLIED 52446 59363"
)

local specWarnHeal			= mod:NewSpecialWarningInterrupt(5174, "HasInterrupt", nil, nil, 1, 2)
local warningAcidSplash		= mod:NewTargetNoFilterAnnounce(52446, 2, nil, "RemovePoison")
local warningAcidSplash2	= mod:NewTargetNoFilterAnnounce(59363, 2, nil, "RemovePoison")

local timerHealCD			= mod:NewAITimer(180, 5174, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerAcidSplashCD		= mod:NewAITimer(180, 6306, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)

function mod:OnCombatStart(delay)
	timerHealCD:Start(1-delay)
	timerAcidSplashCD:Start(1-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 5174 then
		timerHealCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnHeal:Show(args.sourceName)
			specWarnHeal:Play("kickcast")
		end
	elseif args.spellId == 6306 then
		timerAcidSplashCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnHeal:Show(args.sourceName)
			specWarnHeal:Play("kickcast")
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 52446 then
		warningAcidSplash:Show(args.destName)
	elseif args.spellId == 59363 then
		warningAcidSplash2:Show(args.destName)
	end
end