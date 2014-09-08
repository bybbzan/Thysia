local combat = {}

for i = 15, 30 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(15, 30)], var)
end
