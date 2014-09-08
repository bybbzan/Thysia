local combat = {}

for i = 30, 60 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_SOUND_RED)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

	local condition = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
	setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, i)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(30, 60)], var)
end
