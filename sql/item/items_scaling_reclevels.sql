-- Remove all reqlevels from working set
UPDATE items, ref_items
   SET items.reqlevel = 0
 WHERE items.id = ref_items.id
   AND ref_items.reqlevel > 0;

---- T4 (70)
-- By Spawns
UPDATE items, npc_types, spawn2, spawnentry, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(70, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id
   AND spawn2.spawngroupID = spawnentry.spawngroupID 
   AND spawnentry.npcID = npc_types.ID
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND ( spawn2.zone = 'provinggrounds' 
    OR   spawn2.zone = 'anguish' 
    OR   spawn2.zone = 'riftseekers'
	OR   spawn2.zone = 'dranik');
	
-- By npc_types.id
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(70, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND(( npc_types.id >= 316000 AND npc_types.id <= 316999 )
    OR ( npc_types.id >= 317000 AND npc_types.id <= 317999 )
	OR ( npc_types.id >= 334000 AND npc_types.id <= 334999 ) );
	
-- By Individual Mobs	
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(70, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND (npc_types.level > 80
    OR  npc_types.name LIKE '%Pyrique_Redwing%' 
    OR  npc_types.name LIKE '%Tarn_Icewind%'
	OR  npc_types.name LIKE '%Velitorkin%'
	OR  npc_types.name LIKE '%The%Murkglider%Hivequeen%' );
	
---- T3 (req 65)
-- By Spawns
UPDATE items, npc_types, spawn2, spawnentry, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(65, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id
   AND spawn2.spawngroupID = spawnentry.spawngroupID 
   AND spawnentry.npcID = npc_types.ID
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND ( spawn2.zone = 'tacvi' 
    OR   spawn2.zone = 'txevu' 
    OR   spawn2.zone = 'inktuta'
	OR   spawn2.zone = 'qvic'
	OR   spawn2.zone = 'uqua'
	OR   spawn2.zone = 'ikkinz'
	OR   spawn2.zone = 'yxtta'
	OR   spawn2.zone = 'kodtaz'
	OR   spawn2.zone = 'tipt'
	OR   spawn2.zone = 'vxed'
	OR   spawn2.zone = 'sncrematory'
	OR   spawn2.zone = 'snlair'
	OR   spawn2.zone = 'snpool'
	OR   spawn2.zone = 'snplant'
	OR   spawn2.zone = 'ferubi'
	OR   spawn2.zone = 'potimeb'
	OR   spawn2.zone = 'pofire'
	OR   spawn2.zone = 'poair'
	OR   spawn2.zone = 'powater'
	OR   spawn2.zone = 'poeartha'
	OR   spawn2.zone = 'poearthb'
	OR   spawn2.zone = 'solrotower'
	OR   spawn2.zone = 'potactics'
	OR   spawn2.zone = 'hohonora'
	OR   spawn2.zone = 'hohonorb'
	OR   spawn2.zone = 'bothunder'
	OR   spawn2.zone = 'codecay'
	OR   spawn2.zone = 'potorment'
	OR   spawn2.zone = 'povalor'
	OR   spawn2.zone = 'postorms'
	OR   spawn2.zone = 'pojustice'
	OR   spawn2.zone = 'podisease'
	OR   spawn2.zone = 'poinnovation'
	OR   spawn2.zone = 'wallofslaughter'
	OR   spawn2.zone = 'causeway'	
	); 	  
	
-- By npc_types.id
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(65, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND(( npc_types.id >= 298000 AND npc_types.id <= 298999 ) -- tacvi
    OR ( npc_types.id >= 297000 AND npc_types.id <= 297999 ) -- txevu
	OR ( npc_types.id >= 296000 AND npc_types.id <= 296999 ) -- inktuta
	OR ( npc_types.id >= 295000 AND npc_types.id <= 295999 ) -- qvic
	OR ( npc_types.id >= 294000 AND npc_types.id <= 294999 ) -- ikkinz
	OR ( npc_types.id >= 293000 AND npc_types.id <= 293999 ) -- kodtaz
	OR ( npc_types.id >= 292000 AND npc_types.id <= 292999 ) -- uqua
	OR ( npc_types.id >= 291000 AND npc_types.id <= 291999 ) -- yxtta
	OR ( npc_types.id >= 290000 AND npc_types.id <= 290999 ) -- vxed
	OR ( npc_types.id >= 289000 AND npc_types.id <= 289999 ) -- tipt
	OR ( npc_types.id >= 288000 AND npc_types.id <= 288999 ) -- sncrematory
	OR ( npc_types.id >= 287000 AND npc_types.id <= 287999 ) -- snplant
	OR ( npc_types.id >= 286000 AND npc_types.id <= 286999 ) -- snlair
	OR ( npc_types.id >= 285000 AND npc_types.id <= 285999 ) -- snpool
	OR ( npc_types.id >= 284000 AND npc_types.id <= 284999 ) -- ferubi
	OR ( npc_types.id >= 223000 AND npc_types.id <= 223999 ) -- potimeb
	OR ( npc_types.id >= 217000 AND npc_types.id <= 217999 ) -- pofire
	OR ( npc_types.id >= 215000 AND npc_types.id <= 215999 ) -- poair
	OR ( npc_types.id >= 216000 AND npc_types.id <= 216999 ) -- powater
	OR ( npc_types.id >= 218000 AND npc_types.id <= 218999 ) -- poeartha
	OR ( npc_types.id >= 222000 AND npc_types.id <= 222999 ) -- poearthb
	OR ( npc_types.id >= 212000 AND npc_types.id <= 212999 ) -- solrotower
	OR ( npc_types.id >= 214000 AND npc_types.id <= 214999 ) -- potactics
	OR ( npc_types.id >= 211000 AND npc_types.id <= 211999 ) -- hohonora
	OR ( npc_types.id >= 220000 AND npc_types.id <= 220999 ) -- hohonorb
	OR ( npc_types.id >= 209000 AND npc_types.id <= 209999 ) -- bothunder
	OR ( npc_types.id >= 200000 AND npc_types.id <= 200999 ) -- codecay
	OR ( npc_types.id >= 207000 AND npc_types.id <= 207999 ) -- potorment
	OR ( npc_types.id >= 208000 AND npc_types.id <= 208999 ) -- povalor
	OR ( npc_types.id >= 210000 AND npc_types.id <= 210999 ) -- postorms
	OR ( npc_types.id >= 201000 AND npc_types.id <= 201999 ) -- pojustice
	OR ( npc_types.id >= 205000 AND npc_types.id <= 205999 ) -- podisease
	OR ( npc_types.id >= 206000 AND npc_types.id <= 206999 ) -- poinnovation
	OR ( npc_types.id >= 300000 AND npc_types.id <= 300999 ) -- wallofslaughter
	OR ( npc_types.id >= 303000 AND npc_types.id <= 303999 ) -- causeway	
	);
	
-- By Individual Mobs	
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(65, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND (npc_types.name LIKE '%Cragbeast_Queen%'
   );

---- T2 (60)
-- By Spawns
UPDATE items, npc_types, spawn2, spawnentry, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(60, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id
   AND spawn2.spawngroupID = spawnentry.spawngroupID 
   AND spawnentry.npcID = npc_types.ID
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND ( spawn2.zone = 'akheva'
	OR   spawn2.zone = 'umbral'
	OR   spawn2.zone = 'vexthal'
	OR   spawn2.zone = 'thedeep'
	OR   spawn2.zone = 'ssratemple'
	OR   spawn2.zone = 'harbingers'
	OR   spawn2.zone = 'thegrey'
	OR   spawn2.zone = 'griegsend'
	OR   spawn2.zone = 'barindu'
	OR   spawn2.zone = 'qinimi'	
	OR   spawn2.zone = 'riwwi'
	OR   spawn2.zone = 'veeshan'
	);
	 
-- By npc_types.id
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(60, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND(( npc_types.id >= 179000  AND npc_types.id <= 179999 ) -- Akheva
    OR ( npc_types.id >= 176000  AND npc_types.id <= 176999 ) -- Umbral
	OR ( npc_types.id >= 158000  AND npc_types.id <= 158999 ) -- Vexthal
	OR ( npc_types.id >= 164000  AND npc_types.id <= 164999 ) -- thedeep
	OR ( npc_types.id >= 162000  AND npc_types.id <= 162999 ) -- ssratemple
	OR ( npc_types.id >= 335000  AND npc_types.id <= 335999 ) -- harbingers
	OR ( npc_types.id >= 171000  AND npc_types.id <= 171999 ) -- thegrey
	OR ( npc_types.id >= 163000  AND npc_types.id <= 163999 ) -- griegsend
    OR ( npc_types.id >= 283000  AND npc_types.id <= 283999 ) -- barindu
    OR ( npc_types.id >= 281000  AND npc_types.id <= 281999 ) -- qinimi
    OR ( npc_types.id >= 282000  AND npc_types.id <= 282999 ) -- riwwi
	OR ( npc_types.id >= 108000  AND npc_types.id <= 108999 ) -- veeshan
    );
	
-- By Individual Mobs	
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(60, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND (npc_types.name LIKE '%Grieg_Veneficus%'
	OR  npc_types.name LIKE '%Lcea_Katta%'
	OR  npc_types.name LIKE '%Khati_Sha_the_Twisted%'
	OR  npc_types.name LIKE '%Lord_Inquisitor_Seru%'
	OR  npc_types.name LIKE '%The_Burrower_Beast%'
	OR  npc_types.name LIKE '%Thought_Horror_Overfiend%' 
	);
	
---- T2 (55)
-- By Spawns
UPDATE items, npc_types, spawn2, spawnentry, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(55, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id
   AND spawn2.spawngroupID = spawnentry.spawngroupID 
   AND spawnentry.npcID = npc_types.ID
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND ( spawn2.zone = 'droga' 
    OR   spawn2.zone = 'kael'
	OR   spawn2.zone = 'skyshrine'
	OR   spawn2.zone = 'growthplane'
	OR   spawn2.zone = 'mischiefplane'
	OR   spawn2.zone = 'templeveeshan'
	OR   spawn2.zone = 'westwastes'
	OR   spawn2.zone = 'sleepers'
	OR   spawn2.zone = 'necropolis'
	OR   spawn2.zone = 'thurgadinb'
    OR   spawn2.zone = 'bloodfields'	
	);
	 
-- By npc_types.id
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(55, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND(( npc_types.id >= 81000   AND npc_types.id <= 141999 ) -- droga
    OR ( npc_types.id >= 113000  AND npc_types.id <= 113999 ) -- kael
	OR ( npc_types.id >= 114000  AND npc_types.id <= 114999 ) -- skyshrine
	OR ( npc_types.id >= 127000  AND npc_types.id <= 127999 ) -- growthplane
	OR ( npc_types.id >= 126000  AND npc_types.id <= 126999 ) -- mischiefplane
	OR ( npc_types.id >= 120000  AND npc_types.id <= 120999 ) -- westwastes
	OR ( npc_types.id >= 124000  AND npc_types.id <= 124999 ) -- templeveeshan
	OR ( npc_types.id >= 128000  AND npc_types.id <= 128999 ) -- sleeper
	OR ( npc_types.id >= 123000  AND npc_types.id <= 123999 ) -- necropolis 
	OR ( npc_types.id >= 301000  AND npc_types.id <= 301999 ) -- bloodfields
	);
	
-- By Individual Mobs	
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Greatest(55, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND (npc_types.name LIKE '%Zlandicar%' 
    OR  npc_types.name LIKE '%Doljonijiarnimorinar%'
	OR  npc_types.name LIKE '%Velketor%' 
	);
	
---- T1
-- By Spawns
UPDATE items, npc_types, spawn2, spawnentry, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Least(52, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id
   AND spawn2.spawngroupID = spawnentry.spawngroupID 
   AND spawnentry.npcID = npc_types.ID
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND ( spawn2.zone = 'hateplaneb' 
    OR   spawn2.zone = 'fearplane'
	OR   spawn2.zone = 'airplane'
	OR   spawn2.zone = 'draniksscar'
	OR   spawn2.zone = 'soldungb'
	OR   spawn2.zone = 'permafrost'
	OR   spawn2.zone = 'sebilis'
	OR   spawn2.zone = 'karnor'
	OR   spawn2.zone = 'nurga'
	OR   spawn2.zone = 'droga'
	OR   spawn2.zone = 'hateplaneb'
	OR   spawn2.zone = 'wakening'
	OR   spawn2.zone = 'veksar'
	OR   spawn2.zone = 'citymist'
	OR   spawn2.zone = 'warslikswood'
	OR   spawn2.zone = 'charasis'
	OR   spawn2.zone = 'chardok'
	OR   spawn2.zone = 'thurgadinb'
	OR   spawn2.zone = 'frozenshadow'
	OR   spawn2.zone = 'kaesora'
	OR   spawn2.zone = 'lakeofillomen'
	OR   spawn2.zone = 'nadox'
	OR   spawn2.zone = 'hatesfury'
	);
	 
-- By npc_types.id
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = Least(52, ref_items.reclevel, ref_items.reqlevel)
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND(( npc_types.id >= 186000  AND npc_types.id <= 186999 ) -- hateplaneb
    OR ( npc_types.id >= 72000   AND npc_types.id <= 72999  ) -- fearplane
	OR ( npc_types.id >= 71000   AND npc_types.id <= 71999  ) -- airplane
	OR ( npc_types.id >= 302000  AND npc_types.id <= 302999 ) -- draniksscar
	OR ( npc_types.id >= 109000  AND npc_types.id <= 109999 ) -- veksar
	OR ( npc_types.id >= 32000   AND npc_types.id <= 32999 )  -- soldungb
	OR ( npc_types.id >= 73000   AND npc_types.id <= 73999 )  -- permafrost
	OR ( npc_types.id >= 89000  AND npc_types.id <= 89999 )   -- sebilis
	OR ( npc_types.id >= 102000  AND npc_types.id <= 102999 ) -- karnor
	OR ( npc_types.id >= 107000  AND npc_types.id <= 107999 ) -- nurga
	OR ( npc_types.id >= 81000  AND npc_types.id <= 81999 ) -- droga
	OR ( npc_types.id >= 186000  AND npc_types.id <= 186999 ) -- hateplaneb
	OR ( npc_types.id >= 119000  AND npc_types.id <= 119999 ) -- wakening
	OR ( npc_types.id >= 90000  AND npc_types.id <= 90999 ) -- citymist
	OR ( npc_types.id >= 79000  AND npc_types.id <= 79999 ) -- warslikswood
	OR ( npc_types.id >= 105000  AND npc_types.id <= 105999 ) -- charasis
	OR ( npc_types.id >= 103000  AND npc_types.id <= 103999 ) -- chardok
	OR ( npc_types.id >= 129000  AND npc_types.id <= 129999 ) -- thurgadinb
	OR ( npc_types.id >= 111000  AND npc_types.id <= 111999 ) -- frozenshadow
	OR ( npc_types.id >= 89000  AND npc_types.id <= 89999 ) -- kaesora
	OR ( npc_types.id >= 85000  AND npc_types.id <= 85999 ) -- frozenshadow
	OR ( npc_types.id >= 228000  AND npc_types.id <= 228999 ) -- hatesfury
	OR ( npc_types.id >= 227000  AND npc_types.id <= 227999 ) -- nadox
	);
	
-- By Individual Mobs	
UPDATE items, npc_types, loottable_entries, lootdrop_entries, ref_items
   SET items.reclevel = 52
 WHERE lootdrop_entries.item_id = items.id
   AND loottable_entries.lootdrop_id = lootdrop_entries.lootdrop_id
   AND npc_types.loottable_id = loottable_entries.loottable_id      
   AND ref_items.slots > 0
   AND ref_items.id = items.id
   AND (ref_items.astr > 0 OR ref_items.asta > 0 OR ref_items.adex > 0 OR ref_items.aagi > 0 OR ref_items.aint > 0 OR ref_items.acha > 0 OR ref_items.acha > 0 OR ref_items.hp > 0 OR ref_items.mana > 0 OR ref_items.proceffect > 0 OR ref_items.clickeffect > 0 OR ref_items.worneffect > 0 OR ref_items.haste > 0 OR ref_items.manaregen > 0 OR ref_items.regen > 0 )
   AND (npc_types.name LIKE '%Lord_Nagafen%' 
    OR  npc_types.name LIKE '%Lady_Vox%'
	OR  npc_types.name LIKE '%Phinigel_Autropos%'
    OR  npc_types.name LIKE '%Master_Yael%'
	OR  npc_types.name LIKE '%Garudon%'
	OR  npc_types.name LIKE '%Venril_Sathir%'
	OR  npc_types.name LIKE '%Drusella_Sathir%'
	OR  npc_types.name LIKE '%Trakanon%'
	OR (npc_types.name LIKE '%Innoruuk%' AND npc_types.id = 186107)
	OR (npc_types.name LIKE '%Cazic_Thule%' AND npc_types.id = 72003)
	OR  npc_types.name LIKE '%Faydedar%'
	OR  npc_types.name LIKE '%Severilous%'
	OR  npc_types.name LIKE '%Talendor%' 
	);

-- Add Rec Level by Item
-- Epic 1.0
UPDATE items, ref_items
   SET items.reclevel = 52, items.maxcharges = -1
 WHERE items.id IN (28034, 55273, 10910, 10909, 20490, 10650, 20488, 20487, 20542, 11057, 10652, 10651, 14341, 5532, 14383, 20544, 11050, 10908, 8495, 8496); 