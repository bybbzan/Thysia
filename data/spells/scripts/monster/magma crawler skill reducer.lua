local combat = {}

for i = 15, 55 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 7000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)

	local area = createCombatArea(AREA_CROSS1X1)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(15, 55)], var)
end
