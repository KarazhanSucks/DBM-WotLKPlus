local mod	= DBM:NewMod("EdwinVanCleef", "DBM-Party-Classic-1", 2)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728141100")
mod:SetCreatureID(639)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 5200 3391"
)

local warningThrash					= mod:NewSpellAnnounce(3391, 3)
local warningAllies					= mod:NewSpellAnnounce(5200, 3)

local timerTrashCD					= mod:NewAITimer(180, 3391, nil, nil, nil, 5, nil, DBM_COMMON_L.TANK_ICON)

function mod:OnCombatStart(delay)
	timerTrashCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 5200 and self:AntiSpam(3, 1) then
		warningAllies:Show()
	elseif args.spellId == 3391 and args:IsDestTypeHostile() then
		warningThrash:Show()
		timerTrashCD:Start()
	end
end