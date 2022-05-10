--- Dragons
UPDATE npc_types, ref_npcs SET npc_types.race = 530, npc_types.size = 80 WHERE npc_types.id = ref_npcs.id AND ref_npcs.race = 49;
UPDATE npc_types SET texture = 4, helmtexture = 4 WHERE id = 32040 OR name LIKE "%Lord_Nagafen%";

-- Cazic Thule
UPDATE npc_types, ref_npcs SET npc_types.race = 670, npc_types.size = 50 WHERE npc_types.id = ref_npcs.id AND ref_npcs.race = 95;

--Phinny
UPDATE npc_types, ref_npcs SET npc_types.race = 561, npc_types.size = ref_npc.size*1.5 WHERE npc_types.id = ref_npcs.id AND ref_npcs.race = 103;