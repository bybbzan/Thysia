local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

local maxsummons = 4

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 4 then
		for i = 1, maxsummons - #summoncount do
			local mid = doSummonCreature("Mindmasher summon", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

		end
	end
	return doCombat(cid, combat, var)
end