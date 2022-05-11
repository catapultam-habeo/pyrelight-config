-- Remove POK Books
DELETE
  FROM doors
 WHERE dest_zone LIKE 'poknowledge'
   AND zone  NOT LIKE 'potranquility';
   
-- Remove Books from POK
DELETE
  FROM doors
 WHERE zone LIKE 'poknowledge'
   AND dest_zone NOT LIKE 'NONE'
   AND dest_zone NOT LIKE 'potranquility'
    OR name          LIKE 'PORTBASE';

-- Fix Zone Points that use bad bitmask values
UPDATE zone_points 
   SET client_version_mask = 4294967232 
   WHERE id = 1478
      OR id = 1585
	   OR id = 14153
      OR id = 2336
      OR id = 2344
      OR id = 2345;

-- Misty and Tox
UPDATE zone SET expansion = 1 WHERE short_name LIKE 'mistythicket' OR short_name LIKE 'toxxulia';
UPDATE zone SET expansion = 100 WHERE short_name LIKE 'misty' OR short_name LIKE 'tox';
   
-- Delete all zone points to zones we don't USE
DELETE
  FROM zone_points
 WHERE target_zone_id = 33 -- Misty Thicket (old)
    OR target_zone_id = 408 -- New Commonlands
	OR target_zone_id = 38 -- Toxxulia Forest (old)
	OR (target_zone_id = 25 AND target_instance = 0); -- Wrong Nektulos Instance
 
DELETE
  FROM doors
 WHERE dest_zone LIKE 'misty'
    OR dest_zone LIKE 'commonlands'
	OR dest_zone LIKE 'tox'
	OR (dest_zone LIKE 'nektulos' AND dest_instance = 0);

-- Connect Crescent Reach to Antonica
UPDATE zone SET expansion = -1 WHERE short_name LIKE 'crescent' OR short_name LIKE 'highpass%';	  

UPDATE zone_points 
   SET target_x = -203,
       target_y = 1050,
	   target_z = -191,
	   target_heading = 188,
	   target_zone_id = 407
 WHERE id = 1573; -- Move Crescent->Blightfire to point to Highpass Instead
 
UPDATE zone_points 
   SET target_x = -2790,
       target_y = -974,
	   target_z = -53,
	   target_heading = 247,
	   target_zone_id = 394
 WHERE id = 1584; -- Move Highpass->Blightfire to point to Crescent Instead