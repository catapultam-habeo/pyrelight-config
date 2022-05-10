-- Velium Weapons
UPDATE items
   SET reclevel = 0, reqlevel = 0, proclevel=1, proclevel2=1
 WHERE id >= 30200 AND id <= 30209;
 
-- Remove req-levels
UPDATE items
   SET reqlevel = 0;

-- Clickies with charges must-equip to click if you can
UPDATE items, ref_items
   SET items.clicktype = 4
 WHERE items.id = ref_items.id
   AND ref_items.maxcharges > 4
   AND classes > 0
   AND races > 0
   AND slots > 0;

-- Single target heal clickies on are a 30 sec unique reuse
UPDATE items, spells_new, ref_items
   SET items.recasttype = 50,
       items.recastdelay = Greatest(30, ref_items.recastdelay, items.recastdelay)
 WHERE items.id = ref_items.id
   AND items.clickeffect = spells_new.id
   AND ref_items.maxcharges > 0
   AND spells_new.effectid1 = 0
   AND spells_new.buffduration = 0
   AND spells_new.targettype = 5
   AND spells_new.effect_base_value1 > 0;

--  rune clickies on are a 5 minute unique reuse
UPDATE items, spells_new, ref_items
   SET items.recasttype = 51,
       items.recastdelay = Greatest(300, ref_items.recastdelay, items.recastdelay)
 WHERE items.id = ref_items.id
   AND items.clickeffect = spells_new.id
   AND ref_items.maxcharges > 0
   AND spells_new.effectid1 = 55;

-- CH clickies are 10 minutes on unique reuse, but are instant
UPDATE items, spells_new, ref_items
   SET items.recasttype = 52,
       items.recastdelay = Greatest(1800, ref_items.recastdelay, items.recastdelay),
       items.casttime = 0
 WHERE items.id = ref_items.id
   AND items.clickeffect = spells_new.id
   AND ref_items.maxcharges > 0
   AND ( items.clickeffect = 13 OR items.clickeffect = 1292 ); 

-- Group heal clickies on are a 1 minute unique reuse, but are instant
UPDATE items, spells_new, ref_items
   SET items.recasttype = 53,
       items.recastdelay = Greatest(60, ref_items.recastdelay, items.recastdelay),
       items.casttime = 0
 WHERE items.id = ref_items.id
   AND items.clickeffect = spells_new.id
   AND ref_items.maxcharges > 0
   AND spells_new.effectid1 = 0
   AND spells_new.buffduration = 0
   AND (spells_new.targettype = 3 OR spells_new.targettype = 41)
   AND spells_new.effect_base_value1 > 0;

-- Anything with a duration that heals or hurts can be spammed
UPDATE items, spells_new, ref_items
   SET items.recasttype = -1,
       items.recastdelay = Greatest(0, ref_items.recastdelay)
 WHERE items.id = ref_items.id
   AND items.clickeffect = spells_new.id
   AND ref_items.maxcharges > 0
   AND spells_new.buffduration > 0;

-- Stackable items go back to being charged
UPDATE items, ref_items
   SET items.maxcharges = ref_items.maxcharges
 WHERE ref_items.maxcharges > 0 AND items.maxcharges < 1
   AND items.stacksize > 1;

---- Ivandyr's Hoop -> Aug
UPDATE items SET itemtype = 54, classes = 65535, clicktype = 4, casttime = 0, recastdelay = 30 WHERE id = 10082;