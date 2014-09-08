	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
	setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_THROWINGSTAR)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
	setConditionFormula(condition, -0.25, 0, -0.35, 0)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
