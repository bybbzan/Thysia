function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local questPoints = 45
	if player:getStorageValue(32010) < questPoints then
		player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You need ' .. questPoints .. ' quest points to get access here.', TALKTYPE_MONSTER_SAY)
		return true
	end

	return true
end
