local combat = {}

for i = 25, 30 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

	local condition = createConditionObject(CONDITION_POISON)
	setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
	addDamageCondition(condition, 10, 4000, -i)
	addDamageCondition(condition, 10, 4000, -i + 1)
	addDamageCondition(condition, 10, 4000, -i + 2)
	addDamageCondition(condition, 10, 4000, -i + 3)
	addDamageCondition(condition, 10, 4000, -i + 4)

	arr = {
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

	local area = createCombatArea(arr)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(25, 30)], var)
end

