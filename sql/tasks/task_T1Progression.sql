REPLACE INTO `tasks` (`id`, `type`, `duration`, `duration_code`, `title`, `description`, `reward`, `rewardid`, `cashreward`, `xpreward`, `rewardmethod`, `reward_radiant_crystals`, `reward_ebon_crystals`, `minlevel`, `maxlevel`, `level_spread`, `min_players`, `max_players`, `repeatable`, `faction_reward`, `completion_emote`, `replay_timer_seconds`, `request_timer_seconds`) VALUES
(9001, 2, 0, 0, 'A Song of Dragons and Fish', '[1,2,3,4,5,6,Grand Arcanist Eithan needs exotic, phase-shifted materials to improve your Essence Anchor. Seek them out in the rifts his apprentices open for you.][7,8,Eithan will work on building your new anchor. In the meantime, infuse your Rudimentary Essence Anchor with the magic of two powerful necromancers.][9,Return to the Grand Arcanist for further instruction.][10,11,Only one task remains to complete the Phased Essence Anchor - the divine spark of two lesser deific avatars.][12,Return to the Grand Arcanist for your reward.]', 'Your level cap will be increased to 60.', 450002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0);



REPLACE INTO `task_activities` (`taskid`, `activityid`, `step`, `activitytype`, `target_name`, `item_list`, `skill_list`, `spell_list`, `description_override`, `goalid`, `goal_match_list`, `goalmethod`, `goalcount`, `delivertonpc`, `zones`, `optional`) VALUES
(9001, 0, 1, 3, 'Lord Nagafen', 'Orb of Draconic Power', '-1', '0', '', 450010, NULL, 0, 1, 0, '32', 0),
(9001, 1, 1, 3, 'Lady Vox', 'Vial of Ice Dragon Blood', '-1', '0', '', 450011, NULL, 0, 1, 0, '73', 0),
(9001, 2, 1, 3, 'Phinigel Autropos', 'Delicious Seaweed', '-1', '0', '', 450012, NULL, 0, 1, 0, '64', 0),
(9001, 3, 1, 1, 'Grand Arcanist Eithan', 'Orb of Draconic Power', '-1', '0', '', 450010, NULL, 0, 1, 394192, '394', 0),
(9001, 4, 1, 1, 'Grand Arcanist Eithan', 'Vial of Ice Dragon Blood', '-1', '0', '', 450011, NULL, 0, 1, 394192, '394', 0),
(9001, 5, 1, 1, 'Grand Arcanist Eithan', 'Delicious Seaweed', '-1', '1', '', 450012, NULL, 0, 1, 394192, '394', 0),
(9001, 6, 2, 2, 'Venril Sathir', '', '-1', '0', '', 102112, NULL, 2, 1, 0, '102', 0),
(9001, 7, 2, 2, 'Trakanon', '', '-1', '0', '', 89154, NULL, 2, 1, 0, '89', 0),
(9001, 8, 3, 4, 'Grand Arcanist Eithan', '', '-1', '0', '', 394192, NULL, 0, 0, 0, '394', 0),
(9001, 9, 4, 2, 'Cazic-Thule', '', '-1', '0', '', 72003, NULL, 2, 1, 0, '72', 0),
(9001, 10, 4, 2, 'Innoruuk', '', '-1', '0', '', 186107, NULL, 2, 1, 0, '186', 0),
(9001, 11, 5, 4, 'Grand Arcanist Eithan', '', '-1', '0', '', 394192, NULL, 0, 0, 0, '394', 0);

