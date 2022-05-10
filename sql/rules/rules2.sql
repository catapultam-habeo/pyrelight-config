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
UPDATE spells_new SET components1 = -1, components2 = -1, components3 = -1, components4 = -1 WHERE effectid1 != 32;