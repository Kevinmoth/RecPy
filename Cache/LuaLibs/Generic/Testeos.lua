local queue = {
    "posicion",
    "Interrupter"
};

local abilities = {
    ["posicion"] = function()
        print(ni.unit.castingpercent("player"))
    end,

    ["Interrupter"] = function()
        if ni.spell.available(spells.SPELLDECORTE)
                and GetComboPoints("player", "target") >= 1
                and ni.unit.iscasting("target")
                and ni.drtracker.get("target", "Controlled stuns") > 0
                and (ni.unit.castingpercent("target") >= 80
                    or ni.unit.ischanneling("target")) then
            ni.spell.cast(spells.SPELLDECORTE)
        end
    end,

    ["Antireflect"] = function()
        if ni.player.buff(spells.CUERNO)
                and ni.unit.buff("target", 23920) then
            ni.spell.cast(spells.SPELL_A_REFLEJAR (Orden_oscura))
        end
    end,

    
};

ni.bootstrap.profile("Testeos", queue, abilities)