-- Quest Items
REPLACE INTO `items` (`id`, `minstatus`, `Name`, `aagi`, `ac`, `accuracy`, `acha`, `adex`, `aint`, `artifactflag`, `asta`, `astr`, `attack`, `augrestrict`, `augslot1type`, `augslot1visible`, `augslot2type`, `augslot2visible`, `augslot3type`, `augslot3visible`, `augslot4type`, `augslot4visible`, `augslot5type`, `augslot5visible`, `augslot6type`, `augslot6visible`, `augtype`, `avoidance`, `awis`, `bagsize`, `bagslots`, `bagtype`, `bagwr`, `banedmgamt`, `banedmgraceamt`, `banedmgbody`, `banedmgrace`, `bardtype`, `bardvalue`, `book`, `casttime`, `casttime_`, `charmfile`, `charmfileid`, `classes`, `color`, `combateffects`, `extradmgskill`, `extradmgamt`, `price`, `cr`, `damage`, `damageshield`, `deity`, `delay`, `augdistiller`, `dotshielding`, `dr`, `clicktype`, `clicklevel2`, `elemdmgtype`, `elemdmgamt`, `endur`, `factionamt1`, `factionamt2`, `factionamt3`, `factionamt4`, `factionmod1`, `factionmod2`, `factionmod3`, `factionmod4`, `filename`, `focuseffect`, `fr`, `fvnodrop`, `haste`, `clicklevel`, `hp`, `regen`, `icon`, `idfile`, `itemclass`, `itemtype`, `ldonprice`, `ldontheme`, `ldonsold`, `light`, `lore`, `loregroup`, `magic`, `mana`, `manaregen`, `enduranceregen`, `material`, `herosforgemodel`, `maxcharges`, `mr`, `nodrop`, `norent`, `pendingloreflag`, `pr`, `procrate`, `races`, `range`, `reclevel`, `recskill`, `reqlevel`, `sellrate`, `shielding`, `size`, `skillmodtype`, `skillmodvalue`, `slots`, `clickeffect`, `spellshield`, `strikethrough`, `stunresist`, `summonedflag`, `tradeskills`, `favor`, `weight`, `UNK012`, `UNK013`, `benefitflag`, `UNK054`, `UNK059`, `booktype`, `recastdelay`, `recasttype`, `guildfavor`, `UNK123`, `UNK124`, `attuneable`, `nopet`, `updated`, `comment`, `UNK127`, `pointtype`, `potionbelt`, `potionbeltslots`, `stacksize`, `notransfer`, `stackable`, `UNK134`, `UNK137`, `proceffect`, `proctype`, `proclevel2`, `proclevel`, `UNK142`, `worneffect`, `worntype`, `wornlevel2`, `wornlevel`, `UNK147`, `focustype`, `focuslevel2`, `focuslevel`, `UNK152`, `scrolleffect`, `scrolltype`, `scrolllevel2`, `scrolllevel`, `UNK157`, `serialized`, `verified`, `serialization`, `source`, `UNK033`, `lorefile`, `UNK014`, `svcorruption`, `skillmodmax`, `UNK060`, `augslot1unk2`, `augslot2unk2`, `augslot3unk2`, `augslot4unk2`, `augslot5unk2`, `augslot6unk2`, `UNK120`, `UNK121`, `questitemflag`, `UNK132`, `clickunk5`, `clickunk6`, `clickunk7`, `procunk1`, `procunk2`, `procunk3`, `procunk4`, `procunk6`, `procunk7`, `wornunk1`, `wornunk2`, `wornunk3`, `wornunk4`, `wornunk5`, `wornunk6`, `wornunk7`, `focusunk1`, `focusunk2`, `focusunk3`, `focusunk4`, `focusunk5`, `focusunk6`, `focusunk7`, `scrollunk1`, `scrollunk2`, `scrollunk3`, `scrollunk4`, `scrollunk5`, `scrollunk6`, `scrollunk7`, `UNK193`, `purity`, `evoitem`, `evoid`, `evolvinglevel`, `evomax`, `clickname`, `procname`, `wornname`, `focusname`, `scrollname`, `dsmitigation`, `heroic_str`, `heroic_int`, `heroic_wis`, `heroic_agi`, `heroic_dex`, `heroic_sta`, `heroic_cha`, `heroic_pr`, `heroic_dr`, `heroic_fr`, `heroic_cr`, `heroic_mr`, `heroic_svcorrup`, `healamt`, `spelldmg`, `clairvoyance`, `backstabdmg`, `created`, `elitematerial`, `ldonsellbackrate`, `scriptfileid`, `expendablearrow`, `powersourcecapacity`, `bardeffect`, `bardeffecttype`, `bardlevel2`, `bardlevel`, `bardunk1`, `bardunk2`, `bardunk3`, `bardunk4`, `bardunk5`, `bardname`, `bardunk7`, `UNK214`, `subtype`, `UNK220`, `UNK221`, `heirloom`, `UNK223`, `UNK224`, `UNK225`, `UNK226`, `UNK227`, `UNK228`, `UNK229`, `UNK230`, `UNK231`, `UNK232`, `UNK233`, `UNK234`, `placeable`, `UNK236`, `UNK237`, `UNK238`, `UNK239`, `UNK240`, `UNK241`, `epicitem`) VALUES
(450010, 0, 'Orb of Draconic Power', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 0, 4278190080, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 2091, 'IT63', 0, 11, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', '', 0, 0, 0, 0, 100, 0, 0, '', 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2016-01-06 05:41:43', NULL, '13THFLOOR', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, '0000000000000000000', 0, '', -1, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', 0, 70, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450011, 0, 'Vial of Ice Dragon Blood', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 0, 4278190080, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 1157, 'IT63', 0, 11, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', '', 0, 0, 0, 0, 100, 0, 0, '', 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2016-01-06 05:41:43', NULL, '13THFLOOR', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, '0000000000000000000', 0, '', -1, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', 0, 70, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450012, 0, 'Delicious Seaweed', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 0, 4278190080, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 1196, 'IT63', 0, 11, 0, 0, 0, 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', '', 0, 0, 0, 0, 100, 0, 0, '', 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, NULL, '2016-01-06 05:41:43', NULL, '13THFLOOR', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, '0000000000000000000', 0, '', -1, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2015-12-11 20:53:05', 0, 70, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE items SET stacksize = 1 WHERE id >= 450010 AND id <= 450012;

REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `herosforgemodel`, `size`, `hp_regen_rate`, `hp_regen_per_second`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_spells_effects_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `special_abilities`, `aggroradius`, `assistradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_melee_texture1`, `d_melee_texture2`, `ammo_idfile`, `prim_melee_type`, `sec_melee_type`, `ranged_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `PhR`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `attack_delay`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `Avoidance`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`, `spellscale`, `healscale`, `no_target_hotkey`, `raid_target`, `armtexture`, `bracertexture`, `handtexture`, `legtexture`, `feettexture`, `light`, `walkspeed`, `peqid`, `unique_`, `fixed`, `ignore_despawn`, `show_name`, `untargetable`, `charm_ac`, `charm_min_dmg`, `charm_max_dmg`, `charm_attack_delay`, `charm_accuracy_rating`, `charm_avoidance_rating`, `charm_atk`, `skip_global_loot`, `rare_spawn`, `stuck_behavior`, `model`, `flymode`, `always_aggro`, `exp_mod`) VALUES
(27131, '#Apprentice_Sulentia', 'Nagafen\`s Lair Rift', 55, 5, 12, 1, 3825, 0, 1, 13, 0, 0, 5, 0, 0, 0, 500001, 0, 0, 0, 0, 0, 0, 0, 39, 130, -1, '', '25,1^35,1', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'IT10', 28, 28, 7, 1.25, 17, 17, 17, 17, 17, 17, 48, 0, 0, 0, 254, 0, 0, 0, 27, 1, 193, 193, 193, 193, 193, 193, 193, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 1, 0, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 100),
(30106, '#Apprentice_Balalalalalalamon', 'Everfrost Keep Rift', 55, 12, 13, 1, 3825, 0, 0, 13, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 130, -1, '', '24,1^35,1', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'IT10', 28, 28, 7, 1.25, 17, 17, 17, 17, 17, 17, 48, 0, 0, 0, 254, 0, 0, 0, 27, 1, 193, 193, 193, 193, 193, 193, 193, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 100),
(70036, '#Apprentice_Kethia', 'Kedge Keep Rift', 55, 130, 15, 1, 3825, 0, 1, 1, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 130, -1, '', '25,1^35,1', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'IT10', 28, 28, 7, 1.25, 17, 17, 17, 17, 17, 17, 48, 0, 0, 0, 254, 0, 0, 0, 27, 1, 193, 193, 193, 193, 193, 193, 193, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 1, 0, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 100),
(86006, '#Apprentice_Lariks', 'Karnor\`s Castle Rift', 55, 1, 11, 1, 3825, 0, 0, 13, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 130, -1, '', '24,1^35,1', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'IT10', 28, 28, 7, 1.25, 17, 17, 17, 17, 17, 17, 48, 0, 0, 0, 254, 0, 0, 0, 27, 1, 193, 193, 193, 193, 193, 193, 193, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 1, 0, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 100),
(95108, '#Apprentice_Sslish', 'Sebilis Rift', 55, 128, 1, 1, 3825, 0, 1, 0, 0, 0, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 130, -1, '', '24,1^35,1', 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'IT10', 28, 28, 7, 1.25, 17, 17, 17, 17, 17, 17, 48, 0, 0, 0, 254, 0, 0, 0, 27, 1, 193, 193, 193, 193, 193, 193, 193, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 1, 0, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 100);


