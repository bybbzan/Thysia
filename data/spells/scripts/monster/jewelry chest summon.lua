local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_NONE)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

local maxsummons = 5

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 5 then
		for i = 1, maxsummons - #summoncount do
		local e = math.random(-2, 2)
			doCreatureAddHealth(cid, 500)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			local mid = doSummonCreature("Chest Guard", { x=getCreaturePosition(cid).x+e, y=getCreaturePosition(cid).y+e, z=getCreaturePosition(cid).z })
    			if mid == false then
				return false
			end
			doCreatureSay(mid, "FREEZE! LET ME SEE YOUR HANDS UP!", TALKTYPE_ORANGE_2)

		end
	end
	return doCombat(cid, combat, var)
end