-- Insert OOW Tradeskill Worn\Focus Augs into Global Loot
REPLACE INTO global_loot (id,description,loottable_id,min_level,max_level) VALUES (500000,"GLB-Augs",500000,1,100);
REPLACE INTO loottable (id, name) VALUES (500000,'GLB-Augs');
REPLACE INTO lootdrop  (id, name) VALUES (500000,'GLB-Type3-T1');
REPLACE INTO loottable_entries (loottable_id, lootdrop_id, droplimit,mindrop,probability) VALUES (500000,500000,1,1,1);


-- OoW Tradeskill Augs
---- OoW Type 3 Tradeskill Tier ~1 (1-60)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 1, 60
FROM items
WHERE ( name LIKE 'Stormflow of Minor%'
	 OR name LIKE 'Bloodflow of Minor%'
	 OR name LIKE 'Boneflow of Minor%'
	 OR name LIKE 'Emberflow of Minor%'
	 OR name LIKE 'Fireflow of Minor%'
	 OR name LIKE 'Mossflow of Minor%'
	 OR name LIKE 'Mudflow of Minor%'
	 OR name LIKE 'Shadowflow of Minor%'
	 OR name LIKE 'Skyflow of Minor%'
	 OR name LIKE 'Starflow of Minor%'
	 OR name LIKE 'Voidflow of Minor%'
	 OR name LIKE 'Waterflow of Minor%'
	 OR name LIKE 'Sodalite of Minor%'
	 OR name LIKE 'Sphalerite of Minor%'
	 OR name LIKE 'Howlite of Minor%'
	 OR name LIKE 'Kyanite of Minor%'
	 OR name LIKE 'Apatite of Minor%'
	 OR name LIKE 'Celestine of Minor%'
	 OR name LIKE 'Citrine of Minor%'
	 OR name LIKE 'Titanite of Minor%'
	 OR name LIKE 'Tourmaline of Minor%' ); 

---- OoW Type 3 Tradeskill Tier ~2 (52-65)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 52, 65
FROM items
WHERE ( name LIKE 'Stormflow of %'
	 OR name LIKE 'Bloodflow of %'
	 OR name LIKE 'Emberflow of %'
	 OR name LIKE 'Fireflow of %'
	 OR name LIKE 'Mossflow of %'
	 OR name LIKE 'Mudflow of %'
	 OR name LIKE 'Shadowflow of %'
	 OR name LIKE 'Skyflow of %'
	 OR name LIKE 'Starflow of %'
	 OR name LIKE 'Voidflow of %'
	 OR name LIKE 'Waterflow of %'
	 OR name LIKE 'Sodalite of %'
	 OR name LIKE 'Sphalerite of %'
	 OR name LIKE 'Howlite of %'
	 OR name LIKE 'Kyanite of %'
	 OR name LIKE 'Apatite of %'
	 OR name LIKE 'Celestine of %'
	 OR name LIKE 'Citrine of %'
	 OR name LIKE 'Titanite of %'
	 OR name LIKE 'Tourmaline of %' )
AND NOT
      ( name LIKE 'Stormflow of Minor%'
	 OR name LIKE 'Bloodflow of Minor%'
	 OR name LIKE 'Emberflow of Minor%'
	 OR name LIKE 'Fireflow of Minor%'
	 OR name LIKE 'Mossflow of Minor%'
	 OR name LIKE 'Mudflow of Minor%'
	 OR name LIKE 'Shadowflow of Minor%'
	 OR name LIKE 'Skyflow of Minor%'
	 OR name LIKE 'Starflow of Minor%'
	 OR name LIKE 'Voidflow of Minor%'
	 OR name LIKE 'Waterflow of Minor%'
	 OR name LIKE 'Sodalite of Minor%'
	 OR name LIKE 'Sphalerite of Minor%'
	 OR name LIKE 'Howlite of Minor%'
	 OR name LIKE 'Kyanite of Minor%'
	 OR name LIKE 'Apatite of Minor%'
	 OR name LIKE 'Celestine of Minor%'
	 OR name LIKE 'Citrine of Minor%'
	 OR name LIKE 'Titanite of Minor%'
	 OR name LIKE 'Tourmaline of Minor%' ) 
