	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
	setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_THROWINGKNIFE)

	local condition = createConditionObject(CONDITION_PARALYZE)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
	setConditionFormula(condition, -0.75, 0, -0.90, 0)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
