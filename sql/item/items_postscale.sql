-- Velium Weapons
UPDATE items
   SET reclevel = 0, reqlevel = 0, proclevel=1, proclevel2=1
 WHERE id >= 30200 AND id <= 30209;
 
-- Remove req-levels
UPDATE items
   SET reqlevel = 0;
   
---- Ivandyr's Hoop -> Aug
UPDATE items SET itemtype = 54, classes = 65535, clicktype = 4, casttime = 0, recastdelay = 30, recasttype = -1 WHERE id = 10082;
---- Bladestopper
UPDATE items SET reclevel = 52, classes = 65535, slots = 16384, clickeffect = 8015, recastdelay = 600, clicktype = 4 WHERE id = 11632;
---- White Dragon Hide
UPDATE items SET itemtype = 54, classes = 65535, slots = 131072, clicktype = 4, clickeffect = 6377, recastdelay = 600 WHERE id = 11602;

