-- Reset to 0
UPDATE items
   SET astr = 0, asta = 0, adex = 0, aagi = 0, aint = 0, awis = 0, acha = 0,
       spellshield = 0, dotshielding = 0, shielding = 0, stunresist = 0, dsmitigation = 0,
	   damageshield = 0, accuracy = 0, attack = 0, haste = 0, avoidance = 0, strikethrough = 0,
	   ac = 0, regen = 0, manaregen = 0, enduranceregen = 0, slots = 2097150, loregroup = 0,
	   reclevel = 0, items.reqlevel = 0, hp = 0, mana = 0, endur = 0, ac = 0
 WHERE items.itemtype = 54
  AND (name LIKE '%Bloodflow%'
   OR  name LIKE '%Boneflow%'
   OR  name LIKE '%Emberflow%'
   OR  name LIKE '%Fireflow%'
   OR  name LIKE '%Mossflow%'
   OR  name LIKE '%Mudflow%'
   OR  name LIKE '%Shadowflow%'
   OR  name LIKE '%Skyflow%'
   OR  name LIKE '%Starflow%'
   OR  name LIKE '%Stormflow%'
   OR  name LIKE '%Voidflow%'
   OR  name LIKE '%Waterflow%'
   OR  name LIKE '%Apatite%'
   OR  name LIKE '%Celestine%'
   OR  name LIKE '%Citrine%'
   OR  name LIKE '%Howlite%'
   OR  name LIKE '%Sodalite%'
   OR  name LIKE '%Sphalerite%'
   OR  name LIKE '%Titanite%'
   OR  name LIKE '%Tourmaline%');    
   
-- 'Extra' Marked Stones
--- 'of % Battle'
-- Minor
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 6327
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Minor Battle';
-- 'Regular'
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 6328
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Battle';
-- 'Pure'
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 6329
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Pure Battle';
--- 'of % Rage'
-- Minor
UPDATE items, ref_items
   SET items.name = Replace(ref_items.name, 'Sight', 'Rage'), items.focuseffect = 2457, items.focustype = 6,
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Minor Sight';
-- 'Regular'
UPDATE items, ref_items
   SET items.name = Replace(ref_items.name, 'Sight', 'Rage'), items.focuseffect = 2458, items.focustype = 6,
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Sight';
-- 'Pure'
UPDATE items, ref_items
   SET items.name = Replace(ref_items.name, 'Sight', 'Rage'), items.focuseffect = 2459, items.focustype = 6, 
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Pure Sight';
--- 'of % Extension'
-- Minor
UPDATE items, ref_items
   SET items.focuseffect = 2350, items.focustype = 6,
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Minor Extension';
-- 'Regular'
UPDATE items, ref_items
   SET items.focuseffect = 3510, items.focustype = 6,
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Extension';
-- 'Pure'
UPDATE items, ref_items
   SET items.focuseffect = 6413, items.focustype = 6, 
       items.worntype = 0, items.worneffect = -1
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Pure Extension';
--- 'of % Haste'
-- Minor
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 5606
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Minor Haste';
-- 'Regular'
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 5607
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Haste';
-- 'Pure'
UPDATE items, ref_items
   SET items.worntype = 2, items.worneffect = 5608
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE '% of Pure Haste';
   
-- Unmarked Augments
--- Emberflow, Mossflow, Shadowflow, Stormflow, Voidflow
UPDATE items, ref_items
   SET items.ac = 15,
       items.hp = 50, 
	   items.mana = 50,
	   items.mr = 6, items.fr = 6, items.cr = 6, items.pr = 6, items.dr = 6,
	   items.heroic_mr = 3, items.heroic_fr = 3, items.heroic_cr = 3, items.heroic_pr = 3, items.heroic_dr = 3,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
  AND (items.name LIKE 'Emberflow Stone' OR
       items.name LIKE 'Mossflow Stone'  OR
	   items.name LIKE 'Shadowflow Stone' OR
	   items.name LIKE 'Stormflow Stone'  OR
	   items.name LIKE 'Voidflow Stone' );
	   
UPDATE items, ref_items
   SET items.ac = 30,
       items.reqlevel = 60,
       items.hp = 100,
	   items.mana = 100,
	   items.mr = 12, items.fr = 12, items.cr = 12, items.pr = 12, items.dr = 12,
	   items.heroic_mr = 6, items.heroic_fr = 6, items.heroic_cr = 6, items.heroic_pr = 6, items.heroic_dr = 6,
	   items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
  AND (items.name LIKE 'Polished Emberflow Stone' OR
       items.name LIKE 'Polished Mossflow Stone'  OR
	   items.name LIKE 'Polished Shadowflow Stone' OR
	   items.name LIKE 'Polished Stormflow Stone'  OR
	   items.name LIKE 'Polished Voidflow Stone' );
	   
