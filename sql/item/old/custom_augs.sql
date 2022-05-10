-- Manastoner
UPDATE items 
SET itemtype = 54, 
    augtype = 2,
	reqlevel = 50,
	reclevel = 70,
	clicktype= 4,
	augslot1visible=0,augslot2visible=0,augslot3visible=0,augslot4visible=0,augslot5visible=0,augslot6visible=0
WHERE id = 13401;
-- Evil Eye
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (18855, 13401, 1);
--Nagafen
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (7725,  13401, 10);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (175041,  13401, 5);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (175042,  13401, 2.5);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (178170,  13401, 2.5);	
--Vox
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (5988,  13401, 10);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (175044,  13401, 5);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (175045,  13401, 2.5);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (178169,  13401, 2.5);			
--Phinny
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (17734, 13401, 10);	
--Tolapumj
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (828,  13401, 1);

--Prayers of Life
UPDATE items
SET    name = 'The Lifestone',
	   icon = 2089,
	   slots = 98304,
	   itemtype = 54,
	   clicktype = 4,
	   recasttype = 10,
	   recastdelay = 60,
	   augtype = 2,
	   maxcharges = -1,
	   reclevel = 70,
	   reqlevel = 50
WHERE id=11631;

--Heirophant's Crook
UPDATE items
SET	  name = 'Hierophant\'s Charm',
	  icon = 1898,
	  classes = 50091,
	  reclevel = 70,
	  reqlevel = 50,
	  augtype = 8,
	  damage = 0,
	  delay = 0,
	  itemtype = 54,
	  astr = 0, adex = 0, asta = 0, aagi = 0, aint = 0, awis = 0, acha = 0,
	  heroic_wis = 5, spelldmg = 0, healamt = 0,
	  weight = 0.1,	  
	  augslot1visible=0,augslot2visible=0,augslot3visible=0,augslot4visible=0,augslot5visible=0,augslot6visible=0
WHERE id=11629;

	
-- LDON Augs -> Global Loot
REPLACE INTO loottable (id,name) VALUES (500111,'GLB-LDON-Augs-T1');
REPLACE INTO global_loot (id,description,loottable_id,min_level,max_level)
VALUES (500111,"GLB-LDON-Augs-T1",500111,0,57);
REPLACE INTO lootdrop (id, name) VALUES (500111,'GLB-LDON-Augs-T1');
REPLACE INTO loottable_entries (loottable_id, lootdrop_id, droplimit,mindrop,probability) VALUES (500111,500111,1,1,1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500111, items.id, 0.1, 0, 57
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel > 0 AND items.reclevel < 51);
   
REPLACE INTO loottable (id,name) VALUES (500112,'GLB-LDON-Augs-T2');
REPLACE INTO global_loot (id,description,loottable_id,min_level,max_level)
VALUES (500112,"GLB-LDON-Augs-T2",500112,55,67);
REPLACE INTO lootdrop (id, name) VALUES (500112,'GLB-LDON-Augs-T2');
REPLACE INTO loottable_entries (loottable_id, lootdrop_id, droplimit,mindrop,probability) VALUES (500112, 500112,1,1,1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500112, items.id, 0.1, 55, 67
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel > 50 AND items.reclevel < 64);
   
REPLACE INTO loottable (id,name) VALUES (500113,'GLB-LDON-Augs-T3');
REPLACE INTO global_loot (id,description,loottable_id,min_level,max_level)
VALUES (500113,"GLB-LDON-Augs-T3",500113,64,100);
REPLACE INTO lootdrop (id, name) VALUES (500113,'GLB-LDON-Augs-T3');
REPLACE INTO loottable_entries (loottable_id, lootdrop_id, droplimit,mindrop,probability) VALUES (500113,500113,1,1,1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500113, items.id, 0.1, 64, 100
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel > 64 AND items.reclevel < 100);
   
