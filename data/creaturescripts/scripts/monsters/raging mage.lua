function onDeath(cid, corpse, deathList)
local chance, pos, pos2 = math.random(1, 100), getCreaturePosition(cid), {x=33143, y=31527, z=2}

if chance < 11 then
doCreatureSay(cid, "MWAAAHAHAAA!! NO ONE!! NO ONE CAN DEFEAT MEEE!!!", TALKTYPE_ORANGE_2, false, 0, pos2)
doSummonCreature("Raging Mage", pos)
else
doCreatureSay(cid, "MWAAAHAHAAA!! NO ONE!! NO ONE CAN DEFEAT MEEE!!!", TALKTYPE_ORANGE_2, false, 0, pos2)
doSummonCreature("Energized Raging Mage", pos)
end
end