UPDATE items, ref_items
   SET items.ac = 60,
	   items.reclevel = 65, items.reqlevel = 61,
       items.hp = 200, 
	   items.mana = 200,
	   items.mr = 24, items.fr = 24, items.cr = 24, items.pr = 24, items.dr = 24,
	   items.heroic_mr = 12, items.heroic_fr = 12, items.heroic_cr = 12, items.heroic_pr = 12, items.heroic_dr = 12,
	   items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
  AND (items.name LIKE 'Brilliant Cut Emberflow Stone' OR
       items.name LIKE 'Brilliant Cut Mossflow Stone'  OR
	   items.name LIKE 'Brilliant Cut Shadowflow Stone' OR
	   items.name LIKE 'Brilliant Cut Stormflow Stone'  OR
	   items.name LIKE 'Brilliant Cut Voidflow Stone' );
	   
UPDATE items, ref_items
   SET items.ac = 120,
	   items.reclevel = 70, items.reqlevel = 66,
       items.hp = 400, 
	   items.mana = 400,
	   items.mr = 42, items.fr = 42, items.cr = 42, items.pr = 24, items.dr = 42,
	   items.heroic_mr = 24, items.heroic_fr = 24, items.heroic_cr = 24, items.heroic_pr = 24, items.heroic_dr = 24,
	   items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
  AND (items.name LIKE 'Radiant Cut Emberflow Stone' OR
       items.name LIKE 'Radiant Cut Mossflow Stone'  OR
	   items.name LIKE 'Radiant Cut Shadowflow Stone' OR
	   items.name LIKE 'Radiant Cut Stormflow Stone'  OR
	   items.name LIKE 'Radiant Cut Voidflow Stone' );

---- Apatite
UPDATE items, ref_items
   SET items.stunresist = 3, items.shielding = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Apatite';
   
UPDATE items, ref_items
   SET items.stunresist = 6, items.shielding = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Apatite';

UPDATE items, ref_items
   SET items.stunresist = 12, items.shielding = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Apatite';
   
UPDATE items, ref_items
   SET items.stunresist = 24, items.shielding = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Apatite';

---- Celestine
UPDATE items, ref_items
   SET items.spellshield = 3, items.dotshielding = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Celestine';
   
UPDATE items, ref_items
   SET items.spellshield = 6, items.dotshielding = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Celestine';

UPDATE items, ref_items
   SET items.spellshield = 12, items.dotshielding = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Celestine';
   
UPDATE items, ref_items
   SET items.spellshield = 24, items.dotshielding = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Celestine';
   
---- Citrine
UPDATE items, ref_items
   SET items.damageshield = 3, items.ac = 15, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Citrine';
   
UPDATE items, ref_items
   SET items.damageshield = 6, items.ac = 30, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Citrine';

UPDATE items, ref_items
   SET items.damageshield = 12, items.ac = 60, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Citrine';
   
UPDATE items, ref_items
   SET items.damageshield = 24, items.ac = 120, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Citrine';
   
---- Howlite
UPDATE items, ref_items
   SET items.strikethrough = 3, items.accuracy = 6, items.attack = 6, items.combateffects = 1, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Howlite';
   
UPDATE items, ref_items
   SET items.strikethrough = 6, items.accuracy = 12, items.attack = 12, items.combateffects = 2, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Howlite';

UPDATE items, ref_items
   SET items.strikethrough = 12, items.accuracy = 24, items.attack = 24, items.combateffects = 4, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Howlite';
   
UPDATE items, ref_items
   SET items.strikethrough = 24, items.accuracy = 42, items.attack = 42, items.combateffects = 8, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Howlite';
   
---- Kyanite
UPDATE items, ref_items
   SET items.avoidance = 6, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Kyanite';
   
UPDATE items, ref_items
   SET items.avoidance = 12, items.hp = 50, items.mana = items.hp,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Kyanite';

UPDATE items, ref_items
   SET items.avoidance = 24, items.hp = 100, items.mana = items.hp,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Kyanite';
   
UPDATE items, ref_items
   SET items.avoidance = 42, items.hp = 200, items.mana = items.hp,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Kyanite';
   
---- Sodalite
UPDATE items, ref_items
   SET items.regen = 3, items.manaregen = 3, items.enduranceregen = 1, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Sodalite';
   
UPDATE items, ref_items
   SET items.regen = 6, items.manaregen = 6, items.enduranceregen = 2, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Sodalite';

UPDATE items, ref_items
   SET items.regen = 12, items.manaregen = 12, items.enduranceregen = 4, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Sodalite';
   
UPDATE items, ref_items
   SET items.regen = 24, items.manaregen = 24, items.enduranceregen = 8, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Sodalite';
   
---- Titanite
UPDATE items, ref_items
   SET items.regen = 3, items.shielding = 3, items.ac = 10, items.combateffects = 1, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Titanite';
   