AND NOT
      ( name LIKE 'Stormflow of Pure%'
	 OR name LIKE 'Bloodflow of Pure%'
	 OR name LIKE 'Emberflow of Pure%'
	 OR name LIKE 'Fireflow of Pure%'
	 OR name LIKE 'Mossflow of Pure%'
	 OR name LIKE 'Mudflow of Pure%'
	 OR name LIKE 'Shadowflow of Pure%'
	 OR name LIKE 'Skyflow of Pure%'
	 OR name LIKE 'Starflow of Pure%'
	 OR name LIKE 'Voidflow of Pure%'
	 OR name LIKE 'Waterflow of Pure%'
	 OR name LIKE 'Sodalite of Pure%'
	 OR name LIKE 'Sphalerite of Pure%'
	 OR name LIKE 'Howlite of Pure%'
	 OR name LIKE 'Kyanite of Pure%'
	 OR name LIKE 'Apatite of Pure%'
	 OR name LIKE 'Celestine of Pure%'
	 OR name LIKE 'Citrine of Pure%'
	 OR name LIKE 'Titanite of Pure%'
	 OR name LIKE 'Tourmaline of Pure%' );

---- OoW Type 3 Tradeskill Tier ~3 (64+)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 64, 100
FROM items
WHERE ( name LIKE 'Stormflow of Pure%'
	 OR name LIKE 'Bloodflow of Pure%'
	 OR name LIKE 'Emberflow of Pure%'
	 OR name LIKE 'Fireflow of Pure%'
	 OR name LIKE 'Mossflow of Pure%'
	 OR name LIKE 'Mudflow of Pure%'
	 OR name LIKE 'Shadowflow of Pure%'
	 OR name LIKE 'Skyflow of Pure%'
	 OR name LIKE 'Starflow of Pure%'
	 OR name LIKE 'Voidflow of Pure%'
	 OR name LIKE 'Waterflow of Pure%'
	 OR name LIKE 'Sodalite of Pure%'
	 OR name LIKE 'Sphalerite of Pure%'
	 OR name LIKE 'Howlite of Pure%'
	 OR name LIKE 'Kyanite of Pure%'
	 OR name LIKE 'Apatite of Pure%'
	 OR name LIKE 'Celestine of Pure%'
	 OR name LIKE 'Citrine of Pure%'
	 OR name LIKE 'Titanite of Pure%'
	 OR name LIKE 'Tourmaline of Pure%' ); 

---- OoW Type 1 Tradeskill Tier 1 (1-52)	 
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 1, 52
FROM items
WHERE ( name LIKE 'Stormflow Stone'
	 OR name LIKE 'Bloodflow Stone'
	 OR name LIKE 'Boneflow Stone'
	 OR name LIKE 'Emberflow Stone'
	 OR name LIKE 'Fireflow Stone'
	 OR name LIKE 'Mossflow Stone'
	 OR name LIKE 'Mudflow Stone'
	 OR name LIKE 'Shadowflow Stone'
	 OR name LIKE 'Skyflow Stone'
	 OR name LIKE 'Starflow Stone'
	 OR name LIKE 'Voidflow Stone'
	 OR name LIKE 'Waterflow Stone'
	 OR name LIKE 'Sodalite'
	 OR name LIKE 'Sphalerite'
	 OR name LIKE 'Howlite'
	 OR name LIKE 'Kyanite'
	 OR name LIKE 'Apatite'
	 OR name LIKE 'Celestine'
	 OR name LIKE 'Citrine'
	 OR name LIKE 'Titanite'
	 OR name LIKE 'Tourmaline' );

---- OoW Type 1 Tradeskill Tier 2 (53-60)	 
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 53, 60
FROM items
WHERE ( name LIKE 'Polished Stormflow Stone'
	 OR name LIKE 'Polished Bloodflow Stone'
	 OR name LIKE 'Polished Boneflow Stone'
	 OR name LIKE 'Polished Emberflow Stone'
	 OR name LIKE 'Polished Fireflow Stone'
	 OR name LIKE 'Polished Mossflow Stone'
	 OR name LIKE 'Polished Mudflow Stone'
	 OR name LIKE 'Polished Shadowflow Stone'
	 OR name LIKE 'Polished Skyflow Stone'
	 OR name LIKE 'Polished Starflow Stone'
	 OR name LIKE 'Polished Voidflow Stone'
	 OR name LIKE 'Polished Waterflow Stone'
	 OR name LIKE 'Polished Sodalite'
	 OR name LIKE 'Polished Sphalerite'
	 OR name LIKE 'Polished Howlite'
	 OR name LIKE 'Polished Kyanite'
	 OR name LIKE 'Polished Apatite'
	 OR name LIKE 'Polished Celestine'
	 OR name LIKE 'Polished Citrine'
	 OR name LIKE 'Polished Titanite'
	 OR name LIKE 'Polished Tourmaline' );

