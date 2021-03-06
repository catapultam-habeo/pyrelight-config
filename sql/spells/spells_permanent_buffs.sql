---- Make player buffs permanent
UPDATE spells_new, ref_spells
   SET spells_new.buffdurationformula = 50
 WHERE ref_spells.id = spells_new.id 
   AND ref_spells.goodeffect = 1
 AND ( ref_spells.classes1  < 255
    OR ref_spells.classes2  < 255
	OR ref_spells.classes3  < 255
	OR ref_spells.classes4  < 255
	OR ref_spells.classes5  < 255
	OR ref_spells.classes6  < 255
	OR ref_spells.classes7  < 255
	OR ref_spells.classes9  < 255
	OR ref_spells.classes10 < 255
	OR ref_spells.classes11 < 255
	OR ref_spells.classes12 < 255
	OR ref_spells.classes13 < 255
	OR ref_spells.classes14 < 255
	OR ref_spells.classes15 < 255
	OR ref_spells.classes16 < 255 )
 AND ref_spells.effectid2 != 3
 AND ref_spells.effectid1 != 40
 AND ref_spells.effectid1 != 337
 AND ref_spells.buffduration > 6
 AND ref_spells.short_buff_box < 1;

-- Elemental Empathy Recourse
UPDATE spells_new
   SET buffdurationformula = 50
 WHERE id = 3701;
 
