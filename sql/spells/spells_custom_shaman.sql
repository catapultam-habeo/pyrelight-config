--- Nerf Puma Line (Proc rate, group effect, limited duration)
UPDATE spells_new
   SET effect_limit_value5 = 100,
       targettype = 3,
	     buffdurationformula = 3,
	     buffduration = 10,
       short_buff_box = 1,
       classes10 = 255
 WHERE id = 6906 OR id = 6735 OR id = 6667;

 UPDATE spells_new, ref_spells
    SET spells_new.ResistDiff = -50
  WHERE spells_new.id = ref_spells.id
    AND ref_spells.ResistDiff = -300
    AND ref_spells.name LIKE "%maw";

DELETE FROM character_memmed_spells WHERE spell_id = 6906 OR spell_id= 6735 OR spell_id = 6667;
DELETE FROM character_spells WHERE spell_id = 6906 OR spell_id= 6735 OR spell_id = 6667;