--- Nerf Resists
UPDATE npc_types, ref_npcs
   SET npc_types.fr = Floor(ref_npcs.fr * 0.75),
       npc_types.cr = Floor(ref_npcs.cr * 0.75),
	   npc_types.mr = Floor(ref_npcs.mr * 0.75),
	   npc_types.dr = Floor(ref_npcs.dr * 0.75),
	   npc_types.pr = Floor(ref_npcs.pr * 0.75)
 WHERE npc_types.id = ref_npcs.id;
 
-- Decrease Aggro Range
UPDATE npc_types, ref_npcs
   SET npc_types.aggroradius = Floor(ref_npcs.aggroradius * 0.75),
	   npc_types.assistradius = Floor(ref_npc.assistradius * 0.75)
 WHERE npc_types.id = ref_npcs.id;