local mod	= DBM:NewMod("DrakosTheInterrogator", "DBM-Party-WotLK", 9)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712225008KSA")
mod:SetCreatureID(27654)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"UNIT_DIED"
)

mod:AddBoolOption("MakeitCountTimer", true, "timer")

function mod:UNIT_DIED(args)
	if not self:IsDifficulty("normal5") then
		if self.Options.MakeitCountTimer and not DBT:GetBar(L.MakeitCountTimer) then
			local cid = self:GetCIDFromGUID(args.destGUID)
			if cid == 27654 then		-- Drakos The Interrogator
				DBT:CreateBar(1200, L.MakeitCountTimer)
			end
		end
	end
end