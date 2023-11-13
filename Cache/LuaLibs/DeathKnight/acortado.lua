local enables = {
    ["target"] = true,
    ["escudo_oseo"] = true,
    ["cuerno"] = true,
    ["pet"] = true,
    ["presencias"] = true,
    ["ik"] = true,
    ["lana"] = true,
    ["entereza"] = true,
    ["pacto_pet"] = true,
    ["kamen"] = true,
    ["pestilencia"] = true,
    ["pestilencia_aoe"] = true,
    ["kick"] = false,
    ["kick_2"] = false,
    ["kick_3"] = false,
    ["debug"] = false,
    ["Corpse_Explosion"] = true,
    ["cohetes_al_totem"] = true,
    ["modo_heal"] = true,
}
local values = {
        kamen = 35,
        pacto_pet = 20,
        entereza = 30,
        potenciar_cd = 40,
        
}
local function en_pompa()
    if ni.unit.buff("target",642 ) then
        return false
    else 
        return true    
    end    
end

local inputs = {
    kiick = "",
}
local menus = {
}
local function GUICallback(key, item_type, value)
	if item_type == "enabled" then
		enables[key] = value;
	elseif item_type == "value" then
		values[key] = value;
	elseif item_type == "input" then
		inputs[key] = value;
	elseif item_type == "menu" then
		menus[key] = value;
    
    end    
end
local items = {
    settingsfile = "adk_4t4_by_makaren.json",
    callback = GUICallback,
    { type = "title", text = "AutoDkProfano by |c0000CED1Matecitos|r" },
	    { type = "separator" },
    { type = "title", text = "|cffFF7C0AProfile version 1.5.0|r" },
        { type = "separator" },
    { type = "page", number = 1, text = "|cffFFFF00ajustes generales|r" },
        { type = "separator" },
    { type = "entry" , text = ni.spell.icon(49924).."Heal Mode" , tooltip = "Modo curacion (Golpe letal)", enabled = true, key = "modo_heal"},
    { type = "entry", text = ni.spell.icon(6603).." Auto targeting", tooltip ="Selecciona automáticamente un objetivo cuando no hay uno", enabled = true, key = "target" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(48265).." Cambio de puntales", tooltip ="Cambio automático de puntales", enabled = true, key = "presencias" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(57623).." cuerno Automatico", tooltip ="Utiliza automáticamente cuerno cuando no lo tienes .", enabled = true, key = "cuerno" },
    { type = "entry", text = ni.spell.icon(49222).." Auto Bone Shield", tooltip ="Utiliza automáticamente el Escudo Óseo si no está presente.", enabled = true, key = "escudo_oseo" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(54757).."Pirocohetes al totem", tooltip ="Dispara cohetes a los totems", enabled = true, key = "cohetes_al_totem" },
    { type = "entry", text = ni.spell.icon(46584).." Auto call Necrofago", tooltip ="Saca al necrofago automaticamente", enabled = true, key = "pet" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(24803).." Mostrar depuracion en chat", enabled = false, key = "debug" },
    { type = "page", number = 2, text = "|cffFFFF00Ajustes avanzados|r" },
        { type = "separator" },	
	{ type = "entry", text = ni.spell.icon(50842).." Renovar pestes con pestielecia", tooltip ="Actualizar pestes co POestilencia", enabled = true, key = "pestilencia" },
    { type = "entry", text = ni.spell.icon(50842).." epstilencia para AoE", tooltip ="Usar pestilencia para propagar pestes", enabled = true, key = "pestilencia_aoe" },
	    { type = "separator" },
    { type = "entry", text = ni.spell.icon(47528).." Autokick", tooltip ="Interrumpe todos los hechizos", enabled = false, key = "kick" },
    { type = "entry", text = " dentro del alcance", tooltip ="Interrumpe a todos los que estén dentro del alcance (no sólo al objetivo)", enabled = false, key = "kick_2" },
    { type = "entry", text = " kick espesifico", tooltip ="Interrumpe solo una spell especifica:", enabled = false, key = "kick_3" },
    {
		type = "input",
		value = inputs["kiick"],
		width = 140,
		height = 15,
		key = "kiick"
	},
        
    { type = "page", number = 3, text = "|cffFFFF00cajas fuertes|r" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(48792).." Entereza ligada al Hielo", tooltip ="Usar entereza ligada al Hielo para |cFF00FF00Hp <|r\
Работает в связке e функцией TTD(Time To Die)", enabled = true, value = 40, min = 1, max = 100, step = 1, key = "entereza" },
    { type = "entry", text = ni.spell.icon(48743).." Pacto de muerte", tooltip ="Usar pacto de muerte en |cFF00FF00Hp <|r\
Работает в связке e функцией TTD(Time To Die)", enabled = true, value = 20, min = 1, max = 100, step = 1, key = "pacto_pet" },
    { type = "entry", text = ni.spell.icon(11729).." Piedra de la Salud", tooltip ="Usar pepino en |cFF00FF00Hp <|r\
Работает в связке e функцией TTD(Time To Die)", enabled = true, value = 30, min = 1, max = 100, step = 1, key = "kamen" },
	{ type = "page", number = 4, text = "|cffFFFF00By Matecitos|r" },
        { type = "separator" },
    { type = "entry", text = ni.spell.icon(48792).." Usar Potenciar arma de runas cuando el objetivo tenga", tooltip ="Solo utilizara el cd cuando el objetivo este con el humbral de vida indicado |cFF00FF00Hp <|r\
", enabled = true, value = 40, min = 1, max = 100, step = 1, key = "potenciar_cd" },
{ type = "entry", text = ni.spell.icon(51328).." deflagracion auto", tooltip =" Actica la detonacion de pet cuando el enemigo este con un nivel de vida bajo.", enabled = true, key = "Corpse_Explosion" },
    
    };
