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


-- Venril Sathir
---- Ancient Shissar Gauntlet
UPDATE items SET reclevel=52, healamt=10, spelldmg=10, hp=100, mana=100, manaregen=10 WHERE id=4582;

---- Diamond Encrusted Staff
-- WIZ this is a 2h weapon, roughly doubled stats (click is garbage, elemental armor, - probably needs changed) changed to spiritual light 3hp 3mana regen group buff
UPDATE items SET reclevel=52, healamt=25, spelldmg=25, hp=150, mana=250, manaregen=8, clickeffect=2176, casttime=2, clicktype=4, recasttype=-1 WHERE id=6674;

---- Nightshade Scented Staff
-- NEC this is a 2h weapon, roughly doubled stats. (click is scent of darkness -resists)
UPDATE items SET reclevel=52, healamt=25, spelldmg=25, hp=150, mana=250, regen=4, manaregen=4, clicktype=5, casttime=1, recasttype=-1 WHERE id=6675;

---- Shissar Nullifier Staff
-- ENC 2h. click is tashania
UPDATE items SET reclevel=52, asta=10, healamt=25, spelldmg=25, hp=150, mana=250, manaregen=8, casttime=1, clicktype=5, recasttype=-1 WHERE id=6676;

---- Shissar Guardian Staff
-- MAG 2h. click is phantom plate
UPDATE items SET reclevel=52, asta=10, aint=15, healamt=25, spelldmg=25, hp=150, mana=250, regen=2, manaregen=6, clicktype=5, casttime=0, recasttype=-1 WHERE id=6677;

---- 	Waters of Impenetrable Aura
-- CLR 2h. click resist magic changed to gift of insight +100 mana and 1 mana regen
UPDATE items SET reclevel=52, astr=10, asta=10, awis=10, ac=30, healamt=25, spelldmg=25, hp=200, mana=200, manaregen=8, clickeffect=1409, casttime=2, recasttype=-1 WHERE id=6678;

---- Lycanthropic Staff
-- DRU 2h. click form of the great wolf changed to form of the howler, same thing just adds some mana regen. self only
UPDATE items SET reclevel=52, astr=10, asta=10, awis=10, ac=20, healamt=25, spelldmg=25, hp=200, mana=200, manaregen=8, clickeffect=1562, casttime=2, recasttype=-1 WHERE id=6679;

	-- the pants
---- Cobalt Greaves
-- warrior invis item, can click from inventory with race/level/class req. less dependence on bots
UPDATE items SET reclevel=52, aagi=5, hp=200, healamt=15, spelldmg=15, casttime=2, clicktype=5, recasttype=-1 WHERE id=4520;

---- Blood Ember Greaves
-- SK feign click. can click from inventory with race/level/class req
UPDATE items SET reclevel=52, asta=8, hp=100, mana=100, healamt=15, spelldmg=15, casttime=1, clicktype=5, recasttype=-1 WHERE id=4527;

---- Jaundiced Bone Greaves
-- Shaman Health click originally STA buff.. changed to malosi with 2 second cast
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=112, casttime=2, recasttype=-1 WHERE id=4534;

---- Tolan's Darkwood Greaves
-- Ranger click originally cancel magic 10 sec, upgraded to annul magic (mid 50s version of same spell line) with 2 sec cast
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=1526, casttime=2, recasttype=-1 WHERE id=4541;

---- Deepwater Greaves
-- Paladin click original spirit strength, 20str. changed to spike coat, 35ac + 4ds. it was either that or just plain ds imo, or something from yaulp line, but nothing good until yaulp 4 and that's still not great. thought ac + small ds would be more sensible than a large ds
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=518, casttime=2, recasttype=-1 WHERE id=4548;

---- Mrylokar's Greaves
-- Rogue .. original serpent sight click. change to strength of nature, 25atk 75hp buff
UPDATE items SET reclevel=52, hp=175, healamt=15, spelldmg=15, clickeffect=1397, casttime=2, recasttype=-1 WHERE id=4555;

