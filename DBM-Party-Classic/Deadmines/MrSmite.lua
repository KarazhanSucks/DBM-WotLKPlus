local mod	= DBM:NewMod("MrSmite", "DBM-Party-Classic", 5)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728143700")
mod:SetCreatureID(646)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 6432 3391 6435",
	"SPELL_AURA_APPLIED 6435 6264"
)

local warningSmiteSlam		= mod:NewTargetNoFilterAnnounce(6435, 2)
local warningNimbleReflexes	= mod:NewTargetNoFilterAnnounce(6264, 2)

local timerSmiteStomp		= mod:NewBuffFadesTimer(10, 6432, nil, nil, nil, 2)
local timerSmiteSlam		= mod:NewAITimer(180, 6435, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerTrashCD			= mod:NewAITimer(180, 3391, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 6432 then
		timerSmiteStomp:Start()
	elseif args.spellId == 3391 and args:IsDestTypeHostile() then
		warningThrash:Show()
		timerTrashCD:Start()
	elseif args.spellId == 6435 and args:IsDestTypeHostile() then
		warningSmiteSlam:Show()
		timerSmiteSlam:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 6435 then
		warningSmiteSlam:Show(args.destName)
	elseif args.spellId == 6264 then
		warningNimbleReflexes:Show(args.destName)
	end
end