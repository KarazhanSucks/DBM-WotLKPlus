local mod	= DBM:NewMod("SneedsShredder", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728144200")
mod:SetCreatureID(642, 643)--Shredder, Sneed

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 7399 6713 5141 3603",
	"SPELL_CAST_START 7399 6713 5141 3603";
	"SPELL_AURA_APPLIED 7399 6713 3603"
)

local warningFear			= mod:NewTargetNoFilterAnnounce(7399, 2)
local warningDisarm			= mod:NewTargetNoFilterAnnounce(6713, 2)
local warningDistractingPain= mod:NewTargetNoFilterAnnounce(3603, 2)
local warningEjectSneed		= mod:NewSpellAnnounce(5141, 2)

local timerFearCD				= mod:NewAITimer(180, 7399, nil, nil, nil, 3, nil, DBM_COMMON_L.MAGIC_ICON)
local timerDistractingPain	= mod:NewAITimer(180, 3603, nil, nil, nil, 3, nil, DBM_COMMON_L.MAGIC_ICON)
local timerDisarmCD				= mod:NewAITimer(180, 6713, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)

function mod:OnCombatStart(delay)
	timerFearCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 7399 and args:IsSrcTypeHostile() then
		timerFearCD:Start()
	elseif args.spellId == 6713 and args:IsSrcTypeHostile() then
		timerDisarmCD:Start()
	elseif args.spellId == 5141 then
		warningEjectSneed:Show()
		timerFearCD:Stop()
		timerDisarmCD:Start(1)
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 7399 and args:IsSrcTypeHostile() then
		timerFearCD:Start()
	elseif args.spellId == 6713 and args:IsSrcTypeHostile() then
		timerDisarmCD:Start()
	elseif args.spellId == 5141 then
		warningEjectSneed:Show()
		timerFearCD:Stop()
		timerDisarmCD:Start(1)
	elseif args.spellId == 3603 then
		timerDistractingPain:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 7399 and args:IsDestTypePlayer() then
		warningFear:Show(args.destName)
	elseif args.spellId == 6713 and args:IsDestTypePlayer() then
		warningDisarm:Show(args.destName)
	elseif args.spellId == 3603 and args:IsDestTypePlayer() then
		warningDistractingPain:Show(args.destName)
	end
end