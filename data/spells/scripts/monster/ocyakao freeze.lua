	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)

	local condition = createConditionObject(CONDITION_FREEZING)
	setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
	addDamageCondition(condition, 25, 8000, -8)
	setCombatCondition(combat, condition)

	local area = createCombatArea(AREA_CIRCLE3X3)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
