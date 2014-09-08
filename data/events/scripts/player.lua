function Player:onBrowseField(position)
 for _, pos in ipairs(BROWSE_POSITIONS) do
  if position.x == pos.x and position.y == pos.y and position.z == pos.z then
   return false
  end
 end
 return true
end

function Player:onLook(thing, position, distance)
	local description = "You see " .. thing:getDescription(distance)
	if thing:isCreature() and thing:isPlayer() then
		if distance == -1 then
			description = string.format("%s You have %d quest points.", description, math.max(0, thing:getStorageValue(32010)))
		else
			description = string.format("%s %s has %d quest points.", description, thing:getSex() == 0 and "She" or "He", math.max(0, thing:getStorageValue(32010)))
		end
	end

	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format("%s\nItemID: [%d]", description, thing:getId())

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, ActionID: [%d]", description, actionId)
			end
			
			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, UniqueId: [%d]", description, uniqueId)
			end
			
			description = description .. "."
			local itemType = thing:getType()
			
			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransformTo: [%d] (onEquip).", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransformTo: [%d] (onDeEquip).", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecayTo: [%d]", description, decayId)
			end
		elseif thing:isCreature() then
			local str = "%s\nHealth: [%d / %d]"
			if thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: [%d / %d]", str, thing:getMana(), thing:getMaxMana())
			end
				
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end
		
		local position = thing:getPosition()
		description = string.format(
			"%s\nPosition: [X: %d] [Y: %d] [Z: %d].",
			description, position.x, position.y, position.z
		)
		
		if thing:isCreature() then
			if thing:isPlayer() then
				description = string.format("%s\nIP: [%s].", description, Game.convertIpToString(thing:getIp()))
			end
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInBattleList(creature, distance)
	local description = "You see " .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = "%s\nHealth: [%d / %d]"
		if creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: [%d / %d]", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosition: [X: %d] [Y: %d] [Z: %d].",
			description, position.x, position.y, position.z
		)
		
		if creature:isPlayer() then
			description = string.format("%s\nIP: [%s].", description, Game.convertIpToString(creature:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, "You see " .. item:getDescription(distance))
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveItem(item, count, fromPosition, toPosition)
	return true
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

function Player:onTurn(direction)
    if(self:getGroup():getAccess() and self:getDirection() == direction) then
        local pos = self:getPosition()
        self:teleportTo(direction == NORTH and pos - {y = 1} or direction == EAST and pos + {x = 1} or direction == SOUTH and pos + {y = 1} or pos - {x = 1}, true)
    end
    return true
end

function Player:onTradeRequest(target, item)
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local config =  { 
	[1] = 1.10, -- +10%
	[2] = 1.20, -- +20%
	[3] = 1.50, -- +50%
	[4] = 1.90 -- +90%
}

function Player:onGainExperience(source, exp, rawExp)
	local party = self:getParty()
	if party then
		if party:isSharedExperienceEnabled() and party:isSharedExperienceActive() then
			local bonus = config[party:getVocationCount()]
			if not bonus then
				return exp
			end

			exp = exp * bonus
		end
	end

	return exp
end

function Player:onLoseExperience(exp)
	return exp
end
