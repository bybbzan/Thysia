local combat = {}

for i = 80, 95 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	setConditionParam(condition, CONDITION_PARAM_SKILL_FISTPERCENT, i)

	local area = createCombatArea(AREA_BEAM1)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(80, 95)], var)
end
