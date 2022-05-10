-- Velium Weapons
UPDATE items
   SET reclevel = 0, reqlevel = 0, proclevel=1, proclevel2=1
 WHERE id >= 30200 AND id <= 30209;
 
-- Remove req-levels
UPDATE items
   SET reqlevel = 0;
   


