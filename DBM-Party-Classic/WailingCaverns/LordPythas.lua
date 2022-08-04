local mod	= DBM:NewMod(476, "DBM-Party-Classic", 19, 240)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220804134000")
mod:SetCreatureID(3670)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 8040 23381 102 9532",
	"SPELL_AURA_APPLIED 8040"
)

local warningDruidSlumber			= mod:NewTargetNoFilterAnnounce(8040, 2)
local warningHealingTouch			= mod:NewCastAnnounce(23381, 2)
local warningFanglordLightningBolt	= mod:NewCastAnnounce(102, 2)
local warningLightningBolt			= mod:NewCastAnnounce(9532, 2)

local specWarnDruidsSlumber			= mod:NewSpecialWarningInterrupt(8040, "HasInterrupt", nil, nil, 1, 2)
local specWarnFanglordLightningBolt	= mod:NewSpecialWarningInterrupt(102, "HasInterrupt", nil, nil, 1, 2)
local specWarnLightningBolt			= mod:NewSpecialWarningInterrupt(9532, "HasInterrupt", nil, nil, 1, 2)

local timerDruidsSlumberCD			= mod:NewAITimer(180, 8040, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON..DBM_COMMON_L.MAGIC_ICON)
local timerHealingTouchCD			= mod:NewAITimer(180, 23381, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerFanglordLightningBoltCD	= mod:NewAITimer(180, 102, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerLightningBoltCD			= mod:NewAITimer(180, 9532, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)

function mod:OnCombatStart(delay)
	timerDruidsSlumberCD:Start(1-delay)
	timerHealingTouchCD:Start(1-delay)
	timerFanglordLightningBoltCD:Start(1-delay)
	timerLightningBoltCD:Start(1-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 8040 and args:IsSrcTypeHostile() then
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnDruidsSlumber:Show(args.sourceName)
			specWarnDruidsSlumber:Play("kickcast")
		end
	elseif args.spellId == 23381 and args:IsSrcTypeHostile() then
		warningHealingTouch:Show()
		timerHealingTouchCD:Start()
	elseif args.spellId == 102 and args:IsSrcTypeHostile() then
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			warningFanglordLightningBolt:Show(args.sourceName)
			timerFanglordLightningBolthCD:Start()
			specWarnFanglordLightningBolt:Play("kickcast")
		end
	elseif args.spellId == 9532 and args:IsSrcTypeHostile() then
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			warningLightningBolt:Show(args.sourceName)
			timerLightningBoltCD:Start()
			specWarnLightningBolt:Play("kickcast")
		end
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 8040 and args:IsDestTypePlayer() then
		warningDruidSlumber:Show(args.destName)
	end
end