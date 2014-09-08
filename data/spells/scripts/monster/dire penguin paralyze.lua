	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POFF)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
	setConditionFormula(condition, -0.24, 0, -0.29, 0)
	setCombatCondition(combat, condition)

	local area = createCombatArea(AREA_CIRCLE2X2)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
