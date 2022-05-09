---- Replace Initiate Dakkan With Vundar the Dark (Who is transformed elsewhere into Apprentice_Nostos)
DELETE  FROM spawnentry WHERE npcID = 394147 AND spawngroupID = 55098;
DELETE  FROM spawnentry WHERE npcID = 394027 AND spawngroupID = 54874;
REPLACE INTO spawnentry (spawngroupID, npcID, chance) VALUES (55098,394027,100);