local function OnLoad()
	ni.GUI.AddFrame("adk_4t4_by_makaren", items);
end;
local function OnUnLoad()  
	ni.GUI.DestroyFrame("adk_4t4_by_makaren");
end;

local cache = {
    potenciar_cd = false,
    sindra = false,
    PlayerCombat = false,
    aoe = false,
    info = true,
    dots = false,
    dots_obnov = false,
    pet = true,
    control = false,
    modo_heal = true,
    };
local spells = {
    golpe_runa = GetSpellInfo(56815),
    cuerno = GetSpellInfo(57623),
    escudo_oseo = GetSpellInfo(49222),
    pet = GetSpellInfo(46584),
    cadenas = GetSpellInfo(45524),
    golpe_peste = GetSpellInfo(49921),
    golpe_plaga = GetSpellInfo(55271),
    muerte_y_desc = GetSpellInfo(49938),
    gargola = GetSpellInfo(49206),
    lik = GetSpellInfo(49895),
    golpe_mortal = GetSpellInfo(49924),
    golpe_sangriento = GetSpellInfo(49930),
    pestilencia = GetSpellInfo(50842),
    presencia_escarcha = GetSpellInfo(48263),
    char_rass = GetSpellInfo(316432),
    potenciar_runas = GetSpellInfo(47568),
    p_sangre = GetSpellInfo(48266),
    p_profana = GetSpellInfo(48265),
    transfusion = GetSpellInfo(45529),
    caparazon = GetSpellInfo(48707),
    entereza = GetSpellInfo(48792),
    pacto_pet = GetSpellInfo(48743),
    kick = GetSpellInfo(47528),
    CorpseExplosion = GetSpellInfo(51328),
    roer = GetSpellInfo(47481),
    saltar = GetSpellInfo(47482),
    acurrucarse = GetSpellInfo(47484),
    };
local debuffs ={
    sindra = GetSpellInfo(69766),
    sindra_metka = GetSpellInfo(70126),}
