local combat = {}

for i = 35, 75 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)

	local area = createCombatArea(AREA_CROSS1X1)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(35, 75)], var)
end
