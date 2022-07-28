local mod	= DBM:NewMod("Oggleflint", "DBM-Party-Classic", 9)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728145700")
mod:SetCreatureID(11517)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 40505"
)


local warningCleave	= mod:NewTargetNoFilterAnnounce(40505, 2)

local timerCleave		= mod:NewAITimer(180, 40505, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)


function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 40505 then
        warningCleave:Show()
		timerCleave:Start()
	end
end