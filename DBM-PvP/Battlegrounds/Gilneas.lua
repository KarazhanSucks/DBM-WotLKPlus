local mod	= DBM:NewMod("z761", "DBM-PvP")
local L		= mod:GetLocalizedStrings()

local GetCurrentMapAreaID = GetCurrentMapAreaID

mod:SetRevision("20220808001100")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)

mod:RemoveOption("HealthFrame")

mod:RegisterEvents(
	"LOADING_SCREEN_DISABLED",
	"ZONE_CHANGED_NEW_AREA"
)

do
	local bgzone = false

	local function Init()
		local zoneID = GetCurrentMapAreaID()
		if not bgzone and zoneID == 761 then
			bgzone = true
			DBM:GetModByName("PvPGeneral"):SubscribeAssault(275, 3)
		elseif bgzone and zoneID ~= 761 then
			bgzone = false
		end
	end

	function mod:LOADING_SCREEN_DISABLED()
		self:Schedule(1, Init)
	end
	mod.ZONE_CHANGED_NEW_AREA	= mod.LOADING_SCREEN_DISABLED
	mod.PLAYER_ENTERING_WORLD	= mod.LOADING_SCREEN_DISABLED
	mod.OnInitialize			= mod.LOADING_SCREEN_DISABLED
end