REPLACE INTO `spawn2` (`id`, `spawngroupID`, `zone`, `version`, `x`, `y`, `z`, `heading`, `respawntime`, `variance`, `pathgrid`, `path_when_zone_idle`, `_condition`, `cond_value`, `enabled`, `animation`, `min_expansion`, `max_expansion`, `content_flags`, `content_flags_disabled`) VALUES
(264357, 287837, 'lavastorm', 0, 368.000000, 2202.000000, 71.000000, 208.000000, 1200, 0, 0, 0, 0, 1, 1, 0, -1, -1, NULL, NULL),
(270078, 287838, 'everfrost', 0, -6965.000000, 1943.000000, -57.000000, 236.000000, 1200, 0, 0, 0, 0, 1, 1, 1, -1, -1, NULL, NULL),
(270079, 287839, 'cauldron', 0, -1154.000000, -623.000000, 0.000000, 269.000000, 1200, 0, 0, 0, 0, 1, 1, 0, -1, -1, NULL, NULL),
(270080, 287840, 'dreadlands', 0, -1875.000000, 733.000000, 26.000000, 468.000000, 1200, 0, 0, 0, 0, 1, 1, 0, -1, -1, NULL, NULL),
(270081, 287841, 'trakanon', 0, -4828.000000, -1615.000000, -472.000000, 91.000000, 1200, 0, 0, 0, 0, 1, 1, 0, -1, -1, NULL, NULL);