UPDATE items, ref_items
   SET items.regen = 6, items.shielding = 6, items.ac = 20, items.combateffects = 2, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Titanite';

UPDATE items, ref_items
   SET items.regen = 12, items.shielding = 12, items.ac = 40, items.combateffects = 4, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Titanite';
   
UPDATE items, ref_items
   SET items.regen = 24, items.shielding = 24, items.ac = 80, items.combateffects = 8, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Titanite';
   
---- Sphalerite
UPDATE items, ref_items
   SET items.dsmitigation = 6, items.spellshield = 3, items.ac = 10, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Sphalerite';
   
UPDATE items, ref_items
   SET items.dsmitigation = 12, items.spellshield = 6, items.ac = 20, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Sphalerite';

UPDATE items, ref_items
   SET items.dsmitigation = 24, items.spellshield = 12, items.ac = 40, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Sphalerite';
   
UPDATE items, ref_items
   SET items.dsmitigation = 42, items.spellshield = 24, items.ac = 80, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Sphalerite';
  
---- Tourmaline
UPDATE items, ref_items
   SET items.avoidance = 3, items.accuracy = 6, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Tourmaline';
   
UPDATE items, ref_items
   SET items.avoidance = 6, items.accuracy = 12, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Tourmaline';

UPDATE items, ref_items
   SET items.avoidance = 12, items.accuracy = 24, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Tourmaline';
   
UPDATE items, ref_items
   SET items.avoidance = 24, items.accuracy = 42, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Tourmaline';
   
---- Bloodflow
UPDATE items, ref_items
   SET items.heroic_str = 3, items.accuracy = 6, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Bloodflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_str = 6, items.accuracy = 12, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Bloodflow Stone';

UPDATE items, ref_items
   SET items.heroic_str = 12, items.accuracy = 24, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Bloodflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_str = 24, items.accuracy = 42, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Bloodflow Stone';
   
---- Boneflow
UPDATE items, ref_items
   SET items.heroic_wis = 3, items.clairvoyance = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Boneflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_wis = 6, items.clairvoyance = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Boneflow Stone';

UPDATE items, ref_items
   SET items.heroic_wis = 12, items.clairvoyance = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Boneflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_wis = 24, items.clairvoyance = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Boneflow Stone';
   
---- Mudflow
UPDATE items, ref_items
   SET items.heroic_sta = 3, items.shielding = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Mudflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_sta = 6, items.shielding = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Mudflow Stone';

UPDATE items, ref_items
   SET items.heroic_sta = 12, items.shielding = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Mudflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_sta = 24, items.shielding = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Mudflow Stone';
   
---- Starflow
UPDATE items, ref_items
   SET items.heroic_int = 3, items.clairvoyance = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Starflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_int = 6, items.clairvoyance = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Starflow Stone';

UPDATE items, ref_items
   SET items.heroic_int = 12, items.clairvoyance = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Starflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_int = 24, items.clairvoyance = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Starflow Stone';
   
---- Waterflow
UPDATE items, ref_items
   SET items.heroic_dex = 3, items.combateffects = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Waterflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_dex = 6, items.combateffects = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Waterflow Stone';

UPDATE items, ref_items
   SET items.heroic_dex = 12, items.combateffects = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Waterflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_dex = 24, items.combateffects = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Waterflow Stone';
   
---- Fireflow
UPDATE items, ref_items
   SET items.heroic_agi = 1, items.avoidance = 3, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Fireflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_agi = 2, items.avoidance = 6, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Fireflow Stone';

UPDATE items, ref_items
   SET items.heroic_agi = 4, items.avoidance = 12, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Fireflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_agi = 8, items.avoidance = 24, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Fireflow Stone';
   
---- Skyflow
UPDATE items, ref_items
   SET items.heroic_cha = 3, items.heroic_str = 1, items.heroic_int = 1, items.heroic_wis = 1, items.hp = 25, items.mana = 25,
	   items.reclevel = 0, items.reqlevel = 0
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Skyflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_cha = 6, items.heroic_str = 2, items.heroic_int = 2, items.heroic_wis = 2, items.hp = 50, items.mana = 50,
       items.reclevel = 60, items.reqlevel = 53
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Polished Skyflow Stone';

UPDATE items, ref_items
   SET items.heroic_cha = 12, items.heroic_str = 4, items.heroic_int = 4, items.heroic_wis = 4, items.hp = 100, items.mana = 100,
       items.reclevel = 65, items.reqlevel = 61
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Brilliant Cut Skyflow Stone';
   
UPDATE items, ref_items
   SET items.heroic_cha = 24, items.heroic_str = 8, items.heroic_int = 8, items.heroic_wis = 8, items.hp = 200, items.mana = 200,
       items.reclevel = 70, items.reqlevel = 66
 WHERE items.id = ref_items.id AND items.itemtype = 54
   AND items.name LIKE 'Radiant Cut Skyflow Stone';