local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYPOISON)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

local maxsummons = 2

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do
			local mid = doSummonCreature("Death Blob", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

		end
	end
	return doCombat(cid, combat, var)
end