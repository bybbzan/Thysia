local bossNames, flamePosition = {
	'hide',
	'deathbine',
	'fleshcrawler',
	'thul',
	'the old widow',
	'tormentor',
	'flameborn',
	'fazzrah',
	'the many',
	'the noxious spawn',
	'gorgo',
	'stonecracker',
	'leviathan',
	'kerberos',
	'ethershreck',
	'paiz the pauperizer',
	'zanakeph',
	'the horned fox',
	'necropharus',
	'brutus bloodbeard', 
	'lethal lissy', 
	'deadeye devious', 
	'ron the ripper',
	'uruk hai',
	'flameborn foulscale',
	'fire overlord',
	'sir desrik',
	'mr.punish',
	'dementor',
	'obujos',
	'hirintror',
	'zarabustor'

}, Position(911, 873, 8)

local function clearRoom(cid, fromPosition, toPosition, exitPosition)
	local player = Player(cid)
	if player and isInRange(player:getPosition(), fromPosition, toPosition) then
		player:teleportTo(exitPosition)
		exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	local item = Tile(flamePosition):getItemById(1397)
	if item then
		item:remove()
	end
end

function onKill(cid, target, lastHit)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if not isInArray(bossNames, targetMonster:getName():lower()) then
		return true
	end

	local player = Player(cid)
	local item = Game.createItem(1397, 1, flamePosition)
	if item:isTeleport() then
		item:setDestination(player:getTown():getTemplePosition())
	end

	targetMonster:say('You now have 1 minute to exit this room through the teleporter or you will be kicked.', TALKTYPE_MONSTER_SAY)
	addEvent(clearRoom, 60000, player:getId(), Position(899, 863, 8), Position(915, 877, 8), player:getTown():getTemplePosition())

	return true
end
