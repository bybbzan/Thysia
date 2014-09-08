local combat = {}

for i = 5, 10 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_POFF)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)

	local condition2 = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition2, CONDITION_PARAM_TICKS, 20000)
	setConditionFormula(condition2, -0.7, 0, -0.9, 0)

	local area = createCombatArea(AREA_CIRCLE2X2)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
	setCombatCondition(combat[i], condition2)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(5, 10)], var)
end
