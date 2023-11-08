local Disenchanting_Item = {
    44505,
};

local queue = {
    "pause",
    "fish",
};

local functionsent = 0

local Disenchant = GetSpellInfo(13262)

local abilities = {
    ["pause"] = function()
        if IsMounted()
            or UnitInVehicle("player")
            or UnitIsDeadOrGhost("player")
            or UnitAffectingCombat("player")
            or ni.player.ismoving() then
            return true;
        end
    end;

    ["fish"] = function()
        for _, itemID in ipairs(Disenchanting_Item) do
            local _, _, itemRarity, _, _, _, itemSubType = GetItemInfo(itemID)
            if ni.player.hasitem(itemID)
                and itemRarity >= 2 and itemRarity < 5
                and (itemSubType == "Armor" or itemSubType == "Weapon") then
                return ni.spell.cast(Disenchant, itemID)
            end
        end
    end;
};

ni.bootstrap.profile("Disenchant", queue, abilities)