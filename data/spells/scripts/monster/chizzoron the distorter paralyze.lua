	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
	setConditionFormula(condition, -0.60, 0, -0.85, 0)
	setCombatCondition(combat, condition)

	local area = createCombatArea(AREA_CIRCLE3X3)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
