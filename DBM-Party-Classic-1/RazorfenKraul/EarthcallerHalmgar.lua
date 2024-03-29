local mod	= DBM:NewMod("EarthcallerHalmgar", "DBM-Party-Classic-1", 4)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220803141822")
mod:SetCreatureID(4842)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 8270"
)

--Guide mentions a totem, but no data for it in wowhead
--Rumbler spawned on engage
local warningSummonEarthRumbler		= mod:NewSpellAnnounce(8270, 2)

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 8270 then
		warningSummonEarthRumbler:Show()
	end
end