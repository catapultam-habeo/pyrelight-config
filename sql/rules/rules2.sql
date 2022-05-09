-- Remove Start Locactions other than Crescent Reach
DELETE FROM char_create_combinations WHERE start_zone != "394";
-- All races can use all items that some race can use in some slot
UPDATE items SET races=65535 WHERE races > 0 AND slots > 0 AND classes > 0;
-- Stack Size = 100
UPDATE items SET stacksize=100 WHERE stacksize>1 AND stacksize<100;
-- Remove Standard Lore Tags from Equippable items
UPDATE items SET loregroup = 0 WHERE loregroup = -1 AND slots > 0 AND classes > 0 AND races > 0;
-- Make all nodrop items attuneable
UPDATE items, ref_items
   SET items.nodrop = 1, items.attuneable = 1
 WHERE ref_items.id = items.id
   AND ref_items.nodrop = 0
   AND items.slots > 0
   AND items.classes > 0
   AND items.races > 0;
-- Remove need for Augment Distillers
UPDATE items SET augdistiller = 0;
-- Limit and EXPAND allowed bot creation combinations (All Races get WAR CLR PAL DRU MNK ROG WIZ)
UPDATE bot_create_combinations SET classes = 2407;
-- Allow access to #augmentitem
UPDATE command_settings SET access = 0 WHERE command LIKE 'augmentitem';
-- cap maximum respawn time
UPDATE spawn2 SET respawntime = 5400, variance = 1800 WHERE (respawntime + variance) > 7200;
-- Unlock Doors
---- Keyring EVERYTHING
UPDATE doors SET nokeyring = 0 WHERE nokeyring = 1;
---- Everything that requires a rogue
UPDATE doors SET keyitem = 0, lockpick = 0 WHERE keyitem = 0 AND lockpick > 0;

-- Remove Spell Components
UPDATE spells_new SET components1 = -1, components2 = -1, components3 = -1, components4 = -1;

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