REPLACE INTO `spawnentry` (`spawngroupID`, `npcID`, `chance`, `condition_value_filter`, `min_expansion`, `max_expansion`, `content_flags`, `content_flags_disabled`) VALUES
(287837, 27131, 100, 1, -1, -1, NULL, NULL),
(287838, 30106, 100, 1, -1, -1, NULL, NULL),
(287839, 70036, 100, 1, -1, -1, NULL, NULL),
(287840, 86006, 100, 1, -1, -1, NULL, NULL),
(287841, 95108, 100, 1, -1, -1, NULL, NULL);

REPLACE INTO `spawngroup` (`id`, `name`, `spawn_limit`, `dist`, `max_x`, `min_x`, `max_y`, `min_y`, `delay`, `mindelay`, `despawn`, `despawn_timer`, `wp_spawns`) VALUES
(287837, 'lavastorm_287837', 1, 0, 0, 0, 0, 0, 45000, 15000, 0, 100, 0),
(287838, 'everfrost_287838', 0, 0, 0, 0, 0, 0, 45000, 15000, 0, 100, 0),
(287839, 'cauldron_287839', 0, 0, 0, 0, 0, 0, 45000, 15000, 0, 100, 0),
(287840, 'dreadlands_287840', 0, 0, 0, 0, 0, 0, 45000, 15000, 0, 100, 0),
(287841, 'trakanon_287841', 0, 0, 0, 0, 0, 0, 45000, 15000, 0, 100, 0);

INSERT INTO spawn2 (spawngroupID, zone, version, x, y, z, heading, respawntime, variance, pathgrid, path_when_zone_idle, _condition, cond_value, enabled, animation)
SELECT spawngroupID, zone, 1, x, y, z, heading, 99999999, 0, pathgrid, path_when_zone_idle, _condition, cond_value, enabled, animation
FROM spawn2 
WHERE ( zone LIKE 'soldungb' OR zone LIKE 'permafrost' OR zone LIKE 'kedge' OR zone LIKE 'karnor' OR zone LIKE 'sebilis' OR zone LIKE 'fearplane' OR zone LIKE 'hateplaneb' )
AND version = 0;

INSERT INTO npc_types (id, name, lastname, level, race, class, bodytype, hp, mana, gender, texture, helmtexture, herosforgemodel, size, hp_regen_rate, hp_regen_per_second, mana_regen_rate, loottable_id, merchant_id, alt_currency_id, npc_spells_id, npc_spells_effects_id, npc_faction_id, adventure_template_id, trap_template, mindmg, maxdmg, attack_count, npcspecialattks, special_abilities, aggroradius, assistradius, face, luclin_hairstyle, luclin_haircolor, luclin_eyecolor, luclin_eyecolor2, luclin_beardcolor, luclin_beard, drakkin_heritage, drakkin_tattoo, drakkin_details, armortint_id, armortint_red, armortint_green, armortint_blue, d_melee_texture1, d_melee_texture2, ammo_idfile, prim_melee_type, sec_melee_type, ranged_type, runspeed, MR, CR, DR, FR, PR, Corrup, PhR, see_invis, see_invis_undead, qglobal, AC, npc_aggro, spawn_limit, attack_speed, attack_delay, findable, STR, STA, DEX, AGI, _INT, WIS, CHA, see_hide, see_improved_hide, trackable, isbot, exclude, ATK, Accuracy, Avoidance, slow_mitigation, version, maxlevel, scalerate, private_corpse, unique_spawn_by_name, underwater, isquest, emoteid, spellscale, healscale, no_target_hotkey, raid_target, armtexture, bracertexture, handtexture, legtexture, feettexture, light, walkspeed, peqid, unique_, fixed, ignore_despawn, show_name, untargetable, charm_ac, charm_min_dmg, charm_max_dmg, charm_attack_delay, charm_accuracy_rating, charm_avoidance_rating, charm_atk, skip_global_loot, rare_spawn, stuck_behavior, model, flymode, always_aggro, exp_mod) VALUES 