-- Make Modifications to Repurpose Vanilla NPCs
UPDATE npc_types SET name="#Emissary_Tinnvin", lastname="Server Greeter"  WHERE id="394012";
UPDATE npc_types SET name="Apprentice_Nostos", lastname="Fast Travel", level="50", race="522", class="1", bodytype="1", hp="907", mana="0", gender="0", texture="11", helmtexture="3", herosforgemodel="0", size="6", hp_regen_rate="0", mana_regen_rate="0", loottable_id="0", merchant_id="0", alt_currency_id="0", npc_spells_id="0", npc_spells_effects_id="0", npc_faction_id="0", adventure_template_id="0", trap_template="0", mindmg="3", maxdmg="54", attack_count="-1", npcspecialattks="HZ", special_abilities="24,1^35,1", aggroradius="70", assistradius="0", face="4", luclin_hairstyle="0", luclin_haircolor="3", luclin_eyecolor="0", luclin_eyecolor2="0", luclin_beardcolor="3", luclin_beard="1", drakkin_heritage="1", drakkin_tattoo="0", drakkin_details="4", armortint_id="0", armortint_red="0", armortint_green="0", armortint_blue="0", d_melee_texture1="10507", d_melee_texture2="0", ammo_idfile="IT10", prim_melee_type="28", sec_melee_type="28", ranged_type="7", runspeed="1.25", MR="10", CR="10", DR="10", FR="10", PR="10", Corrup="16", PhR="10", see_invis="0", see_invis_undead="1", qglobal="0", AC="155", npc_aggro="0", spawn_limit="0", attack_speed="-0.102804", attack_delay="36", findable="1", STR="129", STA="129", DEX="129", AGI="129", _INT="129", WIS="129", CHA="129", see_hide="0", see_improved_hide="0", trackable="0", isbot="0", exclude="1", ATK="0", Accuracy="0", Avoidance="0", slow_mitigation="0", version="0", maxlevel="0", scalerate="100", private_corpse="0", unique_spawn_by_name="1", underwater="0", isquest="1", emoteid="0", spellscale="100", healscale="100", no_target_hotkey="0", raid_target="0", armtexture="0", bracertexture="0", handtexture="0", legtexture="0", feettexture="0", light="0", walkspeed="0", peqid="0", unique_="0", fixed="0", ignore_despawn="0", show_name="1", untargetable="0", charm_ac="0", charm_min_dmg="0", charm_max_dmg="0", charm_attack_delay="0", charm_accuracy_rating="0", charm_avoidance_rating="0", charm_atk="0", skip_global_loot="0", rare_spawn="0", stuck_behavior="0", model="0", flymode="-1", always_aggro="0", exp_mod="100" WHERE id="394027";

UPDATE npc_types, spawn2, spawnentry
   SET spawn2.enabled = 1
 WHERE spawn2.spawngroupID = spawnentry.spawngroupID
   AND spawnentry.npcID = npc_types.id
   AND spawn2.zone LIKE 'crescent';

-- Remove Vanilla NPCs we don't want
UPDATE npc_types, spawn2, spawnentry
   SET spawn2.enabled = 0
 WHERE spawn2.spawngroupID = spawnentry.spawngroupID
   AND spawnentry.npcID = npc_types.id
   AND spawn2.zone LIKE 'crescent'
   AND npc_types.level > 19  
   AND npc_types.lastname NOT LIKE '%_Guildmaster'
   AND npc_types.lastname NOT LIKE '%_Spells'
   AND npc_types.lastname NOT LIKE '%_Tomes'
   AND npc_types.name NOT LIKE '%Apprentice_Nostos%' 
   AND npc_types.name NOT LIKE '%Emissary_Tinnvin%'
   AND npc_types.name NOT LIKE '%Smithy_%'   
   AND npc_types.name NOT LIKE '%Warden_%' 
   AND npc_types.name NOT LIKE '%Banker_%' 
   AND npc_types.name NOT LIKE '%Merchant_%' 
   AND npc_types.name NOT LIKE '%Poisoner_%' 
   AND npc_types.name NOT LIKE '%Brewmaster_Ishaq%' 
   AND npc_types.name NOT LIKE '%Merchant Wyn%' 
   AND npc_types.name NOT LIKE '%Smith_Gyasi%' 
   AND npc_types.name NOT LIKE '%Smith_Azibo%' 
   AND npc_types.name NOT LIKE '%Smith_Yahya%' 
   AND npc_types.name NOT LIKE '%Smith_Nkosi%' 
   AND npc_types.name NOT LIKE '%Smith_Fenyang%' 
   AND npc_types.name NOT LIKE '%Vladneig_Glavern%' 
   AND npc_types.name NOT LIKE '%Mbisi%' 
   AND npc_types.name NOT LIKE '%Gemcrafter_Lentos%' 
   AND npc_types.name NOT LIKE '%Jeweler_Nailah%' 
   AND npc_types.name NOT LIKE '%Jeweler_Mahail%' 
   AND npc_types.name NOT LIKE '%Alchemist_Abeben%' 
   AND npc_types.name NOT LIKE '%Alchemist_Kili%' 
   AND npc_types.name NOT LIKE '%Cook_Kosey%' 
   AND npc_types.name NOT LIKE '%Tailor_Meika%' 
   AND npc_types.name NOT LIKE '%Tailor_Panya%' 
   AND npc_types.name NOT LIKE '%Fletcher_Tahira%' 
   AND npc_types.name NOT LIKE '%Potter_Subira%' 
   AND npc_types.name NOT LIKE '%Halima%' 
   AND npc_types.name NOT LIKE '%Priestess_Aelea%'
   AND npc_types.name NOT LIKE '%Vundar_the_Dark%' 
;
		 
UPDATE npc_types, spawn2, spawnentry
   SET spawn2.enabled = 0
 WHERE spawn2.spawngroupID = spawnentry.spawngroupID
   AND spawnentry.npcID = npc_types.id
   AND spawn2.zone LIKE 'crescent'
   AND ( npc_types.name LIKE '%Jenn_Stalbath%' 
      OR npc_types.name LIKE '%Historian_Pewdri%' );


