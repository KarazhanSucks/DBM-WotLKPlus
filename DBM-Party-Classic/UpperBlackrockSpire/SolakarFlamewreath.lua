local mod	= DBM:NewMod("SolakarFlamewreath", "DBM-Party-Classic", 4)
local L		= mod:GetLocalizedStrings()
mod.statTypes = "normal,heroic,mythic"

mod:SetRevision("20220712224943KSA")
mod:SetCreatureID(10264)

mod:RegisterCombat("combat")