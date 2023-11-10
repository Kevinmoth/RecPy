
local spells ={

    caparazon = GetSpellInfo(48707),
}


local queue = {
    "escudo"
};

local abilities = {

    ["escudo"] = function()
        print(ni.vars.combat.started )
        if ni.unit.iscasting("target") then
            print("Activando dispositivo secreto de proteccion")
            ni.spell.cast(spells.caparazon, "player")
        end
    end,

    ["Gloves"] = function()
        if UnitAffectingCombat("player")
        and ni.player.slotcastable(10)
        and ni.player.slotcd(10) == 0
        and UnitHealth("target") <= 3100
        and ni.player.distance("target") ~= nil
        and ni.player.distance("target") <= 24 then
            return ni.player.useinventoryitem(10, "target")
        end
    end,
};


ni.bootstrap.profile("test_auto_escudo", queue, abilities)