-- LDON Raid AUGS
REPLACE INTO loottable (id,name) VALUES (510113,'GLB-LDON-Augs-RAID');
REPLACE INTO global_loot (id,description,loottable_id,min_level,max_level)
VALUES (510113,"GLB-LDON-Augs-RAID",510113,60,100);
REPLACE INTO lootdrop (id, name) VALUES (510113,'GLB-LDON-Augs-RAID');
REPLACE INTO loottable_entries (loottable_id, lootdrop_id, droplimit,mindrop,probability) VALUES (510113,510113,1,1,1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 510113, items.id, 0.1, 60, 100
FROM items
WHERE (items.name LIKE 'Flowkeeper\'s Shard of Knowledge' OR
	   items.name LIKE 'Flowkeeper\'s Shard of Vitality' OR
	   items.name LIKE 'Royal Gem of Alacrity' OR
	   items.name LIKE 'Geomantic Compact Chanting Stone' OR
	   items.name LIKE 'Geomantic Compact\'s Healing Gem' OR
	   items.name LIKE 'Ledanne\'s Jewel of Cessation' OR
	   items.name LIKE 'Quintessence Jewel of Fiery Pain' OR
	   items.name LIKE 'Ritana\'s Refracting Prism' OR
	   items.name LIKE 'Ritana\'s Sandstone of Prowess' OR
	   items.name LIKE 'Thosan\'s Geomantic Compact Jewel' OR
	   items.name LIKE 'Tweyne\'s Condensed Tidal Sands' OR
	   items.name LIKE 'Tweyne\'s Stone of Evocation' OR
	   items.name LIKE 'Unala\'s Jewel of Life' OR
	   items.name LIKE 'Unala\'s Stone of Enhanced Protection' OR
	   items.name LIKE 'Burning Acid Shard' OR
	   items.name LIKE 'Enchanted Stone of Burning Rage' OR
	   items.name LIKE 'Glowing Stone of Frozen Slime' OR
	   items.name LIKE 'Glowing Stone of Precision' OR
	   items.name LIKE 'Ooze-Covered Stone' OR
	   items.name LIKE 'Ritualist\'s Divination Gem' OR
	   items.name LIKE 'Ritualist\'s Gem of Power' OR
	   items.name LIKE 'Ritualist\'s Orb of Enhanced Protection' OR
	   items.name LIKE 'Ritualist\'s Stone of Flowing Health' OR
	   items.name LIKE 'Ritualist\'s Stone of Rage' OR
	   items.name LIKE 'Shard of Eternal Pain' OR
	   items.name LIKE 'Shard of the Cursed Mind' OR
	   items.name LIKE 'Slime Covered Stone of Life' OR
	   items.name LIKE 'Slime-Coated Crusader\'s Gem' OR
	   items.name LIKE 'Abjuration Stone of Focus' OR
	   items.name LIKE 'Enchanted Gem of the Scout' OR
	   items.name LIKE 'Enchanted Orb of Hardened Mud' OR
	   items.name LIKE 'Enchanted Orb of Spirit' OR
	   items.name LIKE 'Enhanced Gem of the First Witness' OR
	   items.name LIKE 'Focus Shard of Enhanced Protection' OR
	   items.name LIKE 'Focus Stone of Enhanced Protection' OR
	   items.name LIKE 'Focused Prism of Accuracy' OR
	   items.name LIKE 'Gem of Focused Rage' OR
	   items.name LIKE 'Glowing Stone of Agility' OR
	   items.name LIKE 'Mossy Enchanted Stone' OR
	   items.name LIKE 'Slime-Soaked Jewel' OR
	   items.name LIKE 'Flowing Gem of the Ritualist' OR
	   items.name LIKE 'Glowing Gem of Enhanced Protection' OR
	   items.name LIKE 'Lich\'s Shard of Vitality' OR
	   items.name LIKE 'Ritualist\'s Fury Stone' OR
	   items.name LIKE 'Shard of Burning Ooze' OR
	   items.name LIKE 'Shard of Guktan Hate' OR
	   items.name LIKE 'Enchanted Crystal of the Synarcana' OR
	   items.name LIKE 'Enchanted Jewel of Shielding' OR
	   items.name LIKE 'Enchanted Shard of Unrivaled Vengeance' OR
	   items.name LIKE 'Frost-Covered Rock of Prowess' OR
	   items.name LIKE 'Gauntlet Stone of Fortitude' OR
	   items.name LIKE 'Ice Shard of Enhanced Protection' OR
	   items.name LIKE 'Ice Shards of Deadly Strikes' OR
	   items.name LIKE 'Icy Orb of Frozen Time' OR
	   items.name LIKE 'Jagged Froststone of Enchantments' OR
	   items.name LIKE 'Jeweled Sentinel\'s Broken Aura' OR
	   items.name LIKE 'Dark Shard of Destruction' OR
	   items.name LIKE 'Froststone of Health' OR
	   items.name LIKE 'Frosty Gem of Enhanced Protection' OR
	   items.name LIKE 'Frozen Gem of Strength' OR
	   items.name LIKE 'Gem of Whirling Auras' OR
	   items.name LIKE 'Icy Orb of Tranquility' OR
	   items.name LIKE 'Miragul\'s Enchanted Focusing Shard' OR
	   items.name LIKE 'Shard of Shrunken Bone' OR
	   items.name LIKE 'Ancient Ice Shard of Life' OR
	   items.name LIKE 'Fractured Iced Gem of Knowledge' OR
	   items.name LIKE 'Bloodied Gravestone Fragment' OR
	   items.name LIKE 'Bloodstone of Enhanced Protection' OR
	   items.name LIKE 'Enchanted Chunk of Graying Flesh' OR
	   items.name LIKE 'Gem of Burning Rage' OR
	   items.name LIKE 'Gravestone Fragment of Protection' OR
	   items.name LIKE 'Mummy\'s Stone of Fury' OR
	   items.name LIKE 'Scion\'s Shard of Death Chants' OR
	   items.name LIKE 'Translucent Orb of Trapped Mana' OR
	   items.name LIKE 'Bloodied Shard of Kel`Novar' OR
	   items.name LIKE 'Bloodstone of Blinding Strikes' OR
	   items.name LIKE 'Enchanted Orb of Defense' OR
	   items.name LIKE 'Guardian\'s Stone of Enhanced Protection' OR
	   items.name LIKE 'Nightstone of the Vampire Slayer' OR
	   items.name LIKE 'Reflection Shard of Kel`Novar' OR
	   items.name LIKE 'Scion Stone of Disruption' OR
	   items.name LIKE 'Sharp-Edged Pearl Shard' OR
	   items.name LIKE 'Stone Guardian\'s Conjuration Shard' OR
	   items.name LIKE 'Valdoon\'s Bloodstone of Power' OR
	   items.name LIKE 'Valdoon\'s Immortal Blood Gem' OR
	   items.name LIKE 'Valdoon\'s Stone Beast Shard' OR
	   items.name LIKE 'Anomalous Rock of Alteration' OR
	   items.name LIKE 'Enchanted Stone of Research' OR
	   items.name LIKE 'Experimental Gem of Enhanced Protection' OR
	   items.name LIKE 'Experimental Gem of Haste' OR
	   items.name LIKE 'Experimental Smoldering Stone' OR
	   items.name LIKE 'Light Stone of Life' OR
	   items.name LIKE 'Polished Gemstone of Aggression' OR
	   items.name LIKE 'Researcher\'s Exacting Ore' OR
	   items.name LIKE 'Ringed Stone of Advantage' OR
	   items.name LIKE 'Smooth Stone of Blissful Tranquility' OR
	   items.name LIKE 'Velrek\'s Enchanted Prism' OR
	   items.name LIKE 'Cherished Companion Shard' OR
	   items.name LIKE 'Enchanted Orb of Matter' OR
	   items.name LIKE 'Neyremal\'s Shard of Prowess' OR
	   items.name LIKE 'Rujarkian Stone of Discipline' OR
	   items.name LIKE 'Sharp-Edged Pearl Shard' OR
	   items.name LIKE 'Taskmaster\'s Enchanted Stone of Pain' OR
	   items.name LIKE 'Velrek\'s Shimmering Thought Stone' OR
	   items.name LIKE 'Warden\'s Peculiar Gem of Thought' OR
	   items.name LIKE 'Warden\'s Stone of Enhancement' OR
	   items.name LIKE 'Warden\'s Stone of Prowess' OR
	   items.name LIKE 'Yenner\'s Rock of Enhanced Protection' OR 
	   items.name LIKE 'Hierophant\'s Charm' OR
	   items.id = 11631 OR items.id = 13401)	   
   AND items.itemtype=54;
   
-- Expand Usability of LDON Proc Augs
--- Anger
UPDATE items SET classes = 49629 WHERE items.id = 42129 AND items.id = 42179;

-- Dread Gaze proc
REPLACE INTO `items` VALUES(500001, 0, 'Vennok\'s Obsidian Sphere', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 21, 4278190080, '0', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 767, 'IT', 0, 54, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, -1, 0, 0, 0, 1, 1, 0, 0, 0, 131071, 0, 60, 0, 51, 1, 0, 0, -1, 0, 24576, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2022-03-16 21:36:36', '', 0, 0, 0, 0, 1, 0, 0, '', 0, 5336, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2022-03-16 21:36:36', NULL, 'CUSTOM', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022316213636', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (510113,  500001, 0.1);

-- Jack (Group Heal)
INSERT INTO `items` VALUES(500002, 0, 'Jack\'s Ivory Charm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 65535, 4278190080, '0', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 1898, 'IT', 0, 54, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, -1, 0, 0, 0, 1, 1, 0, 0, 0, 131071, 0, 60, 0, 51, 1, 0, 0, -1, 0, 24576, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2022-03-17 04:16:11', '', 0, 0, 0, 0, 1, 0, 0, '', 0, 3577, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2022-03-17 04:16:11', NULL, 'CUSTOM', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '202231741611', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (5988,  500002, 10);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (17734, 500002, 10);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (510113,  500002, 0.1);

-- Stone Scale of Invulnerability
INSERT INTO `items` VALUES(500003, 0, 'Stone Scale of Invulnerability', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 65535, 4278190080, '0', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 1442, 'IT', 0, 54, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 1, 0, 0, 0, 131071, 0, 70, 0, 60, 1, 0, 0, -1, 0, 8192, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-17 04:35:42', '', 0, 0, 0, 0, 1, 0, 0, '', 0, 6739, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2022-03-17 04:28:19', NULL, 'CUSTOM', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '202231742819', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (510113,  500002, 0.1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (12025,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (3959,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (246,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (7735,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (7731,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (12025,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (7730,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (7733,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (2089,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (2091,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (131127,  500002, 1);
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance) VALUES (131120,  500002, 1);