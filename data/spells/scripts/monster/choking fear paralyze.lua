	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SLEEP)
	setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
	setConditionFormula(condition, -0.6, 0, -0.8, 0)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
