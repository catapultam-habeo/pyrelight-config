-- Lord Nagafen
--- Convert to Augs
---- Red Dragon Scales
UPDATE items SET itemtype = 54, classes = 65535, slots = 131072, clicktype = 4, clickeffect = 5492, recastdelay = 60, maxcharges=-1 WHERE id = 11622;
---- Hierophant's Crook
UPDATE items SET name = "Hierophant Charm", icon = 1881, itemtype = 54, classes = 65535, augrestrict = 4 WHERE id = 11629;
---- Orb of Tishan
UPDATE items SET itemtype = 54, classes = 65535, focuseffect = 41844, proceffect = -1 WHERE id = 11625;
REPLACE INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES
(41844, 'Aura of Tashania', 'BLUE_TRAIL', '', '', '', '', '', '', 100, 0, 0, 0, 0, 0, 0, 3, 1950, 0, 0, 100, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 383, 138, 348, 142, 311, 137, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 0, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1050883, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 3, 1950, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, -1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `db_str` (`id`, `type`, `value`) VALUES
(1050883, 6, 'Has a chance to inflict Tashania on your opponent each time you cast a damaging spell.');
UPDATE spells_new SET effect_base_value1 = 400 WHERE id = 41844;

---- Hammer of the Scourge
UPDATE items SET name = "Orb of the Scourge", icon = 2087, itemtype = 54, classes = 65535 WHERE id = 11628;
---- Prayer's of Life
UPDATE items SET itemtype = 54, classes = 65535, slots = 19968, clicktype = 4 WHERE id = 11631;
---- Selo's Drums of the March
UPDATE items SET itemtype = 54 WHERE id = 11626;
--- Equipment
---- Bladestopper
UPDATE items SET reclevel = 52, classes = 65535, slots = 16384, clickeffect = 8015, recastdelay = 600, clicktype = 1, casttime = 0 WHERE id = 11632;
UPDATE items SET hp = 120, mana = 50, healamt = 15, spelldmg = 15 WHERE id = 11632;
---- Cloak of Flames
UPDATE items SET clickeffect = 1668, casttime = 10000, clicktype = 1, maxcharges = -1, spelldmg = 15, healamt = 15 WHERE id = 11621;
---- Gold Plated Koshigatana
UPDATE items SET proceffect = 445, hp = 100, mana = 50, spelldmg = 15, healamt = 5 WHERE id = 11630;
---- Gauntlets of Fiery Might
UPDATE items SET reclevel = 52, hp = 200, mana = 200, spelldmg = 15  WHERE id = 11624;

-- Lady Vox
--- Convert to Augs
---- Tobrin's Mystical Eyepatch
UPDATE items SET itemtype = 54, worneffect = 3660 WHERE id = 11052;
---- McVaxius' Horn of War
UPDATE items SET itemtype = 54 WHERE id = 11607;
---- Warhammer of Divine Grace
UPDATE items SET itemtype = 54, name = "Charm of Divine Grace", icon = 1897, focuseffect = 41843, proceffect = -1, classes = 32318 WHERE id = 11611;
REPLACE INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES
(41843, 'Aura of Divine Grace', 'BLUE_TRAIL', '', '', '', '', '', '', 100, 0, 0, 0, 0, 0, 0, 3, 1950, 0, 0, 100, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 383, 254, 348, 142, 311, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 0, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1050882, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 3, 1950, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, -1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `db_str` (`id`, `type`, `value`) VALUES
(1050882, 6, 'Has a chance to cast Ethereal Elixir on your party when you cast any spell.');
---- White Dragon Scales
UPDATE items SET itemtype = 54, classes = 65535, slots = 131072, clicktype = 4, clickeffect = 6377, recastdelay = 600, maxcharges = -1 WHERE id = 11602;
---- Scimitar of the Mistwalker
UPDATE items SET name = "Charm of the Mistwalker", icon = 1895, itemtype = 54, classes = 65535, slots = 24576 WHERE id = 11604;
--- Equipment
---- White Dragonscale Cloak
-------------------------------TODO
---- Runed Bolster Belt
UPDATE items SET reclevel = 52, spelldmg = 15, healamt = 15, heroic_str = 20, hp = 120, mana = 59 WHERE id = 11601;
----- Dragon Bone Bracelet
UPDATE items SET reclevel = 52, clickeffect = 4418, hp = 100, mana = 200, spelldmg = 30, maxcharges = -1, casttime = 1000, recastdelay = 0, recasttype = -1, clicktype = 1 WHERE id = 11606;
----- Crystalline Spear
UPDATE items SET reclevel = 52, proceffect = 3569, proclevel = 52, hp = 100, mana = 100, astr = 5, adex = 20, aagi = 10, spelldmg = 20, healamt = 20, heroic_str = 5, heroic_agi = 5 WHERE id = 11610;
-- Phinigel Autropos
--- Convert to Augs
---- Wand of Malisement
UPDATE items SET name = "Charm of Malisement", icon = 1884, itemtype = 54, classes = 65535, slots = 98354, casttime = 0 WHERE id = 10374;

-- Venril Sathir

-- Trakanon

-- Cazic-Thule
--- Equipment
---- Brain of Cazic Thule
UPDATE items SET reclevel = 52, healamt = 15, spelldmg = 15, hp = 120, mana = 120 WHERE id = 1554;

-- Innoruuk

-- Eye of Veeshan
---- Maybe?

---- Misc
---- Ivandyr's Hoop -> Aug
UPDATE items SET itemtype = 54, classes = 65535, clicktype = 4, casttime = 0, recastdelay = 30, recasttype = -1 WHERE id = 10082;
---- Manastone
UPDATE items SET itemtype = 54, clicktype= 4, maxcharges = -1 WHERE id = 13401;


------ Fix stupid mistakes
UPDATE items SET focustype = 6 WHERE focuseffect > 0 AND focustype != 6;