local mod	= DBM:NewMod("WarchiefRendBlackhand", "DBM-Party-Classic", 4)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(10339, 10429) -- Gyth, Rend
mod:SetMainBossID(10429)

mod:RegisterCombat("combat")