function event_warp(e)
	local key = e.self:GetIPString() .. "-HackerFlag"	
	local hacks = 0	
	if (eq.get_data(key) == nil or eq.get_data(key) == '') then
		hacks = 1
	else
		hacks = 1 + tonumber(eq.get_data(key))
	end	
	eq.set_data(key,tostring(hacks),"36000")
	
	if ((
	     eq.get_zone_short_name ~= 'acrylia' or
		 eq.get_zone_short_name ~= 'airplane' or
		 eq.get_zone_short_name ~= 'bazaar' or
		 eq.get_zone_short_name ~= 'griegsend' or
		 eq.get_zone_short_name ~= 'katta' or
		 eq.get_zone_short_name ~= 'mischiefplane' or
		 eq.get_zone_short_name ~= 'poair' or
		 eq.get_zone_short_name ~= 'pojustice' or
		 eq.get_zone_short_name ~= 'potranquility' or
	  	 eq.get_zone_short_name ~= 'povalor' or
		 eq.get_zone_short_name ~= 'shadowhaven' or
		 eq.get_zone_short_name ~= 'skyshrine' or
		 eq.get_zone_short_name ~= 'solrotower' or
		 eq.get_zone_short_name ~= 'sseru' or
		 eq.get_zone_short_name ~= 'ssratemple'
  ) and (math.random(0,20) <= hacks) and hacks > 5 ) then
				e.self:Message(13,  "HACK DETECTED. Rule #1 Enforcement Action Applied. ACTIVE Hacks are not allowed on Pyrelight (/warp, /zone, /ghost, /gate). If you feel this action was in error, please contact a GM on Discord.")
				e.self:Kill()
	else
		e.self:Message(13, "HACK DETECTED. ACTIVE Hacks are not allowed on Pyrelight (/warp, /zone, /ghost, /gate). Upon hack detection, it is recorded for later review, and there is a random chance that your character will instantly die. Please contact a GM on Discord if this was in error.")		
	end
end

function pyrelight_scribe(e)
  local maxLevel = e.self:GetLevel();
  if ( maxLevel > 60 ) then
        maxLevel=60;
  end
  local spells = e.self:GetScribeableSpells(1,maxLevel);
  for k,v in ipairs(spells) do
    e.self:ScribeSpell(v,e.self:GetNextAvailableSpellBookSlot());
  end
end

function pyrelight_tl_flag(e)
        local key = e.self:CharacterID() .. "-TL";
        local charFlags = eq.get_data(key);
        local allFlags = eq.get_data("Locations-TL");
        local shortname = eq.get_zone_short_name();
        local tier = string.sub(charFlags,1,1);
        local items = split(eq.get_data("TLItems"),":");

        if ((string.find(allFlags,":" .. shortname .. "&" .. tier)) and tier ~= '' and tier ~= nil and not (string.find(charFlags,":" .. shortname .. ":"))) then
                eq.set_data(key,charFlags .. shortname .. ":");
                e.self:Message(270, "You have gained a character flag!");
                e.self:Message(15, "Your [" .. eq.item_link(tonumber(items[tonumber(tier)+1])) .. "] has become attuned to the energies of this place. (" .. eq.get_zone_long_name() .. ")");
        end
end

function check_level_flag(e)
	local key = e.self:CharacterID() .. "-CharMaxLevel"
	
	if eq.get_data(key) == "" then
		eq.set_data(key, "52")
		e.self:Message(15, "Your Level Cap has been set to 52.")
	end
end

function event_discover_item(e)
	if e.item:HP() or e.item:Mana() or e.item:AC() > 0 or e.item:AStr() > 0 or e.item:ASta() > 0 or e.item:ADex() > 0 or e.item:AAgi() > 0 or e.item:AInt() > 0 or e.item:AWis() > 0 or e.item:ACha() > 0 or e.item:AugType() > 0 then
	
		local key = e.self:CharacterID() .. "-DiscoCount";
		if (eq.get_data(key) == nil or eq.get_data(key) == "") then
			eq.set_data(key,tostring(1));
		else
			eq.set_data(key,tostring(tonumber(eq.get_data(key)) + 1));
		end
		eq.world_emote(15,e.self:GetCleanName() .. " is the first to discover " .. eq.item_link(e.item:ID()) .. ".");
	end
