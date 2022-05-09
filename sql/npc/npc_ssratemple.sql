-- Increase respawn time of adds in Emp event
UPDATE spawn2 SET respawntime = 1800, variance = 0 WHERE zone LIKE 'ssratemple' AND respawntime = 90;