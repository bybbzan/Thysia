local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

local maxsummons = 1

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 1 then
		for i = 1, maxsummons - #summoncount do
			local mid = doSummonCreature("Parasite", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

		end
	end
	return doCombat(cid, combat, var)
end