end

function event_connect(e)
	check_level_flag(e)
	pyrelight_tl_flag(e)
	pyrelight_scribe(e)	
	
	-- Apply LOTD
	e.self:GrantAlternateAdvancementAbility(481,1);
	
	-- Apply BOTD if Account Entitled
	if eq.get_data(e.self:AccountID() .. "-AlphaFlag") == "true" then
		e.self:GrantAlternateAdvancementAbility(600,1);
	end
end

function event_enter_zone(e)
	check_level_flag(e)
	pyrelight_tl_flag(e)
	pyrelight_scribe(e)
end

function event_level_up(e)
	check_level_flag(e)
	pyrelight_tl_flag(e)
	pyrelight_scribe(e)
end 

function event_combine_validate(e)
	if (e.recipe_id == 10344) then
		if (e.validate_type:find("check_zone")) then
			if (e.zone_id ~= 289 and e.zone_id ~= 290) then
				return 1;
			end
		end
	end
	return 0;
end

function event_combine_success(e)
	if (e.recipe_id == 10904 or e.recipe_id == 10905 or e.recipe_id == 10906 or e.recipe_id == 10907) then
		e.self:Message(1,
		"The gem resonates with power as the shards placed within glow unlocking some of the stone's power. "
		.. "You were successful in assembling most of the stone but there are four slots left to fill, "
		.. "where could those four pieces be?"
		);
	elseif(e.recipe_id == 10903 or e.recipe_id == 10346 or e.recipe_id == 10334) then
		local reward = { };
		reward["melee"] =  { ["10903"] = 67665, ["10346"] = 67660, ["10334"] = 67653 };
		reward["hybrid"] = { ["10903"] = 67666, ["10346"] = 67661, ["10334"] = 67654 };
		reward["priest"] = { ["10903"] = 67667, ["10346"] = 67662, ["10334"] = 67655 };
		reward["caster"] = { ["10903"] = 67668, ["10346"] = 67663, ["10334"] = 67656 };

		local ctype = eq.ClassType(e.self:GetClass());
		e.self:SummonItem(reward[ctype][tostring(e.recipe_id)]);
		e.self:SummonItem(67704); -- Item: Vaifan's Clockwork Gemcutter Tools
		e.self:Message(1, "Success");
	--cleric 1.5
	elseif(e.recipe_id == 19460) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');
		eq.set_global("cleric_epic","7",5,"F");
	--rogue 1.5
	elseif(e.recipe_id == 13402 or e.recipe_id == 13403 or e.recipe_id == 13404 or e.recipe_id == 13405) then
		e.self:Message(15,"The piece of the metal orb fuses together with the blue diamonds under the intense heat of the forge. As it does, a flurry of images flash through your mind... A ranger and his bear side by side, stoic and unafraid, in a war-torn forest. A bitter tattooed woman with bluish skin wallowing in misery in a waterfront tavern. An endless barrage of crashing thunder and lightning illuminating a crimson brick ampitheater. Two halflings locked in a battle of wits using a checkered board. The images then fade from your mind");
	--ranger 1.5 tree
	elseif(e.recipe_id ==13412) then
		eq.set_global("ranger_epic","3",5,"F");
		if(eq.get_zone_short_name()=="jaggedpine") then
			e.self:Message(15,"The seed grows rapidly the moment you push it beneath the soil. It appears at first as a mere shoot, but within moments grows into a stout sapling and then into a gigantic tree. The tree is one you've never seen before. It is the coloration and thick bark of a redwood with the thick bole indicative of the species. The tree is, however, far too short and has spindly branches sprouting from it with beautiful flowers that you would expect on a dogwood. You take all of this in at a glance. It takes you a moment longer to realize that the tree is moving.");			
			eq.spawn2(181222, 0, 0, e.self:GetX()+3,e.self:GetY()+3,e.self:GetZ(),0); -- NPC: Red_Dogwood_Treant
		else
			e.self:Message(15,"The soil conditions prohibit the seed from taking hold");
			e.self:SummonItem(72091); -- Item: Fertile Earth
			e.self:SummonItem(62621); -- Item: Senvial's Blessing
			e.self:SummonItem(62622); -- Item: Grinbik's Blessing
			e.self:SummonItem(62844); -- Item: Red Dogwood Seed
		end
	--ranger 1.5 final
	elseif(e.recipe_id ==13413) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');
		eq.set_global("ranger_epic","5",5,"F");
	--ranger 2.0
	elseif(e.recipe_id ==19914 or e.recipe_id==19915) then
		e.self:Message(15,'Very Good. Now we must attune the cage to the specific element we wish to free. You will need two items, one must protect from the element and the other must be able to absorb an incredible amount of that element. This is not a simple task. You must first discover the nature of the spirit that you wish to free and then find such items that will allow you to redirect its power. You must know that each spirit represents a specific area within their element and that is what you must focus on, not their element specifically. For example, Grinbik was an earth spirit, but his area of power was fertility. Senvial was a spirit of Water, but his power was in mist and fog.');
		eq.set_global("ranger_epic","8",5,"F");
	elseif(e.recipe_id ==19916) then
		e.self:Message(15,"The Red Dogwood Treant speaks to you from within your sword. 'Well done. This should allow me to free a spirit with power over cold and ice. Now you need to find the power that binds the spirit and unleash it where that spirit is bound.'");	
	elseif(e.recipe_id ==19917) then
		if(eq.get_zone_short_name()=="anguish") then
			eq.spawn2(317113, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: #Oshimai_Spirit_of_the_High_Air
		end
	-- paladin 1.5 final
	elseif(e.recipe_id ==19880) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("paladin_epic","8",5,"F");
		e.self:Message(6,"As the four soulstones come together, a soft blue light eminates around the dark sword. The soulstones find themselves at home within the sword. A flash occurs and four voices in unison speak in your mind, 'Thank you for saving us and giving us a purpose again. You are truly our savior and our redeemer, and we shall serve you from now on. Thank you, noble knight!")
	--bard 1.5 final	
	elseif(e.recipe_id == 19882) then
		e.self:AddEXP(25000);
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("bard15","6",5,"F");
	--druid 1.5 feerrott
	elseif(e.recipe_id == 19888) then
		if(eq.get_zone_short_name()=="feerrott") then
			eq.spawn2(47209, 0, 0, e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),0); -- NPC: corrupted_spirit
			e.self:Message(0,"compelled spirit screams as his essences is forced back into the world of the living. 'What is this? Where am I? Who are you? What do you want from me?");
		else
			e.self:SummonItem(62827); -- Item: Mangled Head
			e.self:SummonItem(62828); -- Item: Animating Heads
			e.self:SummonItem(62836); -- Item: Soul Stone
		end
	-- druid 1.5 final
	elseif(e.recipe_id ==19892) then
		e.self:AddAAPoints(5);
		e.self:Ding();
		e.self:Message(15,'You have gained 5 ability points!');	
		eq.set_global("druid_epic","8",5,"F");	
		e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "You plant the Mind Crystal and the Seed of Living Brambles in the pot. The pot grows warm and immediately you see a vine sprouting from the soil. The vine continues to grow at a tremendous rate. Brambles grow into the heart of the crystal where the core impurity is and split it. They continue to grow at an astounding speed and soon burst the pot and form the Staff of Living Brambles");
	--druid 2.0 sub final
	elseif(e.recipe_id ==19908) then
		if(eq.get_zone_short_name()=="anguish") then
			eq.spawn2(317115, 0, 0, e.self:GetX()+3,e.self:GetY()+3,e.self:GetZ(),0); -- NPC: #Yuisaha
			e.self:SummonItem(62883); -- Item: Essence of Rainfall
			e.self:SummonItem(62876); -- Item: Insulated Container
		else
			e.self:Message(15,"The rain spirit cannot be reached here");
			e.self:SummonItem(47100); -- Item: Globe of Discordant Energy
			e.self:SummonItem(62876); -- Item: Insulated Container
			e.self:SummonItem(62878); -- Item: Frozen Rain Spirit
			e.self:SummonItem(62879); -- Item: Everburning Jagged Tree Limb
		end
	--druid 2.0 final
	elseif(e.recipe_id ==19909) then	
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');	
		eq.set_global("druid_epic","13",5,"F");	
		--e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "You plant the Mind Crystal and the Seed of Living Brambles in the pot. The pot grows warm and immediately you see a vine sprouting from the soil. The vine continues to grow at a tremendous rate. Brambles grow into the heart of the crystal where the core impurity is and split it. They continue to grow at an astounding speed and soon burst the pot and form the Staff of Living Brambles");
	--warrior 2.0
	elseif(e.recipe_id ==19902) then	
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');	
		eq.set_global("warrior_epic","21",5,"F");		
	-- CLR 2.0
	elseif (e.recipe_id == 19893) then
		e.self:Message(13, "Omat should probably see this.");
	--ench 2.0
	elseif (e.recipe_id == 19919) then
		eq.set_global("ench_epic","9",5,"F");
		e.self:Message(15,"Your Oculus of Persuasion gleams with a blinding light for a moment, dimming quickly to its previous understated beauty. The light has left an image burned into your mind, a strangely tattooed woman chanting by a waterfall.");
	--ench 2.0 final
	elseif (e.recipe_id == 19920) then
		e.self:Message(15,"The discordant energy shoots through the staff, sending a shower of sparks through the air. The crystal shatters before you, and as the sparks fade away you notice the changes in your staff.");
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');
		eq.set_global("ench_epic","10",5,"F");
	--pal 2.0 final
	elseif (e.recipe_id == 19925) then
		e.self:Message(15,"As you combine all six tokens in the scabbard with Redemption, you feel a tugging at your soul. An energy flows through you as you feel the virtues of your inner self being tugged and tempered into the weapon. For a second you feel drained, but now that feeling has subsided. A final flash of light occurs and a new sword is tempered; Nightbane, Sword of the Valiant");
		e.self:AddEXP(50000);
		e.self:AddAAPoints(10);
		e.self:Ding();
		e.self:Message(15,'You have gained 10 ability points!');
		eq.set_global("paladin_epic","11",5,"F");
		eq.delete_global("paladin_epic_mmcc");
		eq.delete_global("paladin_epic_hollowc");
	elseif (e.recipe_id == 2182) then -- Pumpkin Pie
		if (eq.is_task_activity_active(19, 0)) then -- The Hungry Halfling
			eq.update_task_activity(19, 0, 1);
		end
	elseif (e.recipe_id == 2181) then -- Pumpkin Bread
		if (eq.is_task_activity_active(19, 1)) then -- The Hungry Halfling
			eq.update_task_activity(19, 1, 1);
		end
	elseif (e.recipe_id == 7811) then -- Spiced Pumpkin Cider
		if (eq.is_task_activity_active(19, 2)) then -- The Hungry Halfling
			eq.update_task_activity(19, 2, 1);
		end
	elseif (e.recipe_id == 2183) then -- Pumpkin Shake
		if (eq.is_task_activity_active(19, 3)) then -- The Hungry Halfling
			eq.update_task_activity(19, 3, 1);
		end
	end
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end