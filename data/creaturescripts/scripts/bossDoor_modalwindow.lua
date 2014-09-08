local config = {
	[1] = {storageKey = 35001, bossName = 'Hide'},
	[2] = {storageKey = 35002, bossName = 'Deathbine'},
	[3] = {storageKey = 35006, bossName = 'Fleshcrawler'},
	[4] = {storageKey = 35009, bossName = 'Thul'},
	[5] = {storageKey = 35010, bossName = 'The Old Widow'},
	[6] = {storageKey = 35012, bossName = 'Tormentor'},
	[7] = {storageKey = 35013, bossName = 'Flameborn'},
	[8] = {storageKey = 35014, bossName = 'Fazzrah'},
	[9] = {storageKey = 35018, bossName = 'The Many'},
	[10] = {storageKey = 35019, bossName = 'The Noxious Spawn'},
	[11] = {storageKey = 35020, bossName = 'Gorgo'},
	[12] = {storageKey = 35021, bossName = 'Stonecracker'},
	[13] = {storageKey = 35022, bossName = 'Leviathan'},
	[14] = {storageKey = 35023, bossName = 'Kerberos'},
	[15] = {storageKey = 35024, bossName = 'Ethershreck'},
	[16] = {storageKey = 35025, bossName = 'Paiz the Pauperizer'},
	[17] = {storageKey = 35027, bossName = 'Zanakeph'},
	[18] = {storageKey = 35030, bossName = 'Pirate Bosses'},
	[19] = {storageKey = 35032, bossName = 'The Horned Fox'},
	[20] = {storageKey = 37001, bossName = 'Uruk\'Hai'},
	[21] = {storageKey = 37002, bossName = 'Flameborn Foulscale'},
	[22] = {storageKey = 37003, bossName = 'Fire Overlord'},
	[23] = {storageKey = 37004, bossName = 'Sir Desrik'},
	[24] = {storageKey = 37005, bossName = 'Mr.Punish'},
	[25] = {storageKey = 37006, bossName = 'Dementor'},
	[26] = {storageKey = 37007, bossName = 'Obujos'},
	[27] = {storageKey = 37008, bossName = 'Hirintror'},
	[28] = {storageKey = 37009, bossName = 'Zarabustor'}
}
 
local function checkArea()
	local fromPosition, toPosition = Position(899, 863, 8), Position(915, 877, 8)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature then
						return false
				end
			end
		end
	end

	return true
end
 
local function clearBossRoom(cid, bossId, fromPosition, toPosition, exitPosition)
	local player = Player(cid)
	if player and isInRange(player:getPosition(), fromPosition, toPosition) then
		player:teleportTo(exitPosition)
		exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	local boss = Monster(bossId)
	if boss then
		boss:remove()
	end
end
 
function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId ~= 2 or buttonId == 2 then
		return false
	end

	local targetChoice = config[choiceId]
	if not targetChoice then
		return true
	end

	if player:getStorageValue(targetChoice.storageKey) ~= 1 or not checkArea() then
		player:say('The room is currently in use.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:setStorageValue(targetChoice.storageKey, 0)

	local destination = Position(906, 872, 8)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)

	local monster = Game.createMonster(targetChoice.bossName, Position(906, 876, 8), false, true)
	addEvent(clearBossRoom, 60 * 10 * 1000, player:getId(), monster:getId(), Position(899, 863, 8), Position(915, 877, 8), player:getTown():getTemplePosition())
	player:say('You have 10 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	return true
end