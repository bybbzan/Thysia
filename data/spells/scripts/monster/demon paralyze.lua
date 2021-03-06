	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 25000)
	setConditionFormula(condition, -0.3, 0, -0.45, 0)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
