-- Fix Spawns in Nektulos and Lavastorm
UPDATE spawn2 SET min_expansion = -1 WHERE zone LIKE 'nektulos' OR zone LIKE 'lavastorm';