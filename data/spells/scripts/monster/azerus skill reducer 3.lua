local combat = {}

for i = 45, 55 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(45, 55)], var)
end
