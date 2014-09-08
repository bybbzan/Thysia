local t = {
    {"TELEPORTS", {x=999, y=995, z=7}, CONST_ME_MAGIC_BLUE},
    {"QUESTS", {x=1003, y=995, z=7}, CONST_ME_MAGIC_BLUE} 
}

function onThink(interval)
    local people = getOnlinePlayers()
    if #people == 0 then
        return true
    end

    for i = 1, #t do
        local v = t[i]
        doCreatureSay(people[1], v[1], TALKTYPE_ORANGE_1, false, 0, v[2])
        doSendMagicEffect(v[2], v[3])
    end
    return true
end