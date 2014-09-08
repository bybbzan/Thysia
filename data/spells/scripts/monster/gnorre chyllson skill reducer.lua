local combat = {}

for i = 45, 55 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_POFF)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 3000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)

	local area = createCombatArea(AREA_CIRCLE3X3)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(45, 55)], var)
end
