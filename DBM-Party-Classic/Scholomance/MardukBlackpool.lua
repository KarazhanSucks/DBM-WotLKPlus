local mod	= DBM:NewMod("MardukBlackpool", "DBM-Party-Classic", 13)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(10433)

mod:RegisterCombat("combat")