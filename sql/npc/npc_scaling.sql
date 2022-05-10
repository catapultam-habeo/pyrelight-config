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

-- Remove Deadly Lifetap
UPDATE npc_spells
   SET attack_proc = -1
 WHERE attack_proc = 993;

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