local queue = {
    "golpe_mortal",
    "info",
    "Totem Smash",
    "cache",
    "pause",
    "autotarget",
    "gargola_Buffed",
    "kick",
    "heal_mode",
    "golpe_runa",
    "cd",
    "p_profana",
    "save",
    "Corpse_Explosion",
    "potenciar_runas_cd",
    "Frost_defensive",
    "caparazon",
    "gloves",
    "pestilencia",
    "pestilencia_aoe",
    "buff",
    "cadenas",
    "golpe_peste",
    "golpe_sangriento",
    "golpe_plaga",
    "char_rass",
    "lik_buf",
    "gargola",
    "potenciar_runas",
    "p_sangre",
    "lik",
    "pet_def",
};
local abilities = {
    
    ["info"] = function()
        if cache.info == true
        and not ni.vars.coin then
            cache.info = false
            print("|cFFFF0000 =========================|r\
|Perfil privado de Mate|r\
|Vercion 2.0|r\
|https://github.com/Kevinmoth|r\
|cFFFF0000=========================|r")
        end
    end,
    

    ["Totem Smash"] = function()
        for k, v in pairs(ni.objects) do
            if type(k) ~= "function" and (type(k) == "string" and type(v) == "table") then
                if ni.unit.istotem(k) 
                    and UnitCanAttack("player", k) then
               local name = UnitName(k);
                  if name == "Tótem Nexo Terrestre" 
                  or name == "Tótem derribador" 
                  or name == "Stoneskin Totem" 
                  or name == "Totem of Wrath" 
                  or name == "Tremor Totem" 
                  or name == "Windfury Totem"
                  or name == "Wrath of Air Totem" then
                    local target = UnitGUID("target");
                    ni.player.target(k);
                    ni.player.runtext("/petattack");
                    if ni.player.slotcastable(10)
                    and ni.player.slotcd(10) == 0 then
                        ni.player.useinventoryitem(10)
                        end
                    ni.player.target(target);
                    return true;
                  end
                end
            end
        end
    end,    
    
    ["cache"] = function()
        cache.PlayerCombat = UnitAffectingCombat("player") or false;
        cache.sindra = ni.unit.debuffstacks("player", "Escalofrío penetrante") <= 7;
        if ni.unit.debuff("target", 55078, "player")
        and ni.unit.debuff("target", 55095, "player") then
            cache.dots = true
        else
            cache.dots = false
        end
        if ni.unit.debuffremaining("target", 55095, "player") < 2
        or ni.unit.debuffremaining("target", 55078, "player") < 2 then
            cache.dots_obnov = true
        else
            cache.dots_obnov = false
        end
        if ni.unit.debuff("target", "Maleficio") 
        or ni.unit.debuff("target", "Grito intimidador") 
        or ni.unit.debuff("target", "Enredaderas") 
        or ni.unit.debuff("target", "Ciclón") 
        or ni.unit.debuff("target", "Polimorfia") 
        or ni.unit.debuff("target", "Trampa congelante") 
        or ni.unit.debuff("target", "Trampa") 
        or ni.unit.debuff("target", "Arrepentimiento") 
        or ni.unit.debuff("target", "Ceguera") 
        or ni.unit.debuff("target", "Porrazo") 
        or ni.unit.debuff("target", "Aullido de terror") 
        or ni.unit.debuff("target", "Desterrar") 
        or ni.unit.debuff("target", "Miedo") 
        or ni.unit.debuff("target", "Hibernar") 
        or ni.unit.debuff("target", "Bestia temible") 
        or ni.unit.debuff("target", "Alarido psíquico") then
            cache.control = true
        else
            cache.control = false
        end
        if enables["debug"] then
            ni.vars.debug = true
        else
            ni.vars.debug = false
        end
    end,
    ["pause"] = function()
        if IsMounted()
		or UnitInVehicle("player")
		or UnitIsDeadOrGhost("player")
		or UnitChannelInfo("player")
		or UnitCastingInfo("player")
		or ni.player.islooting()
        or not cache.sindra then
			return true;
		end
    end,
    ["heal_mode"] = function()
        if enables ["modo_heal"] then
            if ni.unit.hp("player") < 90 then
                if  ni.unit.debuff("target", 55078)
                and ni.unit.debuff("target", 55078) 
                and not ni.unit.buff("target", 48707)
                and en_pompa() then
                    if ni.spell.available(spells.golpe_mortal) and ni.spell.valid("target", spells.golpe_mortal, false, true, true) then
                        ni.spell.cast(spells.golpe_mortal, "target")
                    end
                end
            end  
        end  
    end,
     
    ["pet_def"]= function()
        if ni.unit.hp("playerpet") < 20 then
            if ni.player.petcd(spells.acurrucarse) == 0 then
                ni.spell.cast(spells.saltar,"player")
                ni.spell.cast(spells.acurrucarse)
            end
        end
    end,    
             
     

    ["golpe_runa"] = function()
    if ni.unit.buff("target", 19263) or ni.unit.buff("player", 26669) then
        if ni.spell.available(spells.golpe_runa) then
            ni.spell.cast(spells.golpe_runa)
            end
        end
    end,			
	 
    ["autotarget"] = function()
        local target_ = ni.objects["target"];
        local target__ = target_.guid
        if enables["target"]
        and cache.PlayerCombat then
            if target__ == 0 then
                ni.player.runtext("/startattack")
            end
            if ni.objectmanager.contains("The Lich King") then
                local lich = ni.objectmanager.objectGUID("The Lich King")
                local spell, _, _, _, _, endTime = UnitChannelInfo(lich)
                if spell == ("Invierno sin remordimientos") then
                    ni.player.runtext("/petfollow")
                elseif cache.pet == true then
                    ni.player.runtext("/petattack")
                    cache.pet = false
                end
            elseif cache.control then
                ni.player.runtext("/petfollow")
            elseif cache.pet == true then
                ni.player.runtext("/petattack")
                cache.pet = false
            end
        end
    end,
    
    ["kick"] = function()
        if enables["kick_3"] then
            if enables["kick"] then
                if enables["kick_2"] then
                    local enemies = ni.unit.enemiesinrange("player", 25)
                    for i = 1, #enemies do
                        local target = enemies[i].guid
                        if ni.unit.iscasting(target)
                        or ni.unit.ischanneling(target) then
                            local spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo(target)
                            if inputs.kiick == ""
                            or inputs.kiick == spell then
                                if ni.spell.available(spells.kick)
                            and interrupt == false
                            and ni.spell.valid(target, spells.kick, false, true, true) then
                                ni.spell.cast(spells.kick, target)
                            end
                            end
                        end
                    end 
                elseif ni.unit.iscasting("target")
                or ni.unit.ischanneling("target") then
                    local spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo("target")
                    if ni.spell.available(spells.kick)
                    and interrupt == false
                    and ni.spell.valid("target", spells.kick, false, true, true) then
                        ni.spell.cast(spells.kick)
                    end
                end
            end
        else
            if enables["kick"] then
                if enables["kick_2"] then
                    local enemies = ni.unit.enemiesinrange("player", 25)
                    for i = 1, #enemies do
                        local target = enemies[i].guid
                        if ni.unit.iscasting(target)
                        or ni.unit.ischanneling(target) then
                            local spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo(target)
                            if ni.spell.available(spells.kick)
                            and interrupt == false
                            and ni.spell.valid(target, spells.kick, false, true, true) then
                                ni.spell.cast(spells.kick, target)
                            end
                        end
                    end 
                elseif ni.unit.iscasting("target")
                or ni.unit.ischanneling("target") then
                    local spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo("target")
                    if ni.spell.available(spells.kick)
                    and interrupt == false
                    and ni.spell.valid("target", spells.kick, false, true, true) then
                        ni.spell.cast(spells.kick)
                    end
                end
            end
        end
    end,
    
    ["gloves"] = function()
        if cache.PlayerCombat then
            if not enables["cohetes_al_totem"] then
                if ni.player.slotcastable(10)
                and ni.player.slotcd(10) == 0 then
                    ni.player.useinventoryitem(10)
                
                end
            end
        end
    end,
    
    ["cd"] = function()
        if cache.PlayerCombat then
            count = GetItemCount("Trozo de alma")
            if ni.spell.available(316466)
            and not ni.unit.buff("player", 316466) then
                if count > 1 
                or ni.unit.hp("target") < 10 then
                    ni.spell.cast(316466)
                end
            end
            if ni.spell.available(316419)
            and ni.power.currentraw("player") < 40 then
                ni.spell.cast(316419)
            end
            if ni.spell.available(316422) then
                ni.spell.cast(316422)
            end
            if ni.spell.available(316445) then
                ni.spell.cast(316445)
            end
            if ni.spell.available(316295) then
                ni.spell.cast(316295)
            end
            if ni.unit.buff("player", 316440)
            and cache.PlayerCombat
            and ni.player.hasitem(50085) then
                ni.player.useitem(50085)
            end
            if ni.player.slotcastable(14)
            and ni.player.slotcd(14) == 0 then
                ni.player.useinventoryitem(14)
            end
            if ni.player.slotcastable(14)
            and  ni.player.slotcd(14) == 0 then
                ni.player.useinventoryitem(14)
            end
            if ni.spell.available(319326) then
                ni.spell.cast(319326)
            end
            if ni.spell.available(316396)
            and ni.spell.valid("target", 316396, false, true, true) then
                ni.spell.cast(316396)
            end
        end
    end,
    
    ["p_profana"] = function()
        if enables["presencias"]
        and not cache.PlayerCombat
        and not ni.player.buff(48265) then
            if ni.spell.available(spells.p_profana) then
                ni.spell.cast(spells.p_profana)
                cache.pet = true
            end
        end
    end,
    
    ["save"] = function()
        if cache.PlayerCombat then
            if enables["entereza"]
            and ni.unit.hp("player") <= values.entereza then
                if ni.unit.ttd("player") < 3
                and ni.spell.available(spells.ni) then
                    ni.spell.cast(spells.ni)
                end
            end
            if enables["pacto_pet"]
            and ni.unit.hp("player") <= values.pacto_pet then
                local creator = ni.unit.creator("playerpet")
                if ni.unit.ttd("player") < 2
                and creator ~= nil
                and ni.spell.available(spells.pacto_pet) then
                    ni.spell.cast(spells.pacto_pet)
                end
            end
            local startTime, duration, enable = GetItemCooldown(36892)
            local startTime_, duration, enable = GetItemCooldown(36893)
            local startTime__, duration, enable = GetItemCooldown(36894)
            if enables["kamen"] then
                if startTime == 0
                and startTime_ == 0
                and startTime__ == 0 then
                    if ni.player.hasitem(36892)
                    or ni.player.hasitem(36893)
                    or ni.player.hasitem(36894) then
                        if ni.unit.hp("player") <= values.kamen then
                            if ni.unit.ttd("player") < 2 then
                                ni.player.useitem(36892)
                                ni.player.useitem(36893)
                                ni.player.useitem(36894)
                            end
                        end
                    end
                end
            end
        end
    end,
    
    ["golpe_mortal"] = function()
        if ni.unit.hp("player") < values.kamen then
            if  ni.unit.debuff("target", 55078, "player")
            and ni.unit.debuff("target", 55078, "player") 
            and en_pompa() then
                if ni.spell.available(spells.golpe_mortal) and ni.spell.valid("target", spells.golpe_mortal, false, true, true) then
                    ni.spell.cast(spells.golpe_mortal, "target")
                end
            end
        end    
    end,
    
    ["caparazon"] = function()
        if cache.PlayerCombat
        and enables["ik"]
        and ni.player.debuff("Llama de la Legión") then
            if ni.spell.available(spells.caparazon) then
                ni.spell.cast(spells.caparazon)
            end
        end
        if cache.PlayerCombat
        and enables["lana"]
        and ni.player.debuff("Enjambre de sombras") then
            if ni.spell.available(spells.caparazon) then
                ni.spell.cast(spells.caparazon)
            end
        end
    end,

    
    ["Frost_defensive"] = function()
        if ni.unit.buffs("target", 51713, "player")
        or ni.unit.buffs("target", 46924, "player")
        or ni.unit.hp("player") < values.kamen then
            if ni.player.buff(48265) then
                if ni.spell.available(spells.presencia_escarcha) then
                    ni.spell.cast(spells.presencia_escarcha)
                end
            end
        end
    end,    
    
    ["pestilencia"] = function()
        if enables["pestilencia"]
        and en_pompa()
        and not cache.control
        and cache.PlayerCombat
        and cache.dots == true
        and cache.dots_obnov then
            local offcd, oncd = ni.rune.bloodrunecd()
            if offcd == 2
            and ni.spell.available(spells.transfusion) then
                ni.spell.cast(spells.transfusion)
                cache.pet = true
            end
            if ni.spell.available(spells.pestilencia)
            and ni.spell.valid("target", spells.pestilencia, false, true, true) then
                ni.spell.cast(spells.pestilencia, "target")
                cache.pet = true
            end
        end
    end,

    ["pestilencia_aoe"] = function()
        if enables["pestilencia_aoe"]
        and en_pompa()
        and not cache.control
        and cache.PlayerCombat
        and cache.dots == true then
            local enemies = ni.unit.enemiesinrange("player", 10)
            for i = 1, #enemies do
                local target = enemies[i].guid
                if ni.unit.hpraw(target) > 100000
                and not ni.unit.debuff(target, 55078, "player")
                or not ni.unit.debuff(target, 55095, "player") then
                    if ni.spell.available(spells.pestilencia)
                    and ni.spell.valid("target", spells.pestilencia, false, true, true) then
                    ni.spell.cast(spells.pestilencia, "target")
                    cache.pet = true
                    end
                end
            end
        end
    end,
    
    ["buff"] = function()
        if enables["cuerno"]
        and not ni.player.buff(spells.cuerno)
        and ni.spell.available(spells.cuerno) then
            ni.spell.cast(spells.cuerno)
        end
        if enables["escudo_oseo"]
        and not ni.player.buff(spells.escudo_oseo)
        and ni.spell.available(spells.escudo_oseo) then
            ni.spell.cast(spells.escudo_oseo)
        end
        if enables["pet"] then
            local creator = ni.unit.creator("playerpet")
            if creator == nil
            and ni.spell.available(spells.pet) then
                ni.spell.cast(spells.pet)
            end
        end
    end,
    
    ["cadenas"] = function()
        if cache.PlayerCombat
        and en_pompa()
        and not cache.control
        and not ni.unit.debuff("target", 55095)
        and ni.spell.valid("target", spells.cadenas, false, true, true)
        and ni.spell.available(spells.cadenas) then
            ni.spell.cast(spells.cadenas, "target")
            cache.pet = true
        end
        if cache.PlayerCombat
        and not ni.unit.inmelee("player", "target")
        and ni.spell.available(spells.cadenas)
        and ni.spell.valid("target", spells.cadenas, false, true, true)
        and not ni.unit.debuff("target",45524) then
            ni.spell.cast(spells.cadenas, "target")
        end   
    end,
    
    ["golpe_peste"] = function()
        if not cache.control
        and en_pompa()
        and cache.PlayerCombat
        and not ni.unit.debuff("target", 55078, "player")
        and ni.spell.valid("target", spells.golpe_peste, false, true, true)
        and ni.spell.available(spells.golpe_peste) then
            ni.spell.cast(spells.golpe_peste, "target")
            cache.pet = true
        end
    end,
    
    ["golpe_sangriento"] = function()
        if cache.PlayerCombat
        and en_pompa()
        and not cache.control
        and cache.dots == true
        and ni.unit.buffremaining("player", 66803) < 1
        and ni.spell.valid("target", spells.golpe_sangriento, false, true, true)
        and ni.spell.available(spells.golpe_sangriento) then
            ni.spell.cast(spells.golpe_sangriento, "target")
            cache.pet = true
        end
    end,
    
    ["golpe_plaga"] = function()
        if cache.PlayerCombat
        and en_pompa()
        and not cache.control
        and cache.dots == true
        and ni.spell.valid("target", spells.golpe_plaga, false, true, true)
        and ni.spell.available(spells.golpe_plaga) then
            ni.spell.cast(spells.golpe_plaga, "target")
            cache.pet = true
        end
    end,
    
    ["char_rass"] = function()
        if cache.PlayerCombat
        and not cache.control
        and cache.dots == true
        and ni.spell.available(spells.char_rass) then
            ni.spell.cast(spells.char_rass, "player")
            cache.pet = true
          end
    end,
    
    ["lik_buf"] = function()
        if cache.PlayerCombat
        and en_pompa()
        and not cache.control
        and not ni.unit.buff("target",48707)
        and cache.dots == true
        and not ni.player.buff(304809)
        and ni.spell.valid("target", spells.lik, false, true, true)
        and ni.spell.available(spells.lik) then
            ni.spell.cast(spells.lik, "target")
            cache.pet = true
        end
    end,
    
    ["gargola_Buffed"] = function()
        if ni.spell.available(spells.gargola) then
            if ni.unit.buff("player", 53365) then
                if ni.unit.buff("player", 67773) then
                    if ni.unit.buff("player", 67773) then
                        ni.spell.cast(spells.gargola, "target")
                    end
                end
            end            
        end
    end,
            
    
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
    
    ["potenciar_runas"] = function()
        if cache.PlayerCombat
        and not enables["potenciar_cd"]
        and not cache.control
        and cache.dots == true
        and ni.power.current("player") < 80 then
            if ni.unit.isboss("target")
            or ni.vars.combat.cd then
                if ni.spell.available(spells.potenciar_runas) then
                    ni.spell.cast(spells.potenciar_runas)
                    cache.pet = true
                end
            end
        end
    end,
    
    ["potenciar_runas_cd"] = function()
        if cache.PlayerCombat then
            if enables["potenciar_cd"]
            and ni.unit.hp("target") <= values.potenciar_cd then
                if ni.spell.available(spells.potenciar_runas) then
                    ni.spell.cast(spells.potenciar_runas)
                end
            end
        end
    end,
    
    ["lik"] = function()
        if cache.PlayerCombat
        and en_pompa()
        and not cache.control
        and not ni.unit.buff("target",48707)
        and ni.spell.valid("target", spells.lik, false, true, true)
        and ni.spell.available(spells.lik) then
            ni.spell.cast(spells.lik, "target")
            cache.pet = true
        end
    end,
    
};
ni.bootstrap.profile("mate_test", queue, abilities, OnLoad, OnUnLoad);

