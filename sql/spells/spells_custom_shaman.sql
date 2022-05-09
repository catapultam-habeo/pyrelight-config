--- Nerf Puma Line (Proc rate, group effect, limited duration)
UPDATE spells_new
   SET effect_limit_value5 = 100,
       targettype = 3,
	   buffdurationformula = 3,
	   buffduration = 10
 WHERE id = 6906 OR id = 6735 OR id = 6667;