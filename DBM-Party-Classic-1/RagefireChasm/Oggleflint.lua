local mod	= DBM:NewMod("Oggleflint", "DBM-Party-Classic-1", 3)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("202200827220700")
mod:SetCreatureID(11517)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 40505"
)


local warningCleave	= mod:NewSpellAnnounce(40505, 2)

local timerCleave		= mod:NewAITimer(180, 40505, nil, nil, nil, 3)


function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 40505 then
        warningCleave:Show()
		timerCleave:Start()
	end
end