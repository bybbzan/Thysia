local config = {
	[9238] = Position(974, 911, 9), -- To Water Elemental Spawn
	[9239] = Position(973, 908, 5)  -- From Water Elemental Spawn
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local targetPosition = config[item.uid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dive into the vortex and swam below the rocks.')
	return true
end