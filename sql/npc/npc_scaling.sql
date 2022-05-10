--- Nerf Resists
UPDATE npc_types, ref_npcs
   SET npc_types.fr = Floor(ref_npcs.fr * 0.75),
       npc_types.cr = Floor(ref_npcs.cr * 0.75),
	   npc_types.mr = Floor(ref_npcs.mr * 0.75),
	   npc_types.dr = Floor(ref_npcs.dr * 0.75),
	   npc_types.pr = Floor(ref_npcs.pr * 0.75)
 WHERE npc_types.id = ref_npcs.id;
 
-- Decrease Aggro Range
UPDATE npc_types, ref_npcs
   SET npc_types.aggroradius = Floor(ref_npcs.aggroradius * 0.75),
	   npc_types.assistradius = Floor(ref_npcs.assistradius * 0.75)
 WHERE npc_types.id = ref_npcs.id;

-- Adjust Deadly Lifetap
UPDATE spells_new SET effect_base_value1 = -500 WHERE id = 993;

-- Remove Summoning From Mobs which are not permarooted
---- Special Ability
UPDATE npc_types, ref_npcs
   SET npc_types.special_abilities = REPLACE(ref_npcs.special_abilities, '1,1', '')
 WHERE ref_npcs.special_abilities LIKE '1,1'
   AND ( ref_npcs.runspeed != 0 OR ref_npcs.walkspeed != 0)
   AND ref_npcs.id = npc_types.id;   
   
UPDATE npc_types, ref_npcs
   SET npc_types.special_abilities = REPLACE(ref_npcs.special_abilities, '1,1^', '')
 WHERE ref_npcs.special_abilities LIKE '1,1^%'
   AND ( ref_npcs.runspeed != 0 OR ref_npcs.walkspeed != 0)
   AND ref_npcs.id = npc_types.id;
   
---- Call of the Zero (2080)
DELETE FROM npc_spells_entries
 WHERE spellid = 2080;
 
-- Remove Deathtouch
DELETE FROM npc_spells_entries
 WHERE spellid = 982
    OR spellid = 3087
	OR spellid = 7477
	OR spellid = 24661
	OR spellid = 39081
	OR spellid = 39082
	OR spellid = 39181
	OR spellid = 39182
	OR spellid = 1948
	OR spellid = 7478
	OR spellid = 12490
	OR spellid = 24660
	OR spellid = 39080
	OR spellid = 39180;

UPDATE npc_spells
   SET attack_proc = -1
 WHERE attack_proc = 982
    OR attack_proc = 3087
	OR attack_proc = 7477
	OR attack_proc = 24661
	OR attack_proc = 39081
	OR attack_proc = 39082
	OR attack_proc = 39181
	OR attack_proc = 39182
	OR attack_proc = 1948
	OR attack_proc = 7478
	OR attack_proc = 12490
	OR attack_proc = 24660
	OR attack_proc = 39080
	OR attack_proc = 39180;

-- Remove Fear or Charm spells from NPCs that are also cast by players

DELETE npc_spells_entries FROM spells_new, npc_spells_entries WHERE npc_spells_entries.spellid = spells_new.id AND (( effectid1 =  23 OR effectid2 =  23 OR effectid3 =  23 OR effectid4 =  23 OR effectid5 =  23 OR effectid6 =  23 OR effectid7 =  23 OR effectid8 =  23 OR effectid9 =  23 OR effectid10 = 23 OR effectid11 = 23 OR effectid12 = 23 ) OR ( effectid1 =  22 OR effectid2 =  22 OR effectid3 =  22 OR effectid4 =  22 OR effectid5 =  22 OR effectid6 =  22 OR effectid7 =  22 OR effectid8 =  22 OR effectid9 =  22 OR effectid10 = 22 OR effectid11 = 22 OR effectid12 = 22 )) AND ( classes1  < 255 OR classes2  < 255 OR classes3  < 255 OR classes4  < 255 OR classes5  < 255 OR classes6  < 255 OR classes7  < 255 OR classes8  < 255 OR classes9  < 255 OR classes10 < 255 OR classes11 < 255 OR classes12 < 255 OR classes13 < 255 OR classes14 < 255 OR classes15 < 255 OR classes16 < 255 );

-- Remove KB from spells

UPDATE spells_new
   SET pushback = 0,
       pushup = 0;


-- Replace Fear with Stun when not used by players and is on a npc spell list
UPDATE npc_spells_entries, spells_new
   SET effectid1 = 21, effect_base_value1 = 1000, effect_limit_value1 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid1 =  23
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid2 = 21, effect_base_value2 = 1000, effect_limit_value2 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid2 =  23
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid3 = 21, effect_base_value3 = 1000, effect_limit_value3 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid3 =  23
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

-- Replace Charm with Stun when not used by players and is on a npc spell list
UPDATE npc_spells_entries, spells_new
   SET effectid1 = 21, effect_base_value1 = 1000, effect_limit_value1 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid1 =  22
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid2 = 21, effect_base_value2 = 1000, effect_limit_value2 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid2 =  22
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid3 = 21, effect_base_value3 = 1000, effect_limit_value3 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid3 =  22
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

-- Replace Spinstun with Stun when not used by players and is on a npc spell list
UPDATE npc_spells_entries, spells_new
   SET effectid1 = 21, effect_base_value1 = 1000, effect_limit_value1 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid1 =  64
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid2 = 21, effect_base_value2 = 1000, effect_limit_value2 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid2 =  64
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid3 = 21, effect_base_value3 = 1000, effect_limit_value3 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid3 =  64
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

-- Replace Knockback with Stun when not used by players and is on a npc spell list
UPDATE npc_spells_entries, spells_new
   SET effectid1 = 21, effect_base_value1 = 1000, effect_limit_value1 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid1 =  380
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid2 = 21, effect_base_value2 = 1000, effect_limit_value2 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid2 =  380
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid3 = 21, effect_base_value3 = 1000, effect_limit_value3 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid3 =  380
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

-- Replace Silence with Stun when not used by players and is on a npc spell list
UPDATE npc_spells_entries, spells_new
   SET effectid1 = 21, effect_base_value1 = 1000, effect_limit_value1 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid1 =  96
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid2 = 21, effect_base_value2 = 1000, effect_limit_value2 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid2 =  96
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;

UPDATE npc_spells_entries, spells_new
   SET effectid3 = 21, effect_base_value3 = 1000, effect_limit_value3 = 100
 WHERE spells_new.id = npc_spells_entries.spellid
   AND effectid3 =  96
   AND classes1  = 255 
   AND classes2  = 255 
   AND classes3  = 255 
   AND classes4  = 255 
   AND classes5  = 255 
   AND classes6  = 255 
   AND classes7  = 255 
   AND classes8  = 255 
   AND classes9  = 255 
   AND classes10 = 255 
   AND classes11 = 255 
   AND classes12 = 255 
   AND classes13 = 255 
   AND classes14 = 255 
   AND classes15 = 255 
   AND classes16 = 255;