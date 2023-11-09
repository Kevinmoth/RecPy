
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
};

ni.bootstrap.profile("test_auto_escudo", queue, abilities)
