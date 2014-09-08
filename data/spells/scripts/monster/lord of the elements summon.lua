local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

local maxsummons = 2

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do

	if getCreatureOutfit(cid).lookType == 11 then
		summon = "roaring water elemental"
		local mid = doSummonCreature(summon, getCreaturePosition(cid))
    			if mid == false then
				return false
			end
		doConvinceCreature(cid, mid)
	elseif getCreatureOutfit(cid).lookType == 285 then
		summon = "jagged earth elemental"
		local mid = doSummonCreature(summon, getCreaturePosition(cid))
    			if mid == false then
				return false
			end
		doConvinceCreature(cid, mid)

	elseif getCreatureOutfit(cid).lookType == 290 then
		summon = "overcharged energy elemental"
		local mid = doSummonCreature(summon, getCreaturePosition(cid))
    			if mid == false then
				return false
			end
		doConvinceCreature(cid, mid)

	elseif getCreatureOutfit(cid).lookType == 243 then
		summon = "blistering fire elemental"
		local mid = doSummonCreature(summon, getCreaturePosition(cid))
    			if mid == false then
				return false
			end
		doConvinceCreature(cid, mid)
			end
		end
	end
	return doCombat(cid, combat, var)
end