local combat = {}

for i = 15, 30 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)

	local area = createCombatArea(AREA_CIRCLE3X3)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(15, 30)], var)
end
