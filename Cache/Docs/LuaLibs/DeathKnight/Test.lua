local spells = {
    CorpseExplosion = GetSpellInfo(51328),
    roer = GetSpellInfo(47481),
    saltar = GetSpellInfo(47482),
};

local queue = {
    "test",
    "CorpseExplosion",  -- Cambiado a "CorpseExplosion"
};

local abilities = {

    ["test"] = function (event, ...)
        if event == "UNIT_SPELLCAST_SUCCEEDED" then
            local unit, spell = ...
            if unit == "player" then 
                print("Se registró el uso de la spell")
            end
        end
    end,

},


ni.bootstrap.profile("Test", queue, abilities)