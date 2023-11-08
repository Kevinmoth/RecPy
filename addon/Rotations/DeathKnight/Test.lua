local spells = {
    CorpseExplosion = GetSpellInfo(51328),
    roer = GetSpellInfo(47481),
    saltar = GetSpellInfo(47482),
    };

local queue = {
    "testeo",
    "Corpse_Explosion",
};

local abilities = {
    
["Corpse_Explosion"] = function()
    if ni.unit.hp("target") < 20 then
        if ni.unit.creaturetype("playerpet") == 6 then
            if ni.spell.available(spells.CorpseExplosion) then
                if not ni.unit.buff("target", 642)
                and not ni.unit.buff("target", 48707) then
                    ni.spell.cast("saltar","target")
                    ni.spell.cast("roer","target")
                    if ni.unit.meleerange("pet", "target") then
                        ni.spell.delaycast(spells.CorpseExplosion, "pet", 1.5)
                    end    
                end
            end
        end
    end    
end,
};

ni.bootstrap.profile("Test", queue, abilities)