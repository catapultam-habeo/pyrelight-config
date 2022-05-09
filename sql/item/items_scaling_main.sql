-- Try to Fix Weird Items
---- Caster items UNUSABLE by pure melee need to have some int and wis
UPDATE items, ref_items
SET    items.awis = Greatest(ref_items.awis, Ceil(Greatest(ref_items.astr, ref_items.asta, ref_items.adex, ref_items.aagi, ref_items.awis, ref_items.acha) * 0.75)),
	   items.aint = Greatest(ref_items.aint, Ceil(Greatest(ref_items.astr, ref_items.asta, ref_items.adex, ref_items.aagi, ref_items.awis, ref_items.acha) * 0.75))       
WHERE  ref_items.classes & (2|32|512|4096|2048|8192|1024) != 0 AND ref_items.classes & (1|64|128|256|32768) = 0 
  AND  ref_items.id = items.id AND  items.itemtype != 54; 

---- INT-caster and WIS-caster only items get INT\WIS respectively equal to greatest other primary stat. 
UPDATE items, ref_items
SET    items.aint = Greatest(ref_items.astr, ref_items.asta, ref_items.adex, ref_items.aagi, ref_items.aint, ref_items.awis, ref_items.acha)
WHERE  ref_items.classes & ( 4096|2048|8192|1024 ) != 0 AND ref_items.classes & ( 1|2|4|8|16|32|64|128|256|512|16384|32768 ) = 0
  AND  ref_items.id=items.id AND  items.itemtype != 54;

UPDATE items, ref_items
SET    items.awis = Greatest(ref_items.astr, ref_items.asta, ref_items.adex, ref_items.aagi, ref_items.aint, ref_items.awis, ref_items.acha)
WHERE  ref_items.classes & ( 2|32|512 ) != 0 AND ref_items.classes & ( 1|4|8|16|64|128|256|1024|2048|4096|8192|16384|32768 ) = 0
  AND  ref_items.id=items.id AND  items.itemtype != 54;

-- Adjust primary stats. Absolute Values
UPDATE items, ref_items
SET	   items.astr = Abs(Floor(ref_items.astr * 2.75)),
	   items.asta = Abs(Floor(Greatest(ref_items.asta,(ref_items.regen * 5)) * 2.75)),
	   items.adex = Abs(Floor(ref_items.adex * 2.75)),
	   items.aagi = Abs(Floor(ref_items.aagi * 2.75)),
	   items.aint = Abs(Floor(Greatest(ref_items.aint,(ref_items.manaregen * 3)) * 2.75)),
	   items.awis = Abs(Floor(Greatest(ref_items.awis,(ref_items.manaregen * 3)) * 2.75)),
	   items.acha = Abs(Floor(ref_items.acha * 2.75))
WHERE  ref_items.id=items.id AND  items.itemtype != 54;
  
-- Spell Damage & Heal Amount
---- Set Basic Amount = Average of non-zero primary stats
UPDATE items, ref_items
SET items.spelldmg = Floor((items.astr + items.asta + items.adex + items.aagi + items.aint + items.awis + items.acha) / ((items.astr > 0) 
																													   + (items.asta > 0)
																													   + (items.adex > 0)
																													   + (items.aagi > 0)
																													   + (items.aint > 0)
																													   + (items.awis > 0)
																													   + (items.acha > 0))),
	items.healamt  = Floor((items.astr + items.asta + items.adex + items.aagi + items.aint + items.awis + items.acha) / ((items.astr > 0) 
																													   + (items.asta > 0)
																													   + (items.adex > 0)
																													   + (items.aagi > 0)
																													   + (items.aint > 0)
																													   + (items.awis > 0)
																													   + (items.acha > 0)))
WHERE ref_items.id = items.id AND items.itemtype != 54
  AND ((items.astr > 0) + (items.asta > 0) + (items.adex > 0) + (items.aagi > 0) + (items.aint > 0) + (items.awis > 0) + (items.acha > 0)) > 0;
  
-- Double Existing Resists
UPDATE items, ref_items
SET    items.mr = Abs(Floor(ref_items.mr * 2)),
	   items.fr = Abs(Floor(ref_items.fr * 2)),
	   items.cr = Abs(Floor(ref_items.cr * 2)),
	   items.dr = Abs(Floor(ref_items.dr * 2)),
	   items.pr = Abs(Floor(ref_items.pr * 2))
