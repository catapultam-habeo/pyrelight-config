-- Attempt to Reset Augments
UPDATE items, ref_items
   SET items.astr = ref_items.astr,
       items.asta = ref_items.asta,
	   items.adex = ref_items.adex,
	   items.aagi = ref_items.aagi,
	   items.aint = ref_items.aint,
	   items.awis = ref_items.awis,
	   items.acha = ref_items.acha,
	   items.mr   = ref_items.mr,
	   items.fr   = ref_items.fr,
	   items.cr   = ref_items.cr,
	   items.dr   = ref_items.dr,
	   items.pr   = ref_items.pr,
	   items.heroic_str = ref_items.heroic_str,
	   items.heroic_sta = ref_items.heroic_sta,
	   items.heroic_dex = ref_items.heroic_dex,
	   items.heroic_agi = ref_items.heroic_agi,
	   items.heroic_int = ref_items.heroic_int,
	   items.heroic_wis = ref_items.heroic_wis,
	   items.heroic_cha = ref_items.heroic_cha,
	   items.heroic_mr = ref_items.heroic_mr,
	   items.heroic_fr = ref_items.heroic_fr,
	   items.heroic_cr = ref_items.heroic_cr,
	   items.heroic_dr = ref_items.heroic_dr,
	   items.heroic_pr = ref_items.heroic_pr,	   
	   items.spelldmg = 0,
	   items.healamt = 0,
	   items.hp = ref_items.hp, 						  -- Sta * 5
	   items.mana = ref_items.mana,						  -- INT OR WIS * 5
	   items.endur = ref_items.endur,
	   items.regen = ref_items.regen,					  -- Sta > 10, Sta/5
	   items.manaregen = ref_items.manaregen,             -- Int, Wis > 10, INT OR WIS /5
	   items.enduranceregen = ref_items.enduranceregen,   -- N\A
	   items.shielding = ref_items.shielding,             -- STR + STA / 2 (STR + STA > 0)
	   items.stunresist = ref_items.stunresist,           -- = greatest between shielding and spellshield
	   items.spellshield = ref_items.spellshield,         -- INT / 3
	   items.dotshielding = ref_items.dotshielding,       -- WIS / 3
	   items.dsmitigation = ref_items.dsmitigation,       -- N\A
	   items.damageshield = ref_items.damageshield,       -- N\A
	   items.avoidance = ref_items.avoidance,             -- AGI / 5
	   items.attack = ref_items.attack,                   -- STR + DEX + AGI * 2 (at least 1 > 0, round up by 5's)
	   items.strikethrough = ref_items.strikethrough,     -- STR / 3
	   items.combateffects = ref_items.combateffects,     -- DEX / 3
	   items.accuracy = ref_items.accuracy,               -- AGI + DEX (AGI, DEX > 0)
	   items.clairvoyance = ref_items.clairvoyance,       -- N\A
	   items.delay=0         
 WHERE (items.itemtype = 54 OR ref_items.itemtype = 54)
   AND items.id = ref_items.id;
   
-- Do Primary Scaling
UPDATE items, ref_items
   SET items.hp = (ref_items.hp * 2) + Greatest(50, items.reqlevel, items.reclevel),
       items.mana = (ref_items.mana * 2) + Greatest(50, items.reqlevel, items.reclevel),
	   items.endur = ref_items.endur + Greatest(50, items.reqlevel, items.reclevel)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54);
  
-- Generate Heroic Stats based off existing Mod2 Stats
UPDATE items, ref_items
   SET items.heroic_str = (ref_items.strikethrough + ref_items.damageshield + ref_items.shielding + ref_items.stunresist + ref_items.regen) * 10 + Floor((ref_items.accuracy + ref_items.attack)/5),
	   items.heroic_sta = (ref_items.shielding + ref_items.spellshield + ref_items.stunresist + ref_items.regen) * 10,
	   items.heroic_dex = ref_items.combateffects * 10,
	   items.heroic_agi = ref_items.avoidance,
	   items.heroic_int = ref_items.spellshield + ref_items.clairvoyance + ref_items.damageshield * 10,
	   items.heroic_wis = ref_items.spellshield + ref_items.clairvoyance + ref_items.damageshield * 10
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54);

-- hp
UPDATE items, ref_items
   SET items.hp = items.hp + (ref_items.asta * 5) + (ref_items.regen * 10)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  ref_items.asta > 0;

