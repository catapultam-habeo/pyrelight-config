local CustomItems = {}
--[[
chance == chance for loottable to be picked to drop if this fails.. the loottable is skipped!
loot_table == table of items... example below has ITEMID, item drop chance and charges!
droplimit == max number of drops from table.. if that number is hit it will stop trying to addloot .. this number is increased by double_loot value!
mindrop == min number of drops from table.. will keep trying till this number is reached .. this number is increased by double_loot value!

-- 50 chance for loottable and 1 chance for item would result in  1 / 200 drop chance!
-- 10 chance for loottable and 1 chance for item would result in  1 / 1000 drop chance! (.1 * 0.01)
-- 1 chance for loottable and 1 chance for item would result in 1 / 10,000 drop chance! (0.01 * 0.01)
-- the Debug will tell you the chance of drop if turned on
-- If mindrop is set.. as it loops the chance to drop INCREASES to lower the number of itterations needed to meet the required drop amount!

EXAMPLE:
function event_spawn(e)
	local CustomItems = require("custom_items");
	local loot_table = {
		[1001] = {1},  -- [itemid] = {chance_item, charges, equip(0,1)}
		[1002] = {1},
		[1003] = {1},
		[1004] = {1},
		[13005] = {1, 5},
		[13006] = {1},
	};
	e.self:AddLoot(50, loot_table, 1, 0);
end
--]]
function NPC:AddLoot(chance, loot_table, droplimit, mindrop)
	local qdebug = true;
	local double_loot = 1;
	local dropped = 0;
	local curr_item = 0;
	local stack_count = 0;
	local loop_count = 0;
	if(droplimit == nil) then droplimit = 0; end
	if(mindrop == nil) then mindrop = 0; end
	local do_loop = (mindrop > 0 and true) or false; -- NoLoop true
	local equip_item = false;
	local loot_slots = 0;
		
	droplimit = droplimit * double_loot;
	mindrop = mindrop * double_loot;
	
	local add_table = math.random(100);
	if (add_table > chance) then return; end -- We must roll lower than the chance
	
	local items = {};
	for key, value in pairs(loot_table) do
		table.insert(items, key);
	end
	
	repeat
		loop_count = loop_count + 1;
		for i = 1, double_loot do
			--Sort Items randomly to make for more random loot  (re-randomizes after a Double_loot call)
			for i = table.maxn(items), 2, -1 do -- backwards
				local r = math.random(i) -- select a random number between 1 and i
				items[i], items[r] = items[r], items[i] -- swap the randomly selected item to position i
			end 
		
			for g, itemid in pairs(items) do
				if (math.random(100) <= (loot_table[itemid][1] + (loop_count - 1))) then
					curr_item = Item(itemid);
					if (curr_item:Slots() > 0) then
						if (loot_table[itemid][3] == nil) then
							equip_item = false;
						elseif (loot_table[itemid][3] > 0) then
							equip_item = true;
						end
					end
					stack_count = loot_table[itemid][2];
					if(stack_count == nil or stack_count == 0) then stack_count = 1; end --Make sure we have at least 1
					local total_chance_drop = chance/100; --Chance for table to get picked?
					total_chance_drop = total_chance_drop * (loot_table[itemid][1]/100) * 100; -- Chance for this specific item to be picked~
					if (qdebug) then eq.GMSay("EntID: " .. self:GetID() .. " ItemID: " .. itemid .. " chance: " .. total_chance_drop .. "%% mindrop: " .. mindrop .. " droplimit: " .. droplimit .. " equiped: " .. (equip_item and '1' or '0'), 315); end
					dropped = dropped + 1;
					if (curr_item:Stackable() or curr_item:MaxCharges() > 0) then
							self:AddItem(itemid, stack_count, equip_item);
					else
						--Multiple of a stackable item...
						for m = 1, stack_count do
							self:AddItem(itemid, 1, equip_item);
						end
					end
					--Check if we exceed the drop limit
					if (droplimit > 0 and dropped >= droplimit) then return; end
				end
			end
		end
		if (loop_count >= 100) then
			if (qdebug) then eq.GMSay("EntID: " .. self:GetID() .. " hit limit on loop_count", 315) end
			return; 
		end -- Loop limit incase your loottables are dumb as fuuuck
	until ((dropped >= mindrop and mindrop > 0) or do_loop == false)
end


return CustomItems;
