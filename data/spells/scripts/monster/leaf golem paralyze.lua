local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.25, 0, -0.45, 0)
setCombatCondition(combat, condition)


local area = createCombatArea(AREA_SQUARE1X1)
	setCombatArea(combat, area)
	setCombatCondition(combat, condition)


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end