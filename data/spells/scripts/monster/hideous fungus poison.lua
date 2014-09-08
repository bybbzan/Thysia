local combat = {}

for i = 25, 30 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_HITBYPOISON)

	local condition = createConditionObject(CONDITION_POISON)
	setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
	addDamageCondition(condition, 10, 4000, -i)
	addDamageCondition(condition, 10, 4000, -i + 1)
	addDamageCondition(condition, 10, 4000, -i + 2)
	addDamageCondition(condition, 10, 4000, -i + 3)
	addDamageCondition(condition, 10, 4000, -i + 4)


	local area = createCombatArea(AREA_SQUARE1X1)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(25, 30)], var)
end

