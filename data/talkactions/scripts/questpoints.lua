function onSay(cid, words, param, channel)
	local player = Player(cid)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You currently have ' .. math.max(0, player:getStorageValue(32010)) .. ' quest points in total.')
	return false
end
