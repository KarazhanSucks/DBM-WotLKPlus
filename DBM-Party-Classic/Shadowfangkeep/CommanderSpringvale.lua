local mod	= DBM:NewMod("CommanderSpringvale", "DBM-Party-Classic", 14)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943")
mod:SetCreatureID(4278)

mod:RegisterCombat("combat")