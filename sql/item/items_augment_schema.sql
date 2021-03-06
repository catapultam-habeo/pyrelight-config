-- Set Augment Type Name Strings
UPDATE db_str SET value = "1 (General)" 			      WHERE id = 1  AND type = 16;
UPDATE db_str SET value = "2 (Activated Effect)" 	   WHERE id = 2  AND type = 16;
UPDATE db_str SET value = "3 (Worn Effect)" 		      WHERE id = 3  AND type = 16;
UPDATE db_str SET value = "4 (Combat Effect)"		   WHERE id = 4  AND type = 16;
UPDATE db_str SET value = "20 (Weapon Ornamentation)" WHERE id = 20 AND type = 16;
UPDATE db_str SET value = "21 (Armor Ornamentation)"  WHERE id = 21 AND type = 16;

-- Remove Models from non-ornaments
UPDATE items SET idfile = "IT63" WHERE itemtype = 54;

-- Configure Item Slots
---- Remove All Aug Slots
UPDATE items
   SET augslot1type = 0, 
	   augslot2type = 0, 
	   augslot3type = 0, 
	   augslot4type = 0, 
	   augslot5type = 0,
	   augslot6type = 0, 	   
	   augslot1visible = 0,
	   augslot2visible = 0,
	   augslot3visible = 0,
	   augslot4visible = 0,
	   augslot5visible = 0,
	   augslot6visible = 0;

---- Type 21 on Vis Slots
UPDATE items
   SET augslot6type = 21,
       augslot6visible = 1
 WHERE itemtype != 54
   AND slots & 923268 > 0
   AND races > 0;
   
---- Type 20 on Primary\Secondary\Ranged slots
UPDATE items
   SET augslot6type = 20,
       augslot6visible = 1
 WHERE itemtype != 54
   AND slots & 26624 > 0
   AND races > 0;   

---- All Items
UPDATE items
   SET augslot1type = 1, -- Type 1
	   augslot2type = 2, -- Type 2
	   augslot3type = 3, -- Type 3
	   augslot1visible = 1,
	   augslot2visible = 1,
	   augslot3visible = 1
 WHERE itemtype != 54
   AND slots > 0
   AND races > 0;
   
-- Pri\Sec\Ranged Weapons
UPDATE items
   SET augslot4type = 4,
       augslot5type = 4,
	   augslot4visible = 1,
	   augslot5visible = 1
 WHERE itemtype != 54
   AND slots & (8192|16384|2048) 
   AND races > 0
   AND ( itemtype <= 5 OR itemtype = 35 OR itemtype = 45 ); 

   
-- Remove Type 2 from items with Click effects
UPDATE items
   SET augslot2type = 0,
       augslot2visible = 0
 WHERE itemtype != 54
   AND clickeffect > 0;
   
-- Remove First Type 3 from items with Focus or Worn effects
UPDATE items
   SET augslot3type = 0,
       augslot3visible = 0
 WHERE itemtype != 54
   AND ( focuseffect > 0
    OR   worneffect  > 0 );

-- Remove first type 4 from items with proc effects
UPDATE items
   SET augslot4type = 0,
       augslot4visible = 0
 WHERE itemtype != 54
   AND proceffect > 0;
   
-- Pri\Sec Caster-Only Items
UPDATE items
   SET augslot4type = 3,
       augslot5type = 3,
	   augslot4visible = 1,
	   augslot5visible = 1
 WHERE itemtype != 54
   AND slots & 24576 > 0 
   AND races > 0
   AND ( classes & (2|32|512|1024|2048|4096|8192) AND NOT classes & (1|4|8|16|64|128|256|16384|32768) );
   
-- All Augments Become Type 1
UPDATE items
   SET augtype = 15 -- Fit in Slot 1-4
 WHERE itemtype = 54;
 
-- Augments with Procs Become Type 4
UPDATE items
   SET augtype = 8
 WHERE itemtype = 54
   AND proceffect > 0;

-- Augments with a Focus or a Worn Effect becomes a Type 3
UPDATE items
   SET augtype = 4
 WHERE itemtype = 54
   AND ( worneffect > 0 OR focuseffect > 0 );
   
-- Augments with activated effects become type 2
UPDATE items
   SET augtype = 2
 WHERE itemtype = 54
   AND clickeffect > 0;
   
-- Dump all stats from Augs other than Type 1
UPDATE items
   SET ac = 0, hp = 0, mana = 0, endur = 0, spelldmg = 0, healamt = 0,
       astr = 0, adex = 0, aagi = 0, asta = 0, aint = 0, awis = 0, acha = 0,
	   regen = 0, manaregen = 0, enduranceregen = 0,
	   fr = 0, cr = 0, mr = 0, dr = 0, pr = 0,
	   heroic_str = 0, heroic_sta = 0, heroic_dex = 0, heroic_agi = 0, heroic_int = 0, heroic_wis = 0, heroic_cha = 0,
	   heroic_fr = 0, heroic_cr = 0, heroic_mr = 0, heroic_dr = 0, heroic_pr = 0,
	   shielding = 0, spellshield = 0, dotshielding = 0, stunresist = 0, strikethrough = 0, attack = 0, accuracy = 0, avoidance = 0,
	   damageshield = 0, dsmitigation = 0, haste = 0, clairvoyance = 0, damage = 0
 WHERE itemtype = 54
   AND augtype & 1 = 0;