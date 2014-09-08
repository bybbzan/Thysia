local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.55, 0, -0.75, 0)
setCombatCondition(combat, condition)

	arr = {
		{1},
		{1},
		{1},
		{1},
		{1},
		{3}
			}

local area = createCombatArea(arr)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end