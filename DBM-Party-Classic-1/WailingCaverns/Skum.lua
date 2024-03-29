local mod	= DBM:NewMod(478, "DBM-Party-Classic-1", 7)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(3674)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 6254"
)

--TODO, fix range to one classic actually supports
local timerChainedBoltCD			= mod:NewAITimer(180, 6254, nil, nil, nil, 3)

mod:AddRangeFrameOption(10, 6254)

function mod:OnCombatStart(delay)
	timerChainedBoltCD:Start(1-delay)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 6254 and args:IsSrcTypeHostile() then
		timerChainedBoltCD:Start()
	end
end