WHERE  ref_items.id = items.id AND  items.itemtype != 54;
  
-- Add More Resists
UPDATE items, ref_items
   SET items.mr = Floor(items.spelldmg / 2),
       items.fr = Floor(items.spelldmg / 2),
	   items.cr = Floor(items.spelldmg / 2),
	   items.dr = Floor(items.spelldmg / 2),
	   items.pr = Floor(items.spelldmg / 2)
WHERE  ref_items.id = items.id AND  items.itemtype != 54
  AND  items.spelldmg > 0;

-- Round resists down by 5's
UPDATE items, ref_items
   SET items.mr = Floor((items.mr + 4) / 5) * 5,
       items.fr = Floor((items.fr + 4) / 5) * 5,
	   items.cr = Floor((items.cr + 4) / 5) * 5,
	   items.dr = Floor((items.dr + 4) / 5) * 5,
	   items.pr = Floor((items.pr + 4) / 5) * 5
WHERE  ref_items.id = items.id AND  items.itemtype != 54;	

-- Heroic stats, increase them if it already has them.
UPDATE items, ref_items
SET    items.heroic_str = (ref_items.heroic_str * 2),
       items.heroic_sta = (ref_items.heroic_sta * 2),
	   items.heroic_dex = (ref_items.heroic_dex * 2),
	   items.heroic_agi = (ref_items.heroic_agi * 2),
	   items.heroic_int = (ref_items.heroic_int * 2),
	   items.heroic_wis = (ref_items.heroic_wis * 2),
	   items.heroic_cha = (ref_items.heroic_cha * 2),
	   items.heroic_mr = (ref_items.heroic_mr * 3),
	   items.heroic_fr = (ref_items.heroic_fr * 3),
	   items.heroic_cr = (ref_items.heroic_cr * 3),
	   items.heroic_pr = (ref_items.heroic_pr * 3),
	   items.heroic_dr = (ref_items.heroic_dr * 3)
WHERE  ref_items.id = items.id
  AND  items.itemtype != 54;
  
-- Adjust AC
UPDATE items, ref_items 
SET    items.ac = ref_items.ac * 3
WHERE  ref_items.ac > 0 
  AND  ref_items.id = items.id AND items.itemtype != 54
  AND  items.classes > 0 AND items.slots > 0 AND items.reclevel <= 70 AND items.reqlevel <= 70;
  
-- Multiply Regen
UPDATE items, ref_items
   SET items.regen = ref_items.regen * 10,
       items.manaregen = ref_items.manaregen * 5
 WHERE ref_items.ac > 0 
  AND  ref_items.id = items.id AND items.itemtype != 54
  AND  items.classes > 0 AND items.slots > 0 AND items.reclevel <= 70 AND items.reqlevel <= 70;
  
-- Adjust Weapon Damage
--- All Weapons
UPDATE items,ref_items 
SET    items.elemdmgamt = Floor(ref_items.elemdmgamt * 5),
	   items.backstabdmg = Floor(ref_items.backstabdmg * 5),
	   items.banedmgamt = Floor(ref_items.banedmgamt * 5)
WHERE  ref_items.delay > 0 AND  ref_items.id = items.id 
  AND  items.classes > 0 AND items.slots > 0 AND items.itemtype != 54;
  
--- 2H Weapons, Arrows, Bows
UPDATE items,ref_items 
SET    items.damage = Floor(ref_items.damage * 2),
       items.delay  = Ceil(ref_items.delay * 0.8)
WHERE  ref_items.delay > 0 AND  ref_items.id = items.id
  AND (ref_items.itemtype = 1 OR ref_items.itemtype = 4 OR ref_items.itemtype = 35 OR ref_items.itemtype = 27 OR ref_items.itemtype = 5)
  AND  items.classes > 0 AND items.slots > 0 AND items.itemtype != 54;
  
--- 1H Weapons Only
UPDATE items,ref_items 
  SET  items.damage = Floor(ref_items.damage * 2.25)
WHERE  ref_items.delay > 0 AND (ref_items.itemtype = 0 OR ref_items.itemtype = 2 OR ref_items.itemtype = 3 OR ref_items.itemtype = 45)
  AND  ref_items.id = items.id
  AND  items.classes > 0 AND items.slots > 0 AND items.itemtype != 54;
  
-- Set floor HP\Mana on all equippable items
UPDATE items, ref_items
SET    items.hp = ref_items.hp + Greatest(50,items.reclevel,items.reqlevel),
	   items.mana = ref_items.mana + Greatest(50,items.reclevel,items.reqlevel)
