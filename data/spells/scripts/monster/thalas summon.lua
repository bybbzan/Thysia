local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

local maxsummons = 8

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 8 then
		for i = 1, maxsummons - #summoncount do
		local e = math.random(-2, 2)
			local mid = doSummonCreature("Slime Summon", { x=getCreaturePosition(cid).x+e, y=getCreaturePosition(cid).y+e, z=getCreaturePosition(cid).z })
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

		end
	end
	return doCombat(cid, combat, var)
end