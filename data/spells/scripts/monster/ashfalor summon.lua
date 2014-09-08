local summons = {
    [1] = {name = "Demon Skeleton"},
    [2] = {name = "Bonebeast"},
	[3] = {name = "Banshee"},
	[4] = {name = "Blightwalker"},
	[5] = {name = "Crypt Shambler"},
	[6] = {name = "Ghoul"},
	[7] = {name = "Lich"},
	[8] = {name = "Mummy"},
	[9] = {name = "Zombie"},
	[10] = {name = "Ghost"},
    [11] = {name = "Enraged Soul"},
    [12] = {name = "Vampire"},
    [13] = {name = "Vampire Bride"},
    [14] = {name = "Vampire Viscount"},
	[15] = {name = "Pirate Ghost"},
	[16] = {name = "Souleater"},
	[17] = {name = "Tarnished Spirit"},
	[18] = {name = "White Shade"},
	[19] = {name = "Vicious Manbat"}
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

	arr = {
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	}

	local area = createCombatArea(arr)
	setCombatArea(combat, area)
	
local maxsummons = 25

function onCastSpell(cid, var)
doCreatureSay(cid, "RISE MY SERVANTS! RISE!!", TALKTYPE_ORANGE_2)
math.randomseed(os.time())

	local summoncount = getCreatureSummons(cid)
	if #summoncount < 25 then
		for i = 1, maxsummons do
		local e, f = math.random(-3, 3), math.random(-3, 3)
			local mid = doSummonCreature(summons[math.random(#summons)].name, { x=getCreaturePosition(cid).x+e, y=getCreaturePosition(cid).y+f, z=getCreaturePosition(cid).z })
    			if mid == false then
				return false
			end
		end
	end
	return doCombat(cid, combat, var)
end