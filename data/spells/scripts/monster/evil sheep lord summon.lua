local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HEARTS)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

local maxsummons = 3

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 3 then
		for i = 1, maxsummons - #summoncount do
			local mid = doSummonCreature("Evil Sheep", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

		end
	end
	return doCombat(cid, combat, var)
end