WHERE  ref_items.id = items.id   
   AND items.itemtype = 10
   AND  items.classes > 0 AND items.slots > 0 AND items.itemtype != 54;

-- Set Additional HP\Mana on all equippable items
UPDATE items, ref_items
SET    items.hp = items.hp + Floor((items.astr + items.asta + items.adex + items.aagi + items.aint + items.awis + items.acha) / ((items.astr > 0) 
																													           + (items.asta > 0)
																															   + (items.adex > 0)
																															   + (items.aagi > 0)
																															   + (items.aint > 0)
																															   + (items.awis > 0)
																															   + (items.acha > 0))),
	   items.mana = items.mana + Floor((items.astr + items.asta + items.adex + items.aagi + items.aint + items.awis + items.acha) / ((items.astr > 0) 
																																   + (items.asta > 0)
																																   + (items.adex > 0)
																																   + (items.aagi > 0)
																																   + (items.aint > 0)
																																   + (items.awis > 0)
																																   + (items.acha > 0)))
WHERE  ref_items.id = items.id   
   AND items.itemtype = 10
   AND items.classes > 0 AND items.slots > 0 AND items.itemtype != 54
   AND ((items.astr > 0) + (items.asta > 0) + (items.adex > 0) + (items.aagi > 0) + (items.aint > 0) + (items.awis > 0) + (items.acha > 0)) > 0;
   


