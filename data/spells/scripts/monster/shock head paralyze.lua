local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PURPLEENERGY)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.5, 0, -0.75, 0)
setCombatCondition(combat, condition)

	local area = createCombatArea({
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	})
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end