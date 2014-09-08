local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)

local maxsummons = 1

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 1 then
			mid = doSummonCreature("Fire Elemental", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

	end
	return doCombat(cid, combat, var)
end