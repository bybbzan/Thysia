local combat = {}

for i = 10, 25 do
combat[i] = createCombatObject()
setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 35000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)

	local area = createCombatArea({
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	})

setCombatArea(combat[i], area)
setCombatCondition(combat[i], condition)

end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(10, 25)], var)
end
