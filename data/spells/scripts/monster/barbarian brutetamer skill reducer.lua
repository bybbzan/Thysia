local combat = {}

for i = 90, 99 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 8000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)

	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(90, 99)], var)
end

