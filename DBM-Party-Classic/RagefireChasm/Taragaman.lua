local mod	= DBM:NewMod("Taragaman", "DBM-Party-Classic", 9)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220728142900")
mod:SetCreatureID(11520)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 18072 11970",
	"SPELL_CAST_START 11970"
)

local warningUppercut			= mod:NewSpellAnnounce(18072, 3, nil, "Tank", 2)
local warningFireNova			= mod:NewCastAnnounce(11970, 3, 2)

local timerUppercutCD			= mod:NewAITimer(180, 18072, nil, "Tank", 2, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerFireNovaCD			= mod:NewAITimer(180, 11970, nil, nil, nil, 2, nil, DBM_COMMON_L.HEALER_ICON)

function mod:OnCombatStart(delay)
	timerUppercutCD:Start(1-delay)
	timerFireNovaCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 18072 then
		warningUppercut:Show()
		timerUppercutCD:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 11970 then
		warningFireNova:Show()
		warningFireNova:Play("aesoon")
		timerFireNovaCD:Start()
	end
end