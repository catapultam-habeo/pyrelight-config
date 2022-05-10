-- Adjust CT, Innoruuk proportionally
UPDATE npc_types, ref_npcs
   SET npc_types.level = 55,
       npc_types.hp = ref_npcs.hp * Ceil(55/ref_npcs.level/2),
       npc_types.hp_regen_rate = ref_npcs.hp_regen_rate * Ceil(55/ref_npcs.hp_regen_rate),
       npc_types.mindmg = ref_npcs.mindmg * Ceil(55/ref_npcs.mindmg),
       npc_types.maxdmg = ref_npcs.maxdmg * Ceil(55/ref_npcs.maxdmg),
       npc_types.mr = ref_npcs.mr * Ceil(55/ref_npcs.mr),
       npc_types.fr = ref_npcs.fr * Ceil(55/ref_npcs.fr),
       npc_types.cr = ref_npcs.cr * Ceil(55/ref_npcs.cr),
       npc_types.dr = ref_npcs.dr * Ceil(55/ref_npcs.dr),
       npc_types.pr = ref_npcs.pr * Ceil(55/ref_npcs.pr)
 WHERE npc_types.id = ref_npcs.id
   AND ( npc_types.id = 72003 
    OR   npc_types.id = 186107 
    OR   npc_types.id = 71065
    OR   npc_types.id = 89154
    OR   npc_types.id = 186158 );

-- Remove Trak Banish
DELETE FROM npc_spells_entries WHERE spellid = 855;
