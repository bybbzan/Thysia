local combat = {}

for i = 20, 60 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 8000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)

	local area = createCombatArea(AREA_CROSS1X1)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(20, 60)], var)
end