-- Cap stats (reclevelcap, as heroics)
--- 70
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 50),
       items.astr = 50
 WHERE items.astr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 50),
       items.asta = 50
 WHERE items.asta > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 50),
       items.adex = 50
 WHERE items.adex > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 50),
       items.aagi = 50
 WHERE items.aagi > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 50),
       items.aint = 50
 WHERE items.aint > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 50),
       items.awis = 50
 WHERE items.awis > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 50),
       items.acha = 50
 WHERE items.acha > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 50),
       items.mr = 50
 WHERE items.mr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 50),
       items.fr = 50
 WHERE items.fr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 50),
       items.cr = 50
 WHERE items.cr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 50),
       items.dr = 50
 WHERE items.dr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 50),
       items.pr = 50
 WHERE items.pr > 50
   AND Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(50,items.heroic_str),
	   items.heroic_sta = Least(50,items.heroic_sta),
	   items.heroic_dex = Least(50,items.heroic_dex),
	   items.heroic_agi = Least(50,items.heroic_agi/2),
	   items.heroic_int = Least(50,items.heroic_int),
	   items.heroic_wis = Least(50,items.heroic_wis),
	   items.heroic_mr  = Least(50,items.heroic_mr),
	   items.heroic_fr  = Least(50,items.heroic_fr),
	   items.heroic_cr  = Least(50,items.heroic_cr),
	   items.heroic_dr  = Least(50,items.heroic_dr),
	   items.heroic_pr  = Least(50,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 70
   AND items.itemtype != 54;   

--- 67
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 35),
       items.astr = 35
 WHERE items.astr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 35),
       items.asta = 35
 WHERE items.asta > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 35),
       items.adex = 35
 WHERE items.adex > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 35),
       items.aagi = 35
 WHERE items.aagi > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 35),
       items.aint = 35
 WHERE items.aint > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 35),
       items.awis = 35
 WHERE items.awis > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 35),
       items.acha = 35
 WHERE items.acha > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 35),
       items.mr = 35
 WHERE items.mr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 35),
       items.fr = 35
 WHERE items.fr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 35),
       items.cr = 35
 WHERE items.cr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 35),
       items.dr = 35
 WHERE items.dr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 35),
       items.pr = 35
 WHERE items.pr > 35
   AND Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(35,items.heroic_str),
	   items.heroic_sta = Least(35,items.heroic_sta),
	   items.heroic_dex = Least(35,items.heroic_dex),
	   items.heroic_agi = Least(35,items.heroic_agi/2),
	   items.heroic_int = Least(35,items.heroic_int),
	   items.heroic_wis = Least(35,items.heroic_wis),
	   items.heroic_mr  = Least(35,items.heroic_mr),
	   items.heroic_fr  = Least(35,items.heroic_fr),
	   items.heroic_cr  = Least(35,items.heroic_cr),
	   items.heroic_dr  = Least(35,items.heroic_dr),
	   items.heroic_pr  = Least(35,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 67
   AND items.itemtype != 54;    

--- 65
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 30),
       items.astr = 30
 WHERE items.astr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 30),
       items.asta = 30
 WHERE items.asta > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 30),
       items.adex = 30
 WHERE items.adex > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 30),
       items.aagi = 30
 WHERE items.aagi > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 30),
       items.aint = 30
 WHERE items.aint > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 30),
       items.awis = 30
 WHERE items.awis > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 30),
       items.acha = 30
 WHERE items.acha > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 30),
       items.mr = 30
 WHERE items.mr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 30),
       items.fr = 30
 WHERE items.fr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 30),
       items.cr = 30
 WHERE items.cr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 30),
       items.dr = 30
 WHERE items.dr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 30),
       items.pr = 30
 WHERE items.pr > 30
   AND Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(30,items.heroic_str),
	   items.heroic_sta = Least(30,items.heroic_sta),
	   items.heroic_dex = Least(30,items.heroic_dex),
	   items.heroic_agi = Least(30,items.heroic_agi/2),
	   items.heroic_int = Least(30,items.heroic_int),
	   items.heroic_wis = Least(30,items.heroic_wis),
	   items.heroic_mr  = Least(30,items.heroic_mr),
	   items.heroic_fr  = Least(30,items.heroic_fr),
	   items.heroic_cr  = Least(30,items.heroic_cr),
	   items.heroic_dr  = Least(30,items.heroic_dr),
	   items.heroic_pr  = Least(30,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 65
   AND items.itemtype != 54;     
   
--- 60
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 20),
       items.astr = 20
 WHERE items.astr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 20),
       items.asta = 20
 WHERE items.asta > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 20),
       items.adex = 20
 WHERE items.adex > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 20),
       items.aagi = 20
 WHERE items.aagi > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 20),
       items.aint = 20
 WHERE items.aint > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 20),
       items.awis = 20
 WHERE items.awis > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 20),
       items.acha = 20
 WHERE items.acha > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 20),
       items.mr = 20
 WHERE items.mr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 20),
       items.fr = 20
 WHERE items.fr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 20),
       items.cr = 20
 WHERE items.cr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 20),
       items.dr = 20
 WHERE items.dr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 20),
       items.pr = 20
 WHERE items.pr > 20
   AND Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(20,items.heroic_str),
	   items.heroic_sta = Least(20,items.heroic_sta),
	   items.heroic_dex = Least(20,items.heroic_dex),
	   items.heroic_agi = Least(20,items.heroic_agi/2),
	   items.heroic_int = Least(20,items.heroic_int),
	   items.heroic_wis = Least(20,items.heroic_wis),
	   items.heroic_mr  = Least(20,items.heroic_mr),
	   items.heroic_fr  = Least(20,items.heroic_fr),
	   items.heroic_cr  = Least(20,items.heroic_cr),
	   items.heroic_dr  = Least(20,items.heroic_dr),
	   items.heroic_pr  = Least(20,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 60
   AND items.itemtype != 54;     
   
--- 55
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 10),
       items.astr = 10
 WHERE items.astr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 10),
       items.asta = 10
 WHERE items.asta > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 10),
       items.adex = 10
 WHERE items.adex > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 10),
       items.aagi = 10
 WHERE items.aagi > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 10),
       items.aint = 10
 WHERE items.aint > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 10),
       items.awis = 10
 WHERE items.awis > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 10),
       items.acha = 10
 WHERE items.acha > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 10),
       items.mr = 10
 WHERE items.mr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 10),
       items.fr = 10
 WHERE items.fr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 10),
       items.cr = 10
 WHERE items.cr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 10),
       items.dr = 10
 WHERE items.dr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 10),
       items.pr = 10
 WHERE items.pr > 10
   AND Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(10,items.heroic_str),
	   items.heroic_sta = Least(10,items.heroic_sta),
	   items.heroic_dex = Least(10,items.heroic_dex),
	   items.heroic_agi = Least(10,items.heroic_agi/2),
	   items.heroic_int = Least(10,items.heroic_int),
	   items.heroic_wis = Least(10,items.heroic_wis),
	   items.heroic_mr  = Least(10,items.heroic_mr),
	   items.heroic_fr  = Least(10,items.heroic_fr),
	   items.heroic_cr  = Least(10,items.heroic_cr),
	   items.heroic_dr  = Least(10,items.heroic_dr),
	   items.heroic_pr  = Least(10,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 55
   AND items.itemtype != 54;     

--- 50
UPDATE items
   SET items.heroic_str = items.heroic_str + (items.astr - 5),
       items.astr = 5
 WHERE items.astr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_sta = items.heroic_sta + (items.asta - 5),
       items.asta = 5
 WHERE items.asta > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dex = items.heroic_dex + (items.adex - 5),
       items.adex = 5
 WHERE items.adex > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_agi = items.heroic_agi + (items.aagi - 5),
       items.aagi = 5
 WHERE items.aagi > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_int = items.heroic_int + (items.aint - 5),
       items.aint = 5
 WHERE items.aint > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_wis = items.heroic_wis + (items.awis - 5),
       items.awis = 5
 WHERE items.awis > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND  items.itemtype != 54;
UPDATE items
   SET items.heroic_cha = items.heroic_cha + (items.acha - 5),
       items.acha = 5
 WHERE items.acha > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_mr = items.heroic_mr + (items.mr - 5),
       items.mr = 5
 WHERE items.mr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_fr = items.heroic_fr + (items.fr - 5),
       items.fr = 5
 WHERE items.fr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_cr = items.heroic_cr + (items.cr - 5),
       items.cr = 5
 WHERE items.cr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_dr = items.heroic_dr + (items.dr - 5),
       items.dr = 5
 WHERE items.dr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
UPDATE items
   SET items.heroic_pr = items.heroic_pr + (items.pr - 5),
       items.pr = 5
 WHERE items.pr > 5
   AND Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
---- Heroics
UPDATE items
   SET items.heroic_str = Least(5,items.heroic_str),
	   items.heroic_sta = Least(5,items.heroic_sta),
	   items.heroic_dex = Least(5,items.heroic_dex),
	   items.heroic_agi = Least(5,items.heroic_agi/2),
	   items.heroic_int = Least(5,items.heroic_int),
	   items.heroic_wis = Least(5,items.heroic_wis),
	   items.heroic_mr  = Least(5,items.heroic_mr),
	   items.heroic_fr  = Least(5,items.heroic_fr),
	   items.heroic_cr  = Least(5,items.heroic_cr),
	   items.heroic_dr  = Least(5,items.heroic_dr),
	   items.heroic_pr  = Least(5,items.heroic_pr)
 WHERE Greatest(items.reclevel,items.reqlevel) <= 50
   AND items.itemtype != 54;
   
-- Apply Original Primary stats if they've been lowered at this point
UPDATE items, ref_items
   SET items.astr = ref_items.astr
 WHERE items.id = ref_items.id
   AND ref_items.astr > items.astr;
UPDATE items, ref_items
   SET items.asta = ref_items.asta
 WHERE items.id = ref_items.id
   AND ref_items.asta > items.asta;
UPDATE items, ref_items
   SET items.adex = ref_items.adex
 WHERE items.id = ref_items.id
   AND ref_items.adex > items.adex;
UPDATE items, ref_items
   SET items.aagi = ref_items.aagi
 WHERE items.id = ref_items.id
   AND ref_items.aagi > items.aagi;
UPDATE items, ref_items
   SET items.aint = ref_items.aint
 WHERE items.id = ref_items.id
   AND ref_items.aint > items.aint;
UPDATE items, ref_items
   SET items.awis = ref_items.awis
 WHERE items.id = ref_items.id
   AND ref_items.awis > items.awis;
UPDATE items, ref_items
   SET items.acha = ref_items.acha
 WHERE items.id = ref_items.id
   AND ref_items.acha > items.acha;
UPDATE items, ref_items
   SET items.mr = ref_items.mr
 WHERE items.id = ref_items.id
   AND ref_items.mr > items.mr;
UPDATE items, ref_items
   SET items.fr = ref_items.fr
 WHERE items.id = ref_items.id
   AND ref_items.fr > items.fr;  
UPDATE items, ref_items
   SET items.cr = ref_items.cr
 WHERE items.id = ref_items.id
   AND ref_items.cr > items.cr;
UPDATE items, ref_items
   SET items.dr = ref_items.dr
 WHERE items.id = ref_items.id
   AND ref_items.dr > items.dr; 
UPDATE items, ref_items
   SET items.pr = ref_items.pr
 WHERE items.id = ref_items.id
   AND ref_items.pr > items.pr;      
   
--- Apply Cap
---- Level 70
UPDATE items, ref_items
SET items.spelldmg = Least(50,items.spelldmg),
	items.healamt  = Least(50,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0);
---- Level 67
UPDATE items, ref_items
SET items.spelldmg = Least(35,items.spelldmg),
	items.healamt  = Least(35,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0)
  AND Greatest(items.reclevel,items.reqlevel) <= 67;
---- Level 65
UPDATE items, ref_items
SET items.spelldmg = Least(30,items.spelldmg),
	items.healamt  = Least(30,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0)
  AND Greatest(items.reclevel,items.reqlevel) <= 65;
---- Level 60
UPDATE items, ref_items
SET items.spelldmg = Least(20,items.spelldmg),
	items.healamt  = Least(20,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0)
  AND Greatest(items.reclevel,items.reqlevel) <= 60;
---- Level 55
UPDATE items, ref_items
SET items.spelldmg = Least(10,items.spelldmg),
	items.healamt  = Least(10,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0)
  AND Greatest(items.reclevel,items.reqlevel) <= 55;  
---- Level 50
UPDATE items, ref_items
SET items.spelldmg = Least(5,items.spelldmg),
	items.healamt  = Least(5,items.healamt)
WHERE ref_items.id = items.id AND items.itemtype != 54 AND ref_items.itemtype != 54
  AND (items.spelldmg > 0 OR items.healamt > 0)
  AND Greatest(items.reclevel,items.reqlevel) <= 50;
  
-- Caster 2H get bonus caster stats
UPDATE items,ref_items
SET    items.mana = items.mana * 2,
	   items.hp   = items.hp * 2,
	   items.spelldmg = items.spelldmg * 3,
	   items.healamt = items.healamt * 3,
	   items.aint = items.aint * 3,
	   items.awis = items.awis * 3,
	   items.heroic_int = Floor(items.aint/2) + Floor(items.heroic_int*2),
	   items.heroic_wis = Floor(items.awis/2) + Floor(items.heroic_wis*2)
WHERE  (ref_items.itemtype = 4 OR ref_items.itemtype = 1 OR ref_items.itemtype = 35)
  AND  ref_items.classes & (2|32|512|1024|2048|4096|8192) != 0 AND ref_items.classes & (1|4|8|16|64|128|256|16384|32768) = 0
  AND  ref_items.id = items.id;
  
-- BP get extra spelldmg\healamt
UPDATE items,ref_items
   SET items.spelldmg = Floor(items.spelldmg*2),
       items.healamt  = Floor(items.healamt*2)
 WHERE ref_items.id = items.id
   AND ref_items.slots & (131072) != 0;  

-- Round HP/Mana up by 10's
UPDATE items, ref_items
   SET items.hp = Ceil((items.hp + 9) / 10) * 10,
	   items.mana = Ceil((items.mana + 9) / 10) * 10
 WHERE ref_items.id = items.id   
   AND items.itemtype = 10
   AND items.classes > 0 AND items.slots > 0 AND items.itemtype != 54;

-- Epic 1.0 - Make Moar Better
UPDATE items, ref_items
   SET items.delay = Floor(items.delay * 0.8),
       items.spelldmg = items.spelldmg * 2,
	   items.healamt = items.healamt * 2,
	   items.casttime = Least(items.casttime, Floor(items.casttime * .2))
 WHERE items.id IN (28034, 55273, 10910, 10909, 20490, 10650, 20488, 20487, 20542, 11057, 10652, 10651, 14341, 5532, 14383, 20544, 11050, 10908, 8495, 8496);
 
-- Remove Charges from Clickies, Give previously charged items a minimum of 1s cast time, and give anything that heals or damages a 30s recast timer.
UPDATE items, ref_items
   SET items.maxcharges = -1
 WHERE items.id = ref_items.id
   AND ref_items.maxcharges > 0;
   
UPDATE items, ref_items
   SET items.casttime = Greatest(1000, ref_items.casttime)
 WHERE items.id = ref_items.id
   AND ref_items.maxcharges > 0;
   
UPDATE items, ref_items, ref_spells
   SET items.recastdelay = Greatest(30, ref_items.recastdelay), items.recasttype = Greatest(-1, ref_items.recasttype)
 WHERE items.id = ref_items.id
   AND items.clickeffect = ref_spells.id
   AND ref_items.maxcharges > 0
   AND ( ref_spells.effectid1 = 0 OR ref_spells.effectid1 = 101 OR ref_spells.effectid1 = 147 );
 
 
 