-- MOTD
UPDATE variables SET value = "Welcome to Pyrelight (BETA). Progression is currently available through level 60. MQ2 is allowed, but please refrain from using active hacks (/warp, /zone, etc). Join our discord @ https://discord.gg/UCG7X82Cy7" WHERE varname LIKE 'MOTD';

-- Rules
---- Misc
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Inventory:EnforceAugmentRestriction";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Map:FixZWhenPathing";
UPDATE rule_values SET rule_value = 1      WHERE rule_name = "Map:DistanceCanTravelBeforeAdjustment";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Map:FixPathingZOnSendTo";
UPDATE rule_values SET rule_value = 50     WHERE rule_name = "Character:SkillUpMaximumChancePercentage";
UPDATE rule_values SET rule_value = 5      WHERE rule_name = "Character:SkillUpMinimumChancePercentage";

---- Accounts & Login
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "World:EnableIPExemptions";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "World:IPLimitDisconnectAll";
UPDATE rule_values SET rule_value = 1      WHERE rule_name = "World:MaxClientsPerIP";
UPDATE rule_values SET rule_value = 1      WHERE rule_name = "World:AddMaxClientsPerIP";
UPDATE rule_values SET rule_value = 1      WHERE rule_name = "World:AddMaxClientsStatus";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:ActiveInvSnapshots";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:SoftDeletes";

---- Cheat Detection
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:AllowMQTarget";

---- Regen
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:RestRegenEnabled";
UPDATE rule_values SET rule_value = 6      WHERE rule_name = "Character:RestRegenRaidTimeToActivate";
UPDATE rule_values SET rule_value = 6      WHERE rule_name = "Character:RestRegenTimeToActivate";

---- Equipment
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:EnableDiscoveredItems";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Inventory:AllowOnlyOneInstanceEquipped";

---- Item Stat Caps
UPDATE rule_values SET rule_value = 750    WHERE rule_name = "Character:AvoidanceCap";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:EnableAvoidanceCap";
UPDATE rule_values SET rule_value = 1000   WHERE rule_name = "Character:ItemAccuracyCap";
UPDATE rule_values SET rule_value = 2000   WHERE rule_name = "Character:ItemATKCap";
UPDATE rule_values SET rule_value = 750    WHERE rule_name = "Character:ItemAvoidanceCap";
UPDATE rule_values SET rule_value = 100    WHERE rule_name = "Character:ItemDSMitigationCap";
UPDATE rule_values SET rule_value = 500    WHERE rule_name = "Character:ItemDamageShieldCap";
UPDATE rule_values SET rule_value = 5000   WHERE rule_name = "Character:ItemExtraDmgCap";
UPDATE rule_values SET rule_value = 50     WHERE rule_name = "Character:ItemCombatEffectsCap";
UPDATE rule_values SET rule_value = 90     WHERE rule_name = "Character:ItemDoTShieldingCap";
UPDATE rule_values SET rule_value = 90     WHERE rule_name = "Character:ItemShieldingCap";
UPDATE rule_values SET rule_value = 90     WHERE rule_name = "Character:ItemSpellShieldingCap";
UPDATE rule_values SET rule_value = 90     WHERE rule_name = "Character:ItemStunResistCap";
UPDATE rule_values SET rule_value = 90     WHERE rule_name = "Character:ItemStrikethroughCap";
UPDATE rule_values SET rule_value = 250    WHERE rule_name = "Character:ItemClairvoyanceCap";
UPDATE rule_values SET rule_value = 5000   WHERE rule_name = "Character:ItemSpellDmgCap";
UPDATE rule_values SET rule_value = 5000   WHERE rule_name = "Character:ItemHealAmtCap";
UPDATE rule_values SET rule_value = 1000   WHERE rule_name = "Character:ItemHealthRegenCap";
UPDATE rule_values SET rule_value = 250    WHERE rule_name = "Character:ItemManaRegenCap";
UPDATE rule_values SET rule_value = 250    WHERE rule_name = "Character:ItemEnduranceRegenCap";

---- Character Creation
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "World:EnableTutorialButton";
UPDATE rule_values SET rule_value = 0      WHERE rule_name = "World:MaxLevelForTutorial";
UPDATE rule_values SET rule_value = 394    WHERE rule_name = "World:TutorialZoneID";

---- AA & Experience
UPDATE rule_values SET rule_value = 2      WHERE rule_name = "Character:ShowExpValues";
UPDATE rule_values SET rule_value = 70     WHERE rule_name = "Character:MaxLevel";
UPDATE rule_values SET rule_value = 70     WHERE rule_name = "Character:MaxExpLevel";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Character:PerCharacterBucketMaxLevel";
UPDATE rule_values SET rule_value = 1      WHERE rule_name = "Character:RaidExpMultiplier";
UPDATE rule_values SET rule_value = 100    WHERE rule_name = "Character:DeathExpLossLevel";

---- Expansion Settings
UPDATE rule_values SET rule_value = 8      WHERE rule_name = "Expansion:CurrentExpansion";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Expansion:UseCurrentExpansionAAOnly";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "World:UseClientBasedExpansionSettings";
UPDATE rule_values SET rule_value = 8192   WHERE rule_name = "World:ExpansionSettings";

---- Bots
UPDATE rule_values SET rule_value = 8      WHERE rule_name = "Bots:BotExpansionSettings";
UPDATE rule_values SET rule_value = 4      WHERE rule_name = "Bots:CreationLimit";
UPDATE rule_values SET rule_value = 2      WHERE rule_name = "Bots:SpawnLimit";
UPDATE rule_values SET rule_value = 2      WHERE rule_name = "Bots:SpawnLimit";
UPDATE rule_values SET rule_value = 2      WHERE rule_name = "Bots:ManaRegen";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Bots:AllowApplyPoisonCommand";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Bots:AllowApplyPotionCommand";
UPDATE rule_values SET rule_value = 'true' WHERE rule_name = "Bots:FinishBuffing";

---- Spells
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:ItemExtraSpellAmtCalcAsPercent";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:IgnoreSpellDmgLvlRestriction";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:FlatItemExtraSpellAmt";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Character:PetsUseReagents";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Character:UnmemSpellsOnDeath";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:BuffLevelRestrictions";
UPDATE rule_values SET rule_value = 10      WHERE rule_name = "Spells:AOEMaxTargets";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:EnableSpellBuckets";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Character:ItemCastsUseFocus";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Spells:LiveLikeFocusEffects";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:HOTsScaleWithHealAmt";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:FlatItemExtraSpellAmt";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:RuneUseHealAmt";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:DSUseSpellDmg";	

---- Combat
UPDATE rule_values SET rule_value = 1       WHERE rule_name = "Combat:FleeHPRatio";
UPDATE rule_values SET rule_value = 1       WHERE rule_name = "Combat:FleeGrayHPRatio";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Combat:MeleePush";
UPDATE rule_values SET rule_value = 'false' WHERE rule_name = "Combat:OneProcPerWeapon";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Pets:TauntTogglesPetTanking";
UPDATE rule_values SET rule_value = 'true'  WHERE rule_name = "Spells:UseSpellImpliedTargeting";
UPDATE rule_values SET rule_value = '-1'    WHERE rule_name = "Aggro:MaxScalingProcAggro";