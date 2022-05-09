--- Remove Wizard Familiars
DELETE FROM bot_spells_entries
WHERE spellid = 2553
   OR spellid = 2555
   OR spellid = 2557
   OR spellid = 2560;