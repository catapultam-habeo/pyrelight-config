-- MOTD
UPDATE variables SET value = "Welcome to Pyrelight (BETA). The current level cap is 52, the Progression Quest for Stage 2 (Level cap 60) will be released soon. MQ2 is allowed, but please refrain from using active hacks (/warp, /zone, etc). Join our discord @ https://discord.gg/UCG7X82Cy7" WHERE varname LIKE 'MOTD';

-- Rules
---- Misc
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:EnableDiscoveredItems"
											OR rule_name = "Character:RestRegenEnabled"
											OR rule_name = "Character:SoftDeletes"
											OR rule_name = "Inventory:EnforceAugmentRestriction"
											OR rule_name = "Map:FixZWhenPathing"
											OR rule_name = "Map:FixPathingZOnSendTo"
											OR rule_name = "World:EnableIPExemptions"
											OR rule_name = "World:IPLimitDisconnectAll"											
											OR rule_name = "Inventory:AllowOnlyOneInstanceEquipped"
											OR rule_name = "Spells:EnableSpellBuckets";
UPDATE rule_values SET rule_value = 2    WHERE rule_name = "Character:ShowExpValues";
UPDATE rule_values SET rule_value = 50   WHERE rule_name = "Character:SkillUpMaximumChancePercentage";
UPDATE rule_values SET rule_value = 5    WHERE rule_name = "Character:SkillUpMinimumChancePercentage";
UPDATE rule_values SET rule_value = 1    WHERE rule_name = "World:AddMaxClientsPerIP"
											OR rule_name = "World:AddMaxClientsStatus"
											OR rule_name = "World:MaxClientsPerIP";

---- Character Creation
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "World:EnableTutorialButton";
UPDATE rule_values SET rule_value = 0     WHERE rule_name = "World:MaxLevelForTutorial";
UPDATE rule_values SET rule_value = 394   WHERE rule_name = "World:TutorialZoneID";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Character:ActiveInvSnapshots"
                                             OR rule_name = "Character:AllowMQTarget";
---- AA & Experience
UPDATE rule_values SET rule_value = 70    WHERE rule_name = "Character:MaxLevel" OR rule_name = "Character:MaxExpLevel";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Character:PerCharacterBucketMaxLevel";
UPDATE rule_values SET rule_value = 1     WHERE rule_name = "Character:RaidExpMultiplier";
UPDATE rule_values SET rule_value = 100 WHERE rule_name = "Character:DeathExpLossLevel";

---- Expansion Settings
UPDATE rule_values SET rule_value = 8     WHERE rule_name = "Bots:BotExpansionSettings" OR rule_name = "Expansion:CurrentExpansion";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Expansion:UseCurrentExpansionAAOnly" OR rule_name = "World:UseClientBasedExpansionSETtings";
UPDATE rule_values SET rule_value = 8192  WHERE rule_name = "World:ExpansionSETtings";
---- Bots
UPDATE rule_values SET rule_value = 4 WHERE rule_name = "Bots:CreationLimit";
UPDATE rule_values SET rule_value = 2 WHERE rule_name = "Bots:SpawnLimit";
UPDATE rule_values SET rule_value = 2 WHERE rule_name = "Bots:SpawnLimit";
UPDATE rule_values SET rule_value = 1 WHERE rule_name = "Bots:ManaRegen";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Bots:AllowApplyPoisonCommand"
											  OR rule_name = "Bots:AllowApplyPotionCommand"
											  OR rule_name = "Bots:FinishBuffing";

---- Item Stat Caps
UPDATE rule_values SET rule_value = 750  WHERE rule_name = "Character:AvoidanceCap";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:EnableAvoidanceCap"
											OR rule_name = "Character:ItemCastsUseFocus";

UPDATE rule_values SET rule_value = 500  WHERE rule_name = "Character:ItemAccuracyCap"
										    OR rule_name = "Character:ItemATKCap"
										    OR rule_name = "Character:ItemAvoidanceCap"
											OR rule_name = "Character:ItemDSMitigationCap"
											OR rule_name = "Character:ItemDamageShieldCap"
											OR rule_name = "Character:ItemExtraDmgCap";
UPDATE rule_values SET rule_value = 95   WHERE rule_name = "Character:ItemCombatEffectsCap"
											OR rule_name = "Character:ItemDoTShieldingCap"
											OR rule_name = "Character:ItemShieldingCap"
											OR rule_name = "Character:ItemSpellShieldingCap"
											OR rule_name = "Character:ItemStunResistCap"
											OR rule_name = "Character:ItemStrikethroughCap"
											OR rule_name = "Character:ItemClairvoyanceCap";
UPDATE rule_values SET rule_value = 2000 WHERE rule_name = "Character:ItemSpellDmgCap"
										    OR rule_name = "Character:ItemHealAmtCap";
UPDATE rule_values SET rule_value = 1000 WHERE rule_name = "Character:ItemHealthRegenCap"
										    OR rule_name = "Character:ItemManaRegenCap"
											OR rule_name = "Character:ItemEnduranceRegenCap";
---- Spells
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Character:PetsUseReagents"
											 OR rule_name = "Character:UnmemSpellsOnDeath"
											 OR rule_name = "Spells:BuffLevelRestrictions";
UPDATE rule_values SET rule_value = 10    WHERE rule_name =	"Spells:AOEMaxTargets";										 
---- Combat
UPDATE rule_values SET rule_value = 1     WHERE rule_name = "Combat:FleeHPRatio" 
											 OR rule_name = "Combat:FleeGrayHPRatio";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Combat:MeleePush"
											 OR rule_name = "Spells:LiveLikeFocusEffects";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Combat:OneProcPerWeapon"
											 OR rule_name = "Pets:TauntTogglesPetTanking"
											 OR rule_name = "Spells:FlatItemExtraSpellAmt"
											 OR rule_name = "Spells:HOTsScaleWithHealAmt"
											 OR rule_name = "Spells:IgnoreSpellDmgLvlRestriction"
											 OR rule_name = "Spells:ItemExtraSpellAmtCalcAsPercent"
											 OR rule_name = "Spells:RuneUseHealAmt"
											 OR rule_name = "Spells:UseSpellImpliedTargeting"
											 OR rule_name = "Spells:DSUseSpellDmg";											 