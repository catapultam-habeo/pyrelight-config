-- Boost Drop Rate of CR Gear
UPDATE loottable_entries
   SET probability = 50
 WHERE lootdrop_id = 90261 
    OR lootdrop_id = 90262
	OR lootdrop_id = 90263 
	OR lootdrop_id = 90264 
	OR lootdrop_id = 90265 
	OR lootdrop_id = 90266 
	OR lootdrop_id = 90267;

UPDATE lootdrop_entries
   SET chance = 10
 WHERE lootdrop_id = 90261 
    OR lootdrop_id = 90262
	OR lootdrop_id = 90263 
	OR lootdrop_id = 90264 
	OR lootdrop_id = 90265 
	OR lootdrop_id = 90266 
	OR lootdrop_id = 90267;   