---- Singing Steel Greaves
-- Bard , original click is bard fear changed to arch shielding 250hp 35ac 20mr
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=67, casttime=2, recasttype=-1 WHERE id=4562;

---- Donal's Leggings of Mourning
-- Cleric original click Naltron 912 hp but level 41 spell, changed to barrier of combustion 20ds 22fr
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=680, casttime=2, recasttype=-1 WHERE id=4569;

---- Elder Spiritist's Greaves
-- Druid original click skin like diamond shitty level 36 spell 21ac 300hp, change to augmentation 28% haste (29enc spell)
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=10, casttime=2, recasttype=-1 WHERE id=4576;

---- Wild Lord's Trousers
-- BST original click health 31sta, garbage, change to clarity 7manaregen
UPDATE items SET reclevel=52, hp=100, mana=100, healamt=15, spelldmg=15, clickeffect=174, casttime=2, recasttype=-1 WHERE id=5465;

---- Leggings of Wrath
-- BER has worn effect, left it alone
UPDATE items SET reclevel=52, hp=175, healamt=15, spelldmg=15 WHERE id=55497;


-- Trakanon

---- Cobalt Breastplate
-- Invigorate
UPDATE items SET reclevel=52, hp=250, healamt=30, spelldmg=30 WHERE id=4516;

---- Blood Ember Breastplate
-- Major Shielding -> Invigorate
UPDATE items SET reclevel=52, clickeffect=1825, hp=120, mana=120, healamt=30, spelldmg=30 WHERE id=4523;

---- Jaundiced Bone Breastplate
-- Bramblecoat -> Bond of Death (Experimental AF - i think it'll be cool though)
UPDATE items SET reclevel=52, clickeffect=456, casttime=3, hp=120, mana=120, healamt=30, spelldmg=30 WHERE id=4530;

---- Tolan's
-- Ring of Faydark -> Invigorate
UPDATE items SET reclevel=52, clickeffect=1825, hp=120, mana=120, healamt=30, spelldmg=30 WHERE id=4537;

---- Deepwater
-- Symbol of Pinzarn -> Invigorate
UPDATE items SET reclevel=52, clickeffect=1825, hp=120, mana=120, healamt=30, spelldmg=30 WHERE id=4544;

---- Mrylokar's
-- Invigorate
UPDATE items SET reclevel=52, awis=0, aint=0, hp=200, healamt=30, spelldmg=30 WHERE id=4551;

---- Singing Steel
-- Invigorate
UPDATE items SET reclevel=52, hp=120, mana=120, healamt=30, spelldmg=30 WHERE id=4558;

---- Donal's
-- Complete Heal with 30s cast -> Elixir of Spiritualism IX 6hp regen / 6 mana regen (self only as is i think)
UPDATE items SET reclevel=52, hp=120, mana=120, healamt=30, spelldmg=30, clickeffect=13303, casttime=2 WHERE id=4565;

---- Elder Spiritist's
-- Chloroplast -> Steelskin 6s cast
UPDATE items SET reclevel=52, hp=120, mana=120, healamt=30, spelldmg=30, clickeffect=393, casttime=6 WHERE id=4572;

---- Wild Lord's
-- Bramblecoat -> Invigorate
UPDATE items SET reclevel=52, hp=120, mana=120, healamt=30, spelldmg=30, clickeffect=1825 WHERE id=5461;

---- Tunic of Wrath
-- Invigorate
UPDATE items SET reclevel=52, hp=200, healamt=30, spelldmg=30 WHERE id=55495;

---- Mana Robe
-- Mana Conversion -> Mind Flay ??? 8522 5 sec cast, 10 minute cooldown
UPDATE items SET reclevel=52, hp=100, mana=150, healamt=30, spelldmg=30, clickeffect=8522, casttime=5, recastdelay=600, clicktype=4 WHERE id=1606;
