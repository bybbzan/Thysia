local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GIFT_WRAPS)

local maxsummons = 2

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 2 then
			mid = doSummonCreature("Monk", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

	end
	return doCombat(cid, combat, var)
end