---- OoW Type 1 Tradeskill Tier 3 (61-65)		 
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 61, 65
FROM items
WHERE ( name LIKE 'Brilliant Cut Stormflow Stone'
	 OR name LIKE 'Brilliant Cut Bloodflow Stone'
	 OR name LIKE 'Brilliant Cut Boneflow Stone'
	 OR name LIKE 'Brilliant Cut Emberflow Stone'
	 OR name LIKE 'Brilliant Cut Fireflow Stone'
	 OR name LIKE 'Brilliant Cut Mossflow Stone'
	 OR name LIKE 'Brilliant Cut Mudflow Stone'
	 OR name LIKE 'Brilliant Cut Shadowflow Stone'
	 OR name LIKE 'Brilliant Cut Skyflow Stone'
	 OR name LIKE 'Brilliant Cut Starflow Stone'
	 OR name LIKE 'Brilliant Cut Voidflow Stone'
	 OR name LIKE 'Brilliant Cut Waterflow Stone'
	 OR name LIKE 'Brilliant Cut Sodalite'
	 OR name LIKE 'Brilliant Cut Sphalerite'
	 OR name LIKE 'Brilliant Cut Howlite'
	 OR name LIKE 'Brilliant Cut Kyanite'
	 OR name LIKE 'Brilliant Cut Apatite'
	 OR name LIKE 'Brilliant Cut Celestine'
	 OR name LIKE 'Brilliant Cut Citrine'
	 OR name LIKE 'Brilliant Cut Titanite'
	 OR name LIKE 'Brilliant Cut Tourmaline' );

---- OoW Type 1 Tradeskill Tier 4 (66+)		 
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT 500000, items.id, 0.05, 66, 100
FROM items
WHERE ( name LIKE 'Radiant Cut Stormflow Stone'
	 OR name LIKE 'Radiant Cut Bloodflow Stone'
	 OR name LIKE 'Radiant Cut Boneflow Stone'
	 OR name LIKE 'Radiant Cut Emberflow Stone'
	 OR name LIKE 'Radiant Cut Fireflow Stone'
	 OR name LIKE 'Radiant Cut Mossflow Stone'
	 OR name LIKE 'Radiant Cut Mudflow Stone'
	 OR name LIKE 'Radiant Cut Shadowflow Stone'
	 OR name LIKE 'Radiant Cut Skyflow Stone'
	 OR name LIKE 'Radiant Cut Starflow Stone'
	 OR name LIKE 'Radiant Cut Voidflow Stone'
	 OR name LIKE 'Radiant Cut Waterflow Stone'
	 OR name LIKE 'Radiant Cut Sodalite'
	 OR name LIKE 'Radiant Cut Sphalerite'
	 OR name LIKE 'Radiant Cut Howlite'
	 OR name LIKE 'Radiant Cut Kyanite'
	 OR name LIKE 'Radiant Cut Apatite'
	 OR name LIKE 'Radiant Cut Celestine'
	 OR name LIKE 'Radiant Cut Citrine'
	 OR name LIKE 'Radiant Cut Titanite'
	 OR name LIKE 'Radiant Cut Tourmaline' );
	 
-- LDON Merchant Augs
---- Tier 1 (1-52)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500000, items.id, 0.05, 1, 52
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel <= 52);   
   
---- Tier 2 (53-60)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500000, items.id, 0.05, 53, 60
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel >= 53 AND items.reclevel <= 60);  
   
---- Tier 3 & Tier 4 (61-65, 66+) (Combined these because of limitations of what is available in LDON merchants)
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500000, items.id, 0.05, 61, 100
FROM items, merchantlist
WHERE (merchantlist.merchantid=22108 OR merchantlist.merchantid=34148 OR merchantlist.merchantid=35062 OR merchantlist.merchantid=68128 OR merchantlist.merchantid=30083) 
   AND items.itemtype=54
   AND items.id=merchantlist.item
   AND (items.reclevel >= 61);
      
-- LDON Raid Augs, Insert into Tier 3-Tier 4 range.
REPLACE INTO lootdrop_entries(lootdrop_id, item_id, chance, npc_min_level, npc_max_level)
SELECT DISTINCT 500000, items.id, 0.05, 61, 100
FROM items
WHERE ( 
	items.name LIKE 'Flowkeeper\'s Shard of Knowledge' OR
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
	items.name LIKE 'Yenner\'s Rock of Enhanced Protection' )	   
AND     items.itemtype=54;