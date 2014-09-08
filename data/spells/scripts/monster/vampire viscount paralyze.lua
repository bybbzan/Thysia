	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
	setConditionFormula(condition, -0.55, 0, -0.7, 0)
	setCombatCondition(combat, condition)

	local area = createCombatArea(AREA_CIRCLE2X2)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
