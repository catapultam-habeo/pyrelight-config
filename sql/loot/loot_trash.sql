-- Delete junk global loot
DELETE FROM global_loot WHERE id < 500000;

-- Replace the listed trash drops with another item at the specified percentage rate
CREATE OR REPLACE PROCEDURE Insert_Trash_Replacement(IN replacementID INTEGER, IN chanceRatio FLOAT)
	REPLACE INTO lootdrop_entries (lootdrop_id, item_id, chance)
	SELECT lootdrop_entries.lootdrop_id, 
	       replacementID, 
		   Least(25,SUM(items.price*lootdrop_entries.chance/100) * chanceRatio / Greatest(1000,(SELECT repItem.price FROM items as repItem WHERE repItem.id = replacementID)))
	FROM items, lootdrop_entries
	WHERE     items.id = lootdrop_entries.item_id 
	   -- Droppable
	   AND (( items.nodrop = 1 AND items.attuneable = 0 
	   AND  ( items.id = replacementID
	    OR    items.name LIKE 'Spell:%'
		OR    items.name LIKE 'Tome of%'
		OR    items.name LIKE 'Rune of%'
		OR    items.name LIKE 'Words of%'
		OR    items.name LIKE '%Tasarin%'
		OR    items.name LIKE '%Toharon%'
		OR    items.name LIKE '%Velishoul%'
		OR    items.name LIKE '%Salil%'
		OR 	  items.name LIKE 'Small Mammoth Tusks'
		OR    items.name LIKE 'Raw%Hide'
		OR    items.name LIKE '%Nilitim%'
		OR    items.name LIKE '%Yaeth%'
		OR    items.name LIKE '%Finnok%'
		OR    items.name LIKE '%Zeannor%'
		OR    items.name LIKE '%Keris%'
		OR    items.name LIKE 'Coin of Xev'
		OR    items.name LIKE 'Flame of Fennin'
		OR    items.name LIKE 'Mist of Povar'
		OR    items.name LIKE 'Card of Bristlebane'
		OR    items.name LIKE 'Staff Shard of Luclin'
		OR    items.name LIKE 'Wing of Xegony'
		OR    items.name LIKE 'Essence of Rathe'
		OR    items.name LIKE 'Tears of Prexus'
		OR    items.name LIKE 'The Scent of Marr'
		OR    items.name LIKE 'Flame of Vox'
		OR    items.name LIKE 'Glove of Rallos Zek'
		OR    items.name LIKE 'Flake of Lodestone'
		OR    items.name LIKE 'Sliver of Moonstone'
		OR    items.name LIKE 'Drop of Mercury'
		OR    items.name LIKE 'Sunshard Ore'
		OR    items.name LIKE 'Crystallized Sulfur'
		OR    items.name LIKE '%Painted Rune'
		OR    items.name LIKE '%Etched Rune'
		OR    items.name LIKE '%Embossed Rune'
		OR    items.name LIKE '%Silvered Rune'
		OR    items.name LIKE '%Gilded Rune'
		OR    items.name LIKE '%Gem Dusted Rune'
		OR    items.name LIKE '%Gemmed Rune'
		OR    items.name LIKE 'Sunshard Pebble'
		OR    items.name LIKE '%Loam%'
		OR    items.name LIKE '%Binding Powder'
		OR    items.name LIKE 'Uncut%'
		OR    items.name LIKE '%Marrow%'
		OR    items.name LIKE 'Raw%Nihilite'
		OR    items.name LIKE 'Torn Eye Stitches'
		OR    items.name LIKE 'Ornate Aneuk Mace'
		OR    items.name LIKE 'Aneuk Healer\'s Robes'
		OR    items.name LIKE 'Ornamental Shoulder Dressing'
		OR    items.name LIKE 'Aneuk Healer\'s Crystals'
		OR    items.name LIKE 'Aneuk Spirit Beads'
		OR    items.name LIKE 'Aneuk Spirit Powder'
		OR    items.name LIKE 'Sunshard Dust'
		OR    items.name LIKE 'Death Cap'
		OR    items.name LIKE 'Black Henbane'
		OR    items.name LIKE 'Jade Earring'
		OR    items.name LIKE 'Gold Ring'
		OR    items.name LIKE 'Mithril Earring'
		OR    items.name LIKE 'Silver Amulet'
		OR    items.name LIKE 'Golden Pendant'
		OR    items.name LIKE 'Ruby Crown'
		OR    items.name LIKE 'Charcoal'
		OR    items.name LIKE 'Iron Oxide'
		OR    items.name LIKE 'Russet Oxide'
		OR    items.name LIKE 'Throwing Boulder'
		OR    items.name LIKE '%Spinneret Fluid'
		OR    items.name LIKE '%Bat Fur'
		OR    items.name LIKE '%Spider Venom Sac'
		OR    items.name LIKE 'Essence of Fire'
		OR    items.name LIKE '%Spider Legs'
		OR    items.name LIKE 'Shiny Bat Teeth'
		OR    items.name LIKE 'Large Stained Bear Tooth'
		OR    items.name LIKE 'Rabbit Skull'
		OR    items.name LIKE 'Rabbit Head'
		OR    items.name LIKE 'Asmag Weed'
		OR    items.name LIKE 'Soot Hemlock'
		OR    items.name LIKE 'Small Box'
		OR    items.name LIKE 'Backpack'
		OR    items.name LIKE 'Large Bag'
		OR    items.name LIKE 'Small Bag'
		OR    items.name LIKE 'Belt Pouch'
		OR    items.name LIKE 'Ale'
		OR    items.name LIKE 'Short Beer'
		OR    items.name LIKE 'Bottle of Kalish'
		OR    items.name LIKE 'Bandages'
		OR    items.name LIKE 'Mead'
		OR    items.name LIKE '%Ration'
		OR    items.name LIKE 'Water Flask'
		OR    items.name LIKE 'Pearl Shard'
		OR    items.name LIKE 'Jade Shard'
		OR    items.name LIKE 'Ice of Velious'
		OR    items.name LIKE 'Eye of Serilis'
		OR    items.name LIKE '%Power Source'
		OR    items.name LIKE '%Force Module'
		OR    items.name LIKE '%Frost Module'
		OR    items.name LIKE 'Fairy Dust'
		OR    items.name LIKE 'Melatite'		
		OR    items.name LIKE 'Fresh Fish'
		OR    items.name LIKE 'Snake Scales'
		OR    items.name LIKE 'Rat Ears'
		OR    items.name LIKE '%Bone Chips'
		OR    items.name LIKE 'Silvril Ore'
		OR    items.name LIKE 'Tuft of Rabbit Fur'
		OR    items.name LIKE 'Opalline Earring'
		OR    items.name LIKE 'Urticaceae'
		OR    items.name LIKE 'Aderirse Bur'
		OR    items.name LIKE 'Amanita Phalloide'
		OR    items.name LIKE '%Ringmail%'
		OR    items.name LIKE 'Sapphire Necklace'
		OR    items.name LIKE 'Fire Emerald Ring'
		OR    items.name LIKE 'Grave Mold'
		OR    items.name LIKE 'Mithril Amulet'
		OR    items.name LIKE 'Opal Bracelet'
		OR    items.name LIKE 'Skeleton Parts'
		OR    items.name LIKE 'Staurolite'
		OR    items.name LIKE '%Raw-hide%'
		OR    items.name LIKE '%Fine Steel%'
		OR    items.name LIKE 'Steel Knuckles'
		OR    items.name LIKE 'Weighted Gloves'
		OR    items.name LIKE 'Ornate Amulet'
		OR    items.name LIKE 'Familiar Ring'
		OR    items.name LIKE '%Bat Wing'
		OR    items.name LIKE 'Nihil Hair Strand'
		OR    items.name LIKE 'Blood of Nihil'
		OR    items.name LIKE 'Nihil Toes'
		OR    items.name LIKE 'Stone Chisel'
		OR    items.name LIKE 'Ukun Summoning Idol'
		OR    items.name LIKE 'Mastruq\'s Spiked Armguards'
		OR    items.name LIKE 'Chunk of Taelosian Rock'
		OR    items.name LIKE 'Muramite Etched Scales'
		OR    items.name LIKE 'Raw Dark Matter'
		OR    items.name LIKE 'Mastruq\'s Broken Ribcage'
		OR    items.name LIKE 'Mastruq\'s Clawed Finger'
		OR    items.name LIKE 'Mastruq\'s Broken Facemask'
		OR    items.name LIKE 'Broken Mastruq\'s Blade'
		OR    items.name LIKE 'Mastruq Focusing Staff'
		OR    items.name LIKE 'Blackened Bowstring Warbow'
		OR    items.name LIKE 'Bloody Bowstring Warbow'
		OR    items.name LIKE 'Finely Crafted Warbow'
		OR    items.name LIKE 'Poisoned Arrowhead'
		OR    items.name LIKE 'Barbed Arrow Tip'
		OR    items.name LIKE 'Empty Hunter\'s Quiver'
		OR    items.name LIKE 'Aligned Ore'
		OR    items.name LIKE '%Pale Nihilite'
		OR    items.name LIKE 'Sample of Taelosian Sludge'
		OR    items.name LIKE 'Dented Shoulderguards'
		OR    items.name LIKE 'Misshapen Chestplate'
		OR    items.name LIKE 'Cracked Noc Hoof'
		OR    items.name LIKE 'Severed Noc Tail'
		OR    items.name LIKE 'Broken Noc Fang'
		OR    items.name LIKE 'High Quality Ra\'Tuk Brute Hide'
		OR    items.name LIKE 'Ra\'Tuk Warrior\'s Blade'
		OR    items.name LIKE 'Ra\'Tuk Warrior\'s Scalp'
		OR    items.name LIKE 'Quality Ra\'Tuk Brute Hide'
		OR    items.name LIKE 'Mangled Ra\'Tuk Brute Hide'))
		-- No-Drop (Be more specific here)
		OR (  items.name LIKE 'Consigned%'
		OR    items.name LIKE 'Bat Blood'
		OR    items.name LIKE 'Ak\'Anon Skylighters'
		OR    items.name LIKE 'Stone Silk'
		OR    items.name LIKE 'Giant Wood Spider Thorax'
		OR    items.name LIKE 'Puma Fang'
		OR    items.name LIKE 'Crescent Bat Hide'
		OR    items.name LIKE 'Pristine Bear Hide'
		OR    items.name LIKE 'Sporeling Cap'
		OR    items.name LIKE 'Foul Ichor Residue'
		OR    items.name LIKE 'Snake Sac'
		OR    items.name LIKE 'Fine Bone Powder'
		OR    items.name LIKE 'Mistmoore Granite'
		OR    items.name LIKE 'Soil of Underfoot'
		OR    items.name LIKE 'Grave Dust'
		OR    items.name LIKE 'Darkbone Skull'
		OR    items.name LIKE 'Collector\'s%'
		OR    items.name LIKE 'Big \'Sploder Fireworks'
		))
	GROUP BY lootdrop_entries.lootdrop_id;

