local combat = {}

for i = 40, 50 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(40, 50)], var)
end
