-- Drop Content Tables
source server/pyrelight-config/sql/peq/drop_tables_content.sql

-- Source Content Tables
source server/pyrelight-config/sql/peq/peq-dump/create_tables_content.sql
source server/pyrelight-config/sql/peq/2022_03_07_saylink_collation.sql
source server/pyrelight-config/sql/peq/2022_04_30_hp_regen_per_second.sql
source server/pyrelight-config/sql/peq/2022_05_02_npc_types_int64.sql
source server/pyrelight-config/sql/peq/2022_05_03_task_activity_goal_match_list.sql
source server/pyrelight-config/sql/peq/2022_05_07_merchant_data_buckets.sql

-- Drop & Rebuild Reference Tables
CREATE OR REPLACE TABLE ref_items LIKE items;
CREATE OR REPLACE TABLE ref_spells LIKE spells_new;
CREATE OR REPLACE TABLE ref_npcs LIKE npc_types;
CREATE OR REPLACE TABLE ref_lootdrop_entries LIKE lootdrop_entries;

DELETE FROM spells_new where id > 44000;

INSERT INTO ref_items SELECT * FROM items;
INSERT INTO ref_spells SELECT * FROM spells_new;
INSERT INTO ref_npcs SELECT * FROM npc_types;
INSERT INTO ref_lootdrop_entries SELECT * FROM lootdrop_entries;

-- Execute Patch
---- Execute Pre-Scaling Actions
source server/pyrelight-config/sql/rules/rules.sql
source server/pyrelight-config/sql/rules/rules2.sql
source server/pyrelight-config/sql/npc/npc_spawn_rules.sql
source server/pyrelight-config/sql/spawn/spawn_crescent.sql
source server/pyrelight-config/sql/rules/fix-zones.sql
source server/pyrelight-config/sql/spells/tl-locations.sql
source server/pyrelight-config/sql/item/items_custom.sql
source server/pyrelight-config/sql/item/items_t1boss.sql
source server/pyrelight-config/sql/loot/starting_items.sql
source server/pyrelight-config/sql/rules/char_create_combos.sql
source server/pyrelight-config/sql/aa/aa_pets.sql
source server/pyrelight-config/sql/aa/aa_general.sql

---- Execute Scaling
source server/pyrelight-config/sql/item/items_scaling_reclevels.sql
source server/pyrelight-config/sql/item/items_scaling_main.sql
source server/pyrelight-config/sql/item/items_scaling_augments.sql
source server/pyrelight-config/sql/item/items_augment_oow.sql
source server/pyrelight-config/sql/item/items_augment_schema.sql
source server/pyrelight-config/sql/npc/npc_scaling.sql

---- Execute Post-Scaling Actions
source server/pyrelight-config/sql/item/items_postscale.sql
source server/pyrelight-config/sql/item/items_epics_postscale.sql
source server/pyrelight-config/sql/item/items_t1boss.sql
source server/pyrelight-config/sql/npc/npc_t1boss.sql

--- Final Actions
source server/pyrelight-config/sql/item/items_custom_noscale.sql
source server/pyrelight-config/sql/npc/npc_ssratemple.sql
source server/pyrelight-config/sql/npc/npc_karnors.sql
source server/pyrelight-config/sql/spells/spells_permanent_buffs.sql
source server/pyrelight-config/sql/spells/spells_bot_modifications.sql
source server/pyrelight-config/sql/spells/spells_custom_shaman.sql
source server/pyrelight-config/sql/loot/merchants_crescent.sql
source server/pyrelight-config/sql/loot/loot_trash.sql
source server/pyrelight-config/sql/loot/loot_global_augs.sql
source server/pyrelight-config/sql/loot/loot_crescent.sql
source server/pyrelight-config/sql/loot/loot_t1boss.sql
source server/pyrelight-config/sql/npc/npc_crescent.sql
source server/pyrelight-config/sql/npc/npc_cosmetic.sql

source server/pyrelight-config/sql/tasks/task_T1Progression.sql