-- Do Inserts
CALL Insert_Trash_Replacement(10037, 10); -- Diamond
CALL Insert_Trash_Replacement(10036, 10); -- Black Sapphire
CALL Insert_Trash_Replacement(10053, 10); -- Jacinth
CALL Insert_Trash_Replacement(10035, 10); -- Ruby
CALL Insert_Trash_Replacement(10034, 10); -- Sapphire
CALL Insert_Trash_Replacement(10033, 10); -- Fire Emerald
CALL Insert_Trash_Replacement(10032, 10); -- Star Ruby
CALL Insert_Trash_Replacement(10031, 10); -- Fire Opal
CALL Insert_Trash_Replacement(10012, 10); -- Black Pearl
CALL Insert_Trash_Replacement(10028, 10); -- Peridot

-- Clean Up Junk
    DELETE lootdrop_entries 
      FROM items 
INNER JOIN lootdrop_entries 
     WHERE    items.id = lootdrop_entries.item_id
	   -- Droppable
	   AND (( items.nodrop = 1 AND items.attuneable = 0 
	   AND  ( items.id = 0
	    OR    items.name LIKE 'Spell:%'
		OR    items.name LIKE 'Tome of%'
		OR    items.name LIKE 'Rune of%'
		OR    items.name LIKE 'Words of%'
		OR    items.name LIKE '%Tasarin%'
		OR    items.name LIKE '%Toharon%'
		OR    items.name LIKE '%Velishoul%'
		OR    items.name LIKE '%Salil%'
		OR    items.name LIKE '%Nilitim%'
		OR    items.name LIKE '%Yaeth%'
		OR    items.name LIKE '%Finnok%'
		OR    items.name LIKE '%Zeannor%'
		OR    items.name LIKE '%Keris%'
		OR    items.name LIKE 'Coin of Xev'
		OR    items.name LIKE 'Flame of Fennin'
		OR    items.name LIKE 'Mist of Povar'
		OR    items.name LIKE 'Card of Bristlebane'
		OR    items.name LIKE 'Staff Shard of Luclin'
		OR    items.name LIKE 'Wing of Xegony'
		OR    items.name LIKE 'Essence of Rathe'
		OR    items.name LIKE 'Tears of Prexus'
		OR    items.name LIKE 'The Scent of Marr'
		OR    items.name LIKE 'Flame of Vox'
		OR    items.name LIKE 'Glove of Rallos Zek'
		OR    items.name LIKE 'Flake of Lodestone'
		OR    items.name LIKE 'Sliver of Moonstone'
		OR    items.name LIKE 'Drop of Mercury'
		OR    items.name LIKE 'Sunshard Ore'
		OR    items.name LIKE 'Crystallized Sulfur'
		OR    items.name LIKE '%Painted Rune'
		OR    items.name LIKE '%Etched Rune'
		OR    items.name LIKE '%Embossed Rune'
		OR    items.name LIKE '%Silvered Rune'
		OR    items.name LIKE '%Gilded Rune'
		OR    items.name LIKE '%Gem Dusted Rune'
		OR    items.name LIKE '%Gemmed Rune'
		OR    items.name LIKE 'Sunshard Pebble'
		OR    items.name LIKE '%Loam%'
		OR    items.name LIKE '%Binding Powder'
		OR    items.name LIKE 'Uncut%'
		OR    items.name LIKE '%Marrow%'
		OR    items.name LIKE 'Raw%Nihilite'
		OR    items.name LIKE 'Torn Eye Stitches'
		OR    items.name LIKE 'Ornate Aneuk Mace'
		OR    items.name LIKE 'Aneuk Healer\'s Robes'
		OR    items.name LIKE 'Ornamental Shoulder Dressing'
		OR    items.name LIKE 'Aneuk Healer\'s Crystals'
		OR    items.name LIKE 'Aneuk Spirit Beads'
		OR    items.name LIKE 'Aneuk Spirit Powder'
		OR    items.name LIKE 'Sunshard Dust'
		OR    items.name LIKE 'Death Cap'
		OR    items.name LIKE 'Black Henbane'
		OR    items.name LIKE 'Jade Earring'
		OR    items.name LIKE 'Gold Ring'
		OR    items.name LIKE 'Mithril Earring'
		OR    items.name LIKE 'Silver Amulet'
		OR    items.name LIKE 'Golden Pendant'
		OR    items.name LIKE 'Ruby Crown'
		OR    items.name LIKE 'Charcoal'
		OR    items.name LIKE 'Iron Oxide'
		OR    items.name LIKE 'Russet Oxide'
		OR    items.name LIKE 'Throwing Boulder'
		OR    items.name LIKE '%Spinneret Fluid'
		OR    items.name LIKE '%Bat Fur'
		OR    items.name LIKE '%Spider Venom Sac'
		OR    items.name LIKE 'Essence of Fire'
		OR    items.name LIKE '%Spider Legs'
		OR    items.name LIKE 'Shiny Bat Teeth'
		OR    items.name LIKE 'Large Stained Bear Tooth'
		OR    items.name LIKE 'Rabbit Skull'
		OR    items.name LIKE 'Rabbit Head'
		OR    items.name LIKE 'Asmag Weed'
		OR    items.name LIKE 'Soot Hemlock'
		OR    items.name LIKE 'Small Box'
		OR    items.name LIKE 'Backpack'
		OR    items.name LIKE 'Large Bag'
		OR    items.name LIKE 'Small Bag'
		OR    items.name LIKE 'Belt Pouch'
		OR    items.name LIKE 'Ale'
		OR    items.name LIKE 'Short Beer'
		OR    items.name LIKE 'Bottle of Kalish'
		OR    items.name LIKE 'Bandages'
		OR    items.name LIKE 'Mead'
		OR    items.name LIKE '%Ration'
		OR    items.name LIKE 'Water Flask'
		OR    items.name LIKE 'Pearl Shard'
		OR    items.name LIKE 'Jade Shard'
		OR    items.name LIKE 'Ice of Velious'
		OR    items.name LIKE 'Eye of Serilis'
		OR    items.name LIKE '%Power Source'
		OR    items.name LIKE '%Force Module'
		OR    items.name LIKE '%Frost Module'
		OR    items.name LIKE 'Fairy Dust'	
		OR    items.name LIKE 'Fresh Fish'
		OR    items.name LIKE 'Snake Scales'
		OR    items.name LIKE 'Rat Ears'
		OR    items.name LIKE '%Bone Chips'
		OR    items.name LIKE 'Silvril Ore'
		OR    items.name LIKE 'Tuft of Rabbit Fur'
		OR    items.name LIKE 'Opalline Earring'
		OR    items.name LIKE 'Urticaceae'
		OR    items.name LIKE 'Aderirse Bur'
		OR    items.name LIKE 'Amanita Phalloide'
		OR    items.name LIKE '%Ringmail%'
		OR    items.name LIKE 'Sapphire Necklace'
		OR    items.name LIKE 'Fire Emerald Ring'
		OR    items.name LIKE 'Grave Mold'
		OR    items.name LIKE 'Mithril Amulet'
		OR    items.name LIKE 'Opal Bracelet'
		OR    items.name LIKE 'Skeleton Parts'
		OR    items.name LIKE 'Staurolite'
		OR    items.name LIKE '%Raw-hide%'
		OR    items.name LIKE '%Fine Steel%'
		OR    items.name LIKE 'Steel Knuckles'
		OR    items.name LIKE 'Weighted Gloves'
		OR    items.name LIKE 'Ornate Amulet'
		OR    items.name LIKE 'Familiar Ring'
		OR    items.name LIKE '%Bat Wing'		
		OR    items.name LIKE 'Nihil Hair Strand'
		OR    items.name LIKE 'Blood of Nihil'
		OR    items.name LIKE 'Nihil Toes'
		OR    items.name LIKE 'Stone Chisel'
		OR    items.name LIKE 'Ukun Summoning Idol'
		OR    items.name LIKE 'Mastruq\'s Spiked Armguards'
		OR    items.name LIKE 'Chunk of Taelosian Rock'
		OR    items.name LIKE 'Muramite Etched Scales'
		OR    items.name LIKE 'Raw Dark Matter'
		OR    items.name LIKE 'Mastruq\'s Broken Ribcage'
		OR    items.name LIKE 'Mastruq\'s Clawed Finger'
		OR    items.name LIKE 'Mastruq\'s Broken Facemask'
		OR    items.name LIKE 'Broken Mastruq\'s Blade'
		OR    items.name LIKE 'Mastruq Focusing Staff'
		OR    items.name LIKE 'Blackened Bowstring Warbow'
		OR    items.name LIKE 'Bloody Bowstring Warbow'
		OR    items.name LIKE 'Finely Crafted Warbow'
		OR    items.name LIKE 'Poisoned Arrowhead'
		OR    items.name LIKE 'Barbed Arrow Tip'
		OR    items.name LIKE 'Empty Hunter\'s Quiver'
		OR    items.name LIKE 'Aligned Ore'
		OR    items.name LIKE '%Pale Nihilite'
		OR    items.name LIKE 'Sample of Taelosian Sludge'
		OR    items.name LIKE 'Dented Shoulderguards'
		OR    items.name LIKE 'Misshapen Chestplate'
		OR    items.name LIKE 'Cracked Noc Hoof'
		OR    items.name LIKE 'Severed Noc Tail'
		OR    items.name LIKE 'Broken Noc Fang'
		OR    items.name LIKE 'High Quality Ra\'Tuk Brute Hide'
		OR    items.name LIKE 'Ra\'Tuk Warrior\'s Blade'
		OR    items.name LIKE 'Ra\'Tuk Warrior\'s Scalp'
		OR    items.name LIKE 'Quality Ra\'Tuk Brute Hide'
		OR    items.name LIKE 'Mangled Ra\'Tuk Brute Hide'))
		-- No-Drop (Be more specific here)
		OR (  items.name LIKE 'Consigned%'
		OR    items.name LIKE 'Bat Blood'
		OR    items.name LIKE 'Ak\'Anon Skylighters'
		OR    items.name LIKE 'Stone Silk'
		OR    items.name LIKE 'Giant Wood Spider Thorax'
		OR    items.name LIKE 'Puma Fang'
		OR    items.name LIKE 'Crescent Bat Hide'
		OR    items.name LIKE 'Pristine Bear Hide'
		OR    items.name LIKE 'Sporeling Cap'
		OR    items.name LIKE 'Foul Ichor Residue'
		OR    items.name LIKE 'Snake Sac'
		OR    items.name LIKE 'Fine Bone Powder'
		OR    items.name LIKE 'Mistmoore Granite'
		OR    items.name LIKE 'Soil of Underfoot'
		OR    items.name LIKE 'Grave Dust'
		OR    items.name LIKE 'Darkbone Skull'
		OR    items.name LIKE 'Collector\'s%'
		OR    items.name LIKE 'Big \'Sploder Fireworks'
		));