local mod	= DBM:NewMod(697, "DBM-Party-Classic", 9)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220817202221")
mod:SetCreatureID(61528)
-- -- mod:SetEncounterID(1446)

mod:RegisterCombat("combat")

-- mod:RegisterEventsInCombat(
-- 	"SPELL_CAST_START",
-- 	"SPELL_AURA_APPLIED"
-- )

-- local warningSoul	= mod:NewTargetAnnounce(32346, 2)
-- local warningAvatar	= mod:NewSpellAnnounce(32424, 3)

-- function mod:SPELL_CAST_START(args)
-- 	if args.spellId == 32424 then
-- 		warningAvatar:Show()
-- 	end
-- end

-- function mod:SPELL_AURA_APPLIED(args)
-- 	if args.spellId == 32346 then
-- 		warningSoul:Show(args.destName)
-- 	end
-- end