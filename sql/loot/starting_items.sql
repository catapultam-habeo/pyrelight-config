-- Delete Existing
DELETE FROM starting_items;

-- Backpack, Aug Sealer
INSERT INTO starting_items (itemid,slot)
VALUES (32601,23), (500004,24);
INSERT INTO starting_items (itemid, item_charges)
VALUES (13005,100), (12607,100);

-- Equipped Weapons
--- Warrior - 2H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (1,30201,13);
--- Cleric - Morning Star
INSERT INTO starting_items (class, itemid, slot)
VALUES (2,30205,13);
--- Paladin - 2H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (3,30201,13);
--- Ranger - 1H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (4,30200,13);
--- Shadow Knight - 2H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (5,30201,13);
--- Druid - 1H Scimitar
INSERT INTO starting_items (class, itemid, slot)
VALUES (6,30203,13);
--- Monk - 2H Staff
INSERT INTO starting_items (class, itemid, slot)
VALUES (7,30206,13);
--- Bard - 1H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (8,30200,13);
--- Rogue - Dagger
INSERT INTO starting_items (class, itemid, slot)
VALUES (9,30207,13);
--- Shaman - Spear
INSERT INTO starting_items (class, itemid, slot)
VALUES (10,30208,13);
--- Necromancer - Dagger
INSERT INTO starting_items (class, itemid, slot)
VALUES (11,30207,13);
--- Wizard - Dagger
INSERT INTO starting_items (class, itemid, slot)
VALUES (12,30207,13);
--- Magician - Dagger
INSERT INTO starting_items (class, itemid, slot)
VALUES (13,30207,13);
--- Enchanter - Dagger
INSERT INTO starting_items (class, itemid, slot)
VALUES (14,30207,13);
--- Beastlord - Spear
INSERT INTO starting_items (class, itemid, slot)
VALUES (15,30208,13);
--- Berserker - 2H Sword
INSERT INTO starting_items (class, itemid, slot)
VALUES (16,30201,13);