-- mana  
UPDATE items, ref_items
   SET items.mana = items.hp + (Greatest(ref_items.aint, ref_items.awis) * 5) + (ref_items.manaregen * 10)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND (ref_items.aint > 0 OR ref_items.awis > 0);
  
-- regen
UPDATE items, ref_items
   SET items.regen = (ref_items.regen * 5) + Floor(ref_items.asta / 5)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  ref_items.asta >= 5;
   
-- mana regen
UPDATE items, ref_items
   SET items.manaregen = (ref_items.manaregen * 3) + Floor(Greatest(ref_items.aint, ref_items.awis) / 5)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND (ref_items.aint >= 5 OR ref_items.awis >= 5);
  
-- endurance regen
UPDATE items, ref_items
   SET items.enduranceregen = items.enduranceregen + Floor(ref_items.asta / 10)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  ref_items.asta >= 10;
  
  
-- shielding
UPDATE items, ref_items
   SET items.shielding = ref_items.shielding + Floor((ref_items.astr + ref_items.asta) / 2)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND (items.astr + items.asta) > 0;

-- stunresist
UPDATE items, ref_items
   SET items.stunresist = items.stunresist + items.shielding
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.shielding > 0;
  
-- spellshield
UPDATE items, ref_items
   SET items.spellshield = items.spellshield + Floor(items.aint / 3)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.aint >= 3;
  
-- dotshielding
UPDATE items, ref_items
   SET items.dotshielding = items.dotshielding + Floor(items.awis / 3)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.awis >= 3;
  
-- avoidance
UPDATE items, ref_items
   SET items.avoidance = items.avoidance + Floor(items.aagi / 3)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.aagi >= 3;
  
-- attack
UPDATE items, ref_items
   SET items.attack = items.attack + Floor((((items.astr + items.adex + items.aagi) * 2) + 4) / 5) * 5
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND (items.astr + items.adex + items.aagi) > 0;

-- strikethrough
UPDATE items, ref_items
   SET items.strikethrough = items.strikethrough + Floor(items.astr / 3)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.astr >= 3;
  
-- combateffects
UPDATE items, ref_items
   SET items.combateffects = items.combateffects + Floor(items.adex / 3)
 WHERE items.id = ref_items.id
  AND (items.itemtype = 54 OR ref_items.itemtype = 54)
  AND  items.adex >= 3;
  
-- Round up HP/Mana
UPDATE items
SET items.hp = (Ceil((items.hp + 4) / 5) * 5),
	items.mana = (Ceil((items.mana + 4) / 5) * 5)
WHERE items.itemtype = 54;

-- Adjust Weapon Damage
--- All Weapons
UPDATE items,ref_items 
SET    items.elemdmgamt = Floor(ref_items.elemdmgamt * 10),
	   items.backstabdmg = Floor(ref_items.backstabdmg * 10),
	   items.banedmgamt = Floor(ref_items.banedmgamt * 10),
	   items.damage = Floor(ref_items.damage * 5)
WHERE  ref_items.delay > 0 AND  ref_items.id = items.id 
  AND  items.classes > 0 AND items.slots > 0 AND items.itemtype = 54; 

-- Dump Primary Stats from ALL augs
UPDATE items
   SET astr = 0, asta = 0, adex = 0, aagi = 0, aint = 0, awis = 0, acha = 0
 WHERE itemtype = 54;

-- Dump Rec Level from augs with no stats
UPDATE items
   SET reclevel = 0
 WHERE itemtype = 54
   AND astr = 0 AND asta = 0 AND adex = 0 AND aagi = 0 AND awis = 0 AND acha = 0
   AND hp = 0 AND mana = 0 AND endur = 0
   AND regen = 0 AND manaregen = 0 AND enduranceregen = 0
   AND shielding = 0 AND dotshielding = 0 AND spellshield = 0 AND avoidance = 0 AND accuracy = 0 AND ac = 0
   AND combateffects = 0 AND stunresist = 0 AND strikethrough = 0 AND attack = 0 AND damageshield = 0
   AND heroic_agi = 0 AND heroic_cha = 0 AND heroic_dex = 0 AND heroic_str = 0 AND heroic_int = 0 AND heroic_wis = 0
   AND fr = 0 AND mr = 0 AND cr = 0 AND pr = 0 AND dr = 0 AND heroic_cr = 0 AND heroic_fr = 0 AND heroic_mr = 0 AND heroic_pr = 0 AND heroic_dr = 0;