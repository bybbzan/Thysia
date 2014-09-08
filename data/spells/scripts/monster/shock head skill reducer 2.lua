local combat = {}

for i = 20, 50 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
	setConditionParam(condition, CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, i)

arr = {
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1 ,1},
{0, 1, 1, 1, 1, 1, 1, 1 ,0},
{0, 0, 1, 1, 1, 1, 1, 0 ,0},
{0, 0, 0, 1, 1, 1, 0, 0, 0}
}

	local area = createCombatArea(arr)